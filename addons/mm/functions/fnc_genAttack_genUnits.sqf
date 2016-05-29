/*
 * Author: SzwedzikPL
 * genAttack unit generator
 */
#include "script_component.hpp"

params ["_logic"];

private _active = _logic getVariable [QGVAR(genAttack_active), false];
private _startTime = _logic getVariable [QGVAR(genAttack_startTime), 0];

//attack already expired
if (!_active) exitWith {};

//exit if some generated units are still alive
if (count (_logic getVariable [QGVAR(genAttack_aliveUnits), []]) > 0) exitWith {};

//Load logic data
private _logicAreaParams = _logic getvariable "objectArea";
private _attackTarget = _logic getVariable ["attackTarget", ""];
private _timeCondition = _logic getVariable ["timeCondition", 0];
private _countCondition = _logic getVariable ["countCondition", 0];
private _codeCondition = compile (_logic getVariable ["codeCondition", "true"]);
private _side = call compile (_logic getVariable ["side", "west"]);
private _classes = call compile (_logic getVariable ["classes", "[]"]);
private _waveCount = _logic getVariable ["waveCount", 0];
private _groupCount = _logic getVariable ["groupCount", 0];
private _training = _logic getVariable ["training", "conscripts"];
private _formation = _logic getvariable ["formation", "COLUMN"];
private _vehicle = _logic getVariable ["vehicle", ""];
private _script = compile (_logic getVariable ["script", ""]);

private _genCount = _logic getVariable [QGVAR(genAttack_genCount), 0];

//Calc size of logic
_logicAreaParams params ["_logicSizeX","_logicSizeY", "_logicAngle", "_logicIsRectangle"];
private _logicArea = [_logic, _logicSizeX, _logicSizeY, _logicAngle, _logicIsRectangle];
private _logicSize = _logicSizeX max _logicSizeY;

//check time condition
if (_timeCondition > 0 && {(CBA_missionTime - _startTime) >= _timeCondition}) then {_active = false;};
//check count condition
if (_countCondition > 0 && {_genCount >= _countCondition}) then {_active = false;};
//check expression condition
if (!(call _codeCondition)) then {_active = false};
//If attack no longer active set logic as not active and log exit
if (!_active) exitWith {
    _logic setVariable [QGVAR(genAttack_active), false, true];
    if (!isMultiplayer) then {systemchat "genAttack - Koniec ataku";};
};

//if count is unlimited make in always up to the limit
if (_countCondition <= 0) then {_countCondition = (_genCount + _waveCount) + 1;};

//Start respawn
private _newGroups = [];
private _newUnits = [];
private _group = grpNull;
private _groupLeader = objNull;
private _groupVehicle = objNull;
private _unitCount = (_countCondition - _genCount) min _waveCount;
private _spawnCounter = 0;
private _attackPosition = getMarkerPos _attackTarget;

//Save gen counter
_genCount = _genCount + _unitCount;
_logic setVariable [QGVAR(genAttack_genCount), _genCount];
if (!isMultiplayer) then {systemchat format ["genAttack - Generuje %1 AI", _unitCount];};
TRACE_1("genAttack_genUnits: Generuje AI",_unitCount);

for "_spawnCounter" from 1 to _unitCount do {
    private _class = selectRandom _classes;
    private _unitPosition = [];

    if (isNull _group) then {
        _group = createGroup _side;
        _newGroups pushback _group;
        _groupLeader = objNull;
        _groupVehicle = objNull;
        _unitPosition = [];
    };
    if (isNull _groupLeader) then {
        private _goodPosition = false;
        while {!_goodPosition} do {
            _goodPosition = true;
            _unitPosition = _logic getPos [random _logicSize, random 360];
            if (!(_unitPosition inArea _logicArea)) then {_goodPosition = false;};
        };
    } else  {
        if (!isNull _groupVehicle) then {
            //if vehicle move to vehicle
            _unitPosition = getPos _groupVehicle;
        } else {
            //if no vehicle spawn at leader
            _unitPosition = _groupLeader getPos [(1 + random 3), random 360];
        };
    };
    //Create vehicle is possible
    if (_vehicle != "" && {isNull _groupVehicle}) then {
        _groupVehicle = createVehicle [_vehicle, _unitPosition, [], 0, "FORM"];
        _groupVehicle setDir (_groupVehicle getDir _attackPosition);
    };
    //Gen unit
    _unit = _group createUnit [_class, _unitPosition, [], 0, "FORM"];
    _groupLeader = leader _group;
    _unit setVariable ["a3cs_generated", true, true];
    _unit setVariable [QGVAR(genAttack), true, true];
    _unit setVariable ["ACE_Name", name _unit, true];
    _unit setVariable [QGVAR(genAttack_logic), _logic];
    _unit setVariable [QGVAR(genAttack_group), _group];
    _newUnits pushback _unit;
    //Set skill level
    [_unit, _training] call FUNC(setSkillLevel);
    _unit setVariable [QGVAR(training), _training, true];
    //Set cache settings to "never"
    _unit setVariable [QGVAR(cacheUnit), "never"];
    //Disable fleeing
    _group allowFleeing 0;
    //Move to vehicle if present
    if (!isNull _groupVehicle) then {_unit moveInAny _groupVehicle;};
    //If limit is reached force next AI to spawn in new group
    if (count (units _group) >= _groupCount) then {_group = grpNull;};
};

//Add waypoints
{
    private _group = _x;
    private _waypointPosition = _attackPosition;
    private _waypoint = _group addWaypoint [_waypointPosition, 0];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointBehaviour "AWARE";
    _waypoint setWaypointCombatMode "RED";
    _waypoint setWaypointSpeed "NORMAL";
    _waypoint setWaypointFormation _formation;
    _waypoint setWaypointCompletionRadius 20;
} forEach _newGroups;

//Save actual data in logic
private _aliveGroups = _logic getVariable [QGVAR(genAttack_aliveGroups), []];
private _aliveUnits = _logic getVariable [QGVAR(genAttack_aliveUnits), []];
_aliveGroups append _newGroups;
_aliveUnits append _newUnits;
_logic setVariable [QGVAR(genSoldiers_aliveGroups), _aliveGroups];
_logic setVariable [QGVAR(genAttack_aliveUnits), _aliveUnits];

//Add groups in cache array - not in genAttack
//if (GVAR(cacheInited)) then {GVAR(cacheGroups) append _newGroups;};

//Spawn custom script
if (!isNil "_script") then {
    {_x spawn _script;} forEach _newUnits;
};

//Add groups to curators
//ace_zeus to the same?
/*
if (count allCurators > 0) then {
    {
        private _curator = _x;
        {
            private _group = _x;
            _curator addCuratorEditableObjects [units _group, true];
        } foreach  _newGroups;
    } foreach allCurators;
};
*/

//Transfer groups to headless
[_newGroups] call FUNC(transferGroups);

//Start debug if SP/Editor
if (!isMultiplayer) then {
    _newUnits spawn {
        private _aliveUnits = _this;
        private _allMarkers = [];
        while {({alive _x} count _aliveUnits) > 0} do {
            _allMarkers = [];
            {
                private _unit = _x;
                if (alive _unit) then {
                    private _marker = createMarkerLocal [str _unit, position _unit];
                    _marker setMarkerTypeLocal "mil_triangle";
                    _marker setMarkerColorLocal (if (leader (group _unit) == _unit) then {"ColorRed"} else {"ColorBlack"});
                    _marker setMarkerSizeLocal [1, 1];
                    _marker setMarkerDirLocal (getDir _unit);
                    _allMarkers pushBack _marker;
                } else {
                    _aliveUnits deleteAt (_aliveUnits find _unit);
                };
            } forEach +_aliveUnits;
            sleep 0.1;
            {deleteMarkerLocal _x;} forEach _allMarkers;
        };
    };
};
