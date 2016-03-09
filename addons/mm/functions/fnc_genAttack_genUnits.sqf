/*
 * Author: SzwedzikPL
 * genAttack unit generator
 */
#include "script_component.hpp"

params ["_place"];

private _active = _place getVariable [QGVAR(genAttack_active), false];
private _startTime = _place getVariable [QGVAR(genAttack_startTime), 0];

//attack already expired
if(!_active) exitWith {};

//exit if some generated units are still alive
if(count (_place getVariable [QGVAR(genAttack_aliveUnits), []]) > 0) exitWith {};

//Load place data
private _placeSize = _place getVariable [QGVAR(genAttack_placeSize), 0];
private _attackTarget = _place getVariable [QGVAR(genAttack_attackTarget), ""];
private _timeCondition = _place getVariable [QGVAR(genAttack_timeCondition), 0];
private _countCondition = _place getVariable [QGVAR(genAttack_countCondition), 0];
private _codeCondition = _place getVariable [QGVAR(genAttack_codeCondition), {true}];
private _side = _place getVariable [QGVAR(genAttack_side), west];
private _classes = _place getVariable [QGVAR(genAttack_classes), []];
private _waveCount = _place getVariable [QGVAR(genAttack_waveCount), 0];
private _groupCount = _place getVariable [QGVAR(genAttack_groupCount), 0];
private _training = _place getVariable [QGVAR(genAttack_training), "conscripts"];
private _groupVehicleClass = _place getVariable [QGVAR(genAttack_groupVehicle), ""];
private _script = _place getVariable [QGVAR(genAttack_script), {}];
private _ignore = _place getVariable [QGVAR(genAttack_ignore), []];
private _genCount = _place getVariable [QGVAR(genAttack_genCount), 0];

//check time condition
if(_timeCondition > 0 && {(ACE_time - _startTime) >= _timeCondition}) then {_active = false;};
//check count condition
if(_countCondition > 0 && {_genCount >= _countCondition}) then {_active = false;};
//check expression condition
if(!(call _codeCondition)) then {_active = false};
//If attack no longer active set place as not active and log exit
if(!_active) exitWith {
    _place setVariable [QGVAR(genAttack_active), false, true];
    if(!isMultiplayer) then {systemchat "genAttack - Koniec ataku";};
    A3CS_LOGINFO("genAttack_genUnits: Koniec ataku")
};

//if count is unlimited make in always up to the limit
if(_countCondition <= 0) then {_countCondition = (_genCount + _waveCount) + 1;};

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
_place setVariable [QGVAR(genAttack_genCount), _genCount];
if(!isMultiplayer) then {systemchat format ["genAttack - Generuje %1 AI", _unitCount];};
A3CS_LOGINFO_1("genAttack_genUnits: Generuje %1 AI",_unitCount)

for "_spawnCounter" from 1 to _unitCount do {
    private _unitPosition = [];
    private _class = selectRandom _classes;

    if(isNull _group) then {
        _group = createGroup _side;
        _newGroups pushback _group;
        _groupLeader = objNull;
        _groupVehicle = objNull;
    };
    if(isNull _groupLeader) then {
        //There's no leader so generate position of new group leader or group vehicle
        private _goodPosition = false;
        while {!_goodPosition} do {
            _goodPosition = true;
            _unitPosition = _place getPos [random _placeSize, random 360];
            if (!([_unitPosition, _place] call CBA_fnc_inArea)) then {_goodPosition = false;};
            {if([_unitPosition, _x] call CBA_fnc_inArea) then {_goodPosition = false;};} forEach _ignore;
        };
    } else  {
        if(isNull _groupVehicle) then {
            //if no vehicle spawn at leader
            _unitPosition = _groupLeader getPos [(1 + random 3), random 360];
        } else {
            //if vehicle move to vehicle
            _unitPosition = getPos _groupVehicle;
        };
    };
    //Create vehicle is possible
    if(isNull _groupLeader && _groupVehicleClass != "") then {
        _groupVehicle = createVehicle [_groupVehicleClass, _unitPosition, [], 0, "FORM"];
        _groupVehicle setDir (_groupVehicle getDir _attackPosition);
    };
    //Gen unit
    _unit = _group createUnit [_class, _unitPosition, [], 0, "FORM"];
    _groupLeader = leader _group;
    _unit setVariable ["a3cs_generated", true, true];
    _unit setVariable [QGVAR(genAttack), true, true];
    _unit setVariable ["ACE_Name", name _unit, true];
    _unit setVariable [QGVAR(genAttack_place), _place];
    _unit setVariable [QGVAR(genAttack_group), _group];
    _newUnits pushback _unit;
    //Set skill level
    [_unit, _training] call FUNC(setSkillLevel);
    //Spawn custom script
    if(!isNil "_script") then {_unit spawn _script;};
    //Set cache settings to "never"
    _unit setVariable [QGVAR(cacheUnit), "never"];
    //Disable fleeing
    _group allowFleeing 0;
    //Disable suppression
    _unit disableAI "SUPPRESSION";
    //Move to vehicle if present
    if(!isNull _groupVehicle) then {_unit moveInAny _groupVehicle;};
    //If limit is reached force next AI to spawn in new group
    if(count (units _group) >= _groupCount) then {_group = grpNull;};
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
    _waypoint setWaypointCompletionRadius 20;
} forEach _newGroups;

//Save actual data in place
private _aliveGroups = _place getVariable [QGVAR(genAttack_aliveGroups), []];
private _aliveUnits = _place getVariable [QGVAR(genAttack_aliveUnits), []];
_aliveGroups append _newGroups;
_aliveUnits append _newUnits;
_place setVariable [QGVAR(genSoldiers_aliveGroups), _aliveGroups];
_place setVariable [QGVAR(genAttack_aliveUnits), _aliveUnits];

//Add groups in cache array
if(GVAR(cacheInited)) then {GVAR(cacheGroups) append _newGroups;};

//Add groups to curators
if(count allCurators > 0) then {
    {
        private _curator = _x;
        {
            private _group = _x;
            _curator addCuratorEditableObjects [units _group, true];
        } foreach  _newGroups;
    } foreach allCurators;
};

//Transfer groups to headless
[_newGroups] call FUNC(transferGroups);

//Start debug if SP/Editor
if(!isMultiplayer) then {
    _newUnits spawn {
        private _aliveUnits = _this;
        private _allMarkers = [];
        while {({alive _x} count _aliveUnits) > 0} do {
            _allMarkers = [];
            {
                private _unit = _x;
                if(alive _unit) then {
                    private _marker = createMarkerLocal [str _unit, position _unit];
                    _marker setMarkerTypeLocal "mil_triangle";
                    _marker setMarkerColorLocal (if(leader (group _unit) == _unit) then {"ColorRed"} else {"ColorBlack"});
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
