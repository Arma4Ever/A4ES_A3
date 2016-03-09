/*
 * Author: SzwedzikPL
 * genSoldiers module function
 */
#include "script_component.hpp"

if(!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if(_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if(isNull _logic || !_isActivated) exitWith {true};
    if(!(_logic call FUNC(canExecuteModule))) exitWith {A3CS_LOGWARN("genSoldiers: blokuje wykonanie modulu")true};

    //Load module params
    private _place = call compile (_logic getVariable ["place", ""]);
    private _parentUnit = call compile (_logic getvariable ["parentUnit", ""]);
    private _unitCount = _logic getvariable ["unitCount", 0];
    private _side = call compile (_logic getVariable ["side", "west"]);
    private _classes = call compile (_logic getVariable ["classes", "[]"]);
    private _groupCount = _logic getVariable ["groupCount", 0];
    private _training = _logic getvariable ["training", "conscripts"];
    private _behaviour = _logic getvariable ["behaviour", "patrol"];
    private _script = compile (_logic getVariable ["script", ""]);
    private _ignore = call compile (_logic getVariable ["ignore", "[]"]);

    //Save data in resp trigger
    private _aliveUnits = [];
    private _aliveGroups = [];

    _place setVariable [QGVAR(genSoldiers_unitCount), _unitCount];
    _place setVariable [QGVAR(genSoldiers_aliveUnits), _aliveUnits];
    _place setVariable [QGVAR(genSoldiers_aliveGroups), _aliveGroups];

    //Save data about this unit in parent respawn
    if(!isNil "_parentUnit") then {
        private _childUnits = _parentUnit getVariable [QGVAR(genSoldiers_children), []];
        _childUnits pushback _place;
        _parentUnit setVariable [QGVAR(genSoldiers_children), _childUnits];
    };

    //Calc size of spawn place
    private _placeShape = if ((triggerArea _place) select 3) then {"rectangle"} else {"ellipse"};
    private _placeSize = ((triggerArea _place) select 0) max ((triggerArea _place) select 1);
    _placeSize = if (_placeShape == "ellipse") then {_placeSize + (_placeSize/5)} else {_placeSize + (_placeSize/2)};

    if(!isMultiplayer) then {systemchat format ["genSoldiers - Generuje %1 AI", _unitCount];};

    //Start respawn
    private _group = grpNull;
    private _groupLeader = objNull;
    private _spawnCounter = 0;
    for "_spawnCounter" from 1 to _unitCount do {
        private _unitPosition = [];
        private _class = selectRandom _classes;

        if(isNull _group) then {
            _group = createGroup _side;
            _aliveGroups pushback _group;
            _groupLeader = objNull;
        };
        if(isNull _groupLeader) then {
            //There's no leader so generate position of new group leader
            private _goodPosition = false;
            while {!_goodPosition} do {
                _goodPosition = true;
                _unitPosition = _place getPos [random _placeSize, random 360];
                if (!([_unitPosition, _place] call CBA_fnc_inArea)) then {_goodPosition = false;};
                {if([_unitPosition, _x] call CBA_fnc_inArea) then {_goodPosition = false;};} forEach _ignore;
            };
        } else  {
            _unitPosition = _groupLeader getPos [(1 + random 3), random 360];
        };
        _unit = _group createUnit [_class, _unitPosition, [], 0, "FORM"];
        _groupLeader = leader _group;
        _unit setVariable ["a3cs_generated", true, true];
        _unit setVariable [QGVAR(genSoldiers), true, true];
        _unit setVariable ["ACE_Name", name _unit, true];
        _unit setVariable [QGVAR(genSoldiers_place), _place];
        _unit setVariable [QGVAR(genSoldiers_group), _group];
        _aliveUnits pushback _unit;
        //Set skill level
        [_unit, _training] call FUNC(setSkillLevel);
        //Spawn custom script
        if(!isNil "_script") then {_unit spawn _script;};
        //Set cache settings to "no if leader" if parentUnit present or behaviour is patrol
        if(!isNil "_parentUnit" || _behaviour == "patrol") then {
            _unit setVariable [QGVAR(cacheUnit), "noifleader"];
        };
        //If limit is reached force next AI to spawn in new group
        if(count (units _group) >= _groupCount) then {_group = grpNull;};
    };

    //Save actual data in place
    _place setVariable [QGVAR(genSoldiers_aliveUnits), _aliveUnits];
    _place setVariable [QGVAR(genSoldiers_aliveGroups), _aliveGroups];

    //Add waypoints
    if(_behaviour == "patrol") then {
        {
            private _group = _x;
            private _waypointMaxCount = 4;
            private _waypointCounter = 0;
            for "_waypointCounter" from 1 to _waypointMaxCount do {
                private _waypointPosition = _place getPos [(random _placeSize), random 360];
                private _waypoint = _group addWaypoint [_waypointPosition, 0];
                _waypoint setWaypointType (["MOVE", "CYCLE"] select (_waypointCounter == _waypointMaxCount));
                _waypoint setWaypointBehaviour "SAFE";
                _waypoint setWaypointCombatMode "RED";
                _waypoint setWaypointSpeed "LIMITED";
                _waypoint setWaypointCompletionRadius 5;
            };
        } forEach _aliveGroups;
    };
    if(_behaviour == "defend") then {
        {
            private _group = _x;
            private _waypointPosition = _place getPos [(random _placeSize), random 360];
            private _waypoint = _group addWaypoint [_waypointPosition, 0];
            _waypoint setWaypointType "HOLD";
            _waypoint setWaypointBehaviour "COMBAT";
            _waypoint setWaypointCombatMode "RED";
            _waypoint setWaypointSpeed "NORMAL";
            _waypoint setWaypointCompletionRadius 30;
            _staticWeapons = _waypointPosition nearEntities ["StaticWeapon", 30];
            {
                private _static = _x;
                private _getInThisStatic = true;
                if(_static isKindOf "StaticMortar") then {_getInThisStatic = false;};
                if(!canMove _static) then {_getInThisStatic = false;};
                if(!isNull (gunner _static)) then {_getInThisStatic = false;};
                if(_getInThisStatic) then {
                    private _unit = objNull;
                    {if(_x == vehicle _x) then {_unit = _x;};} forEach (units _group);
                    _unit assignAsGunner _static;
                    _unit moveInGunner _static;
                };
            } forEach _staticWeapons;
        } forEach _aliveGroups;
    };
    if(_behaviour == "base") then {
        {
            private _group = _x;
            private _waypointPosition = _place getPos [(random _placeSize), random 360];
            private _waypoint = _group addWaypoint [_waypointPosition, 0];
            _waypoint setWaypointType "HOLD";
            _waypoint setWaypointBehaviour "SAFE";
            _waypoint setWaypointCombatMode "RED";
            _waypoint setWaypointSpeed "LIMITED";
            _waypoint setWaypointCompletionRadius 30;
        } forEach _aliveGroups;
    };

    //Set place as respawned
    _place setVariable [QGVAR(genSoldiers_respawned), true];

    //Add groups in cache array
    if(GVAR(cacheInited)) then {GVAR(cacheGroups) append _aliveGroups;};

    //Add groups to curators
    if(count allCurators > 0) then {
        {
            private _curator = _x;
            {
                private _group = _x;
                _curator addCuratorEditableObjects [units _group, true];
            } foreach  _aliveGroups;
        } foreach allCurators;
    };

    //Transfer groups to headless
    [_aliveGroups] call FUNC(transferGroups);

    //Start debug if SP/Editor
    if(!isMultiplayer) then {
        _aliveUnits spawn {
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

    //Set as disposable if possible
    _logic call FUNC(setDisposable);
};
// EDEN - When some attributes were changed (including position and rotation)
if(_mode == "attributesChanged3DEN") then {};
// EDEN - When added to the world (e.g., after undoing and redoing creation)
if(_mode == "registeredToWorld3DEN") then {};
// When removed from the world (i.e., by deletion or undoing creation)
if(_mode == "unregisteredFromWorld3DEN") then {};
// EDEN - When connection to object changes (i.e., new one is added or existing one removed)
if(_mode == "connectionChanged3DEN") then {};

true
