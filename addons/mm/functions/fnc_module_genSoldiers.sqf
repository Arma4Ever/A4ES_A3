/*
 * Author: SzwedzikPL
 * genSoldiers module function
 */
#include "script_component.hpp"

if (!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if (_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if (isNull _logic || !_isActivated) exitWith {true};
    if (!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("genSoldiers: blokuje wykonanie modulu");true};

    //Load module params
    private _logicAreaParams = _logic getvariable "objectArea";
    private _parentUnit = call compile (_logic getvariable ["parentUnit", ""]);
    private _unitCount = _logic getvariable ["unitCount", 0];
    private _side = call compile (_logic getVariable ["side", "west"]);
    private _classes = call compile (_logic getVariable ["classes", "[]"]);
    private _groupCount = _logic getVariable ["groupCount", 0];
    private _training = _logic getvariable ["training", "conscripts"];
    private _vehicle = _logic getvariable ["vehicle", ""];
    private _behaviour = _logic getvariable ["behaviour", "patrol"];
    private _patrolWaypointCount = _logic getvariable ["patrolWaypointCount", 4];
    private _patrolWaypoints = call compile (_logic getVariable ["patrolWaypoints", "[]"]);
    private _formation = _logic getvariable ["formation", "COLUMN"];
    private _cacheSetting = _logic getvariable ["cache", "noifleader"];
    private _cacheModule = (_logic getVariable ["cacheModule", 1]) > 0;
    private _script = compile (_logic getVariable ["script", ""]);

    if (isNil "_classes") then {_classes = [];};
    if (isNil "_patrolWaypoints") then {_patrolWaypoints = [];};

    //Calc size of logic and save data for cache
    _logicAreaParams params ["_logicSizeX","_logicSizeY", "_logicAngle", "_logicIsRectangle"];
    private _logicArea = [_logic, _logicSizeX, _logicSizeY, _logicAngle, _logicIsRectangle];
    private _logicSize = _logicSizeX max _logicSizeY;
    private _logicSizeMin = _logicSizeX min _logicSizeY;
    _logic setVariable ["logicSize", _logicSize];

    //check distance to nearest player if cache is inited
    private _isVisibleForPlayers = false;
    if (GVAR(cacheInited) && {_cacheModule}) then {
        private _playableUnits = [[player], playableUnits] select isMultiplayer;
        {
            private _player = vehicle _x;
            private _distance = ((_logic distance _player) - _logicSize) max 0;
            if (GVAR(cacheDistanceLand) > 0) then {
                if (_distance < GVAR(cacheDistanceLand) && {_player iskindOf "Land"}) exitWith {_isVisibleForPlayers = true;};
                if (_distance < GVAR(cacheDistanceLand) && {_player iskindOf "Ship"}) exitWith {_isVisibleForPlayers = true;};
            };
            if (GVAR(cacheDistanceHelicopters) > 0) then {
                if (_distance < GVAR(cacheDistanceHelicopters) && {_player iskindOf "Helicopter"}) exitWith {_isVisibleForPlayers = true;};
            };
            if (GVAR(cacheDistancePlanes) > 0) then {
                if (_distance < GVAR(cacheDistancePlanes) && {_player iskindOf "Plane"}) exitWith {_isVisibleForPlayers = true;};
            };
        } forEach _playableUnits;
    };

    if (!_isVisibleForPlayers && {_cacheModule}) exitWith {GVAR(cacheModules) pushBack _logic;};

    //Save data in logic
    private _aliveUnits = [];
    private _aliveGroups = [];

    _logic setVariable [QGVAR(genSoldiers_unitCount), _unitCount];
    _logic setVariable [QGVAR(genSoldiers_aliveUnits), _aliveUnits];
    _logic setVariable [QGVAR(genSoldiers_aliveGroups), _aliveGroups];
    //api
    _logic setVariable [QGVAR(genSoldiers_aliveUnitsCount), count _aliveUnits, true];

    //Save data about this unit in parent respawn
    if (!isNil "_parentUnit") then {
        private _childUnits = _parentUnit getVariable [QGVAR(genSoldiers_children), []];
        _childUnits pushback _logic;
        _parentUnit setVariable [QGVAR(genSoldiers_children), _childUnits];
    };

    //SP debug log
    if (!isMultiplayer) then {systemchat format ["genSoldiers - Generuje %1 AI", _unitCount];};

    //Start respawn
    private _group = grpNull;
    private _groupLeader = objNull;
    private _groupVehicle = objNull;
    private _spawnCounter = 0;
    for "_spawnCounter" from 1 to _unitCount do {
        private _unitPosition = [];
        private _class = selectRandom _classes;

        if (isNull _group) then {
            _group = createGroup _side;
            _aliveGroups pushback _group;
            _groupLeader = objNull;
            _groupVehicle = objNull;
        };
        if (isNull _groupLeader) then {
            //There's no leader so generate position of new group leader
            private _goodPosition = false;
            while {!_goodPosition} do {
                _goodPosition = true;
                _unitPosition = _logic getPos [random _logicSize, random 360];
                if (!(_unitPosition inArea _logicArea)) then {_goodPosition = false;};
            };
        } else  {
            if (_vehicle != "" && {!isNull _groupVehicle}) then {
                _unitPosition = _groupVehicle getPos [(1 + random 3), random 360];
            } else {
                _unitPosition = _groupLeader getPos [(1 + random 3), random 360];
            };
        };
        if (_vehicle != "" && {isNull _groupVehicle}) then {
            private _logicRoads = _logic nearRoads _logicSize;
            private _vehiclePosition = [];
            private _vehicleDir = random 360;
            if (count _logicRoads > 0) then {
                private _goodPosition = false;
                while {!_goodPosition} do {
                    if (count _logicRoads > 0) then {
                        _goodPosition = true;
                        private _road = selectRandom _logicRoads;
                        _vehiclePosition = getPos _road;
                        _vehicleDir = getDir _road;
                        if (!(_vehiclePosition inArea _logicArea)) then {
                            _goodPosition = false;
                            _logicRoads deleteAt (_logicRoads find _road);
                        };
                    } else {
                        _vehiclePosition = _unitPosition;
                    };
                };
            } else {
                _vehiclePosition = _unitPosition;
            };
            _groupVehicle = createVehicle [_vehicle, _vehiclePosition, [], 0, "FORM"];
            _groupVehicle setDir _vehicleDir;
        };
        _unit = _group createUnit [_class, _unitPosition, [], 0, "FORM"];
        _groupLeader = leader _group;
        _unit setVariable ["a3cs_generated", true, true];
        _unit setVariable [QGVAR(genSoldiers), true, true];
        _unit setVariable ["ACE_Name", name _unit, true];
        _unit setVariable [QGVAR(genSoldiers_logic), _logic];
        _unit setVariable [QGVAR(genSoldiers_group), _group];
        _aliveUnits pushback _unit;
        //Set skill level
        [_unit, _training] call FUNC(setSkillLevel);
        _unit setVariable [QGVAR(training), _training, true];
        //Set cache settings
        _unit setVariable [QGVAR(cacheUnit), _cacheSetting];
        //Move unit in vehicle
        if (_vehicle != "" && {!isNull _groupVehicle}) then {_unit moveInAny _groupVehicle;};
        //If limit is reached force next AI to spawn in new group
        if (count (units _group) >= _groupCount) then {_group = grpNull;};
    };

    //Save actual data in place
    _logic setVariable [QGVAR(genSoldiers_aliveUnits), _aliveUnits];
    _logic setVariable [QGVAR(genSoldiers_aliveGroups), _aliveGroups];
    //api
    _logic setVariable [QGVAR(genSoldiers_aliveUnitsCount), count _aliveUnits, true];

    //Add waypoints
    if (_behaviour == "patrol") then {
        {
            private _group = _x;
            private _waypointCounter = 0;
            private _lastAddedWaypoint = [];
            if (count _patrolWaypoints > 0) then {
                {
                    private _markerPosition = getMarkerPos _x;
                    private _waypoint = _group addWaypoint [_markerPosition, 0];
                    _waypoint setWaypointType "MOVE";
                    _waypoint setWaypointBehaviour "SAFE";
                    _waypoint setWaypointCombatMode "RED";
                    _waypoint setWaypointSpeed "LIMITED";
                    _waypoint setWaypointFormation _formation;
                    _waypoint setWaypointCompletionRadius 2;

                    if ((_forEachIndex + 1) == count _patrolWaypoints) then {
                        private _lastWaypoint = _group addWaypoint [_markerPosition, 0];
                        _lastWaypoint setWaypointType "CYCLE";
                        _lastWaypoint setWaypointBehaviour "SAFE";
                        _lastWaypoint setWaypointCombatMode "RED";
                        _lastWaypoint setWaypointSpeed "LIMITED";
                        _lastWaypoint setWaypointFormation _formation;
                        _lastWaypoint setWaypointCompletionRadius 2;
                    };
                } forEach _patrolWaypoints;
            } else {
                for "_waypointCounter" from 1 to _patrolWaypointCount do {
                    private _waypointPosition = [];
                    private _goodPosition = false;
                    while {!_goodPosition} do {
                        _goodPosition = true;
                        _waypointPosition = _logic getPos [random _logicSize, random 360];
                        if (!(_waypointPosition inArea _logicArea)) then {_goodPosition = false;};
                        if (count _lastAddedWaypoint > 0) then {
                            if ((_waypointPosition distance (waypointPosition _lastAddedWaypoint)) < (_logicSizeMin/3)) then {_goodPosition = false;};
                        };
                    };
                    private _waypoint = _group addWaypoint [_waypointPosition, 0];
                    _waypoint setWaypointType "MOVE";
                    _waypoint setWaypointBehaviour "SAFE";
                    _waypoint setWaypointCombatMode "RED";
                    _waypoint setWaypointSpeed "LIMITED";
                    _waypoint setWaypointFormation _formation;
                    _waypoint setWaypointCompletionRadius 5;
                    _lastAddedWaypoint = _waypoint;
                    if (_waypointCounter == _patrolWaypointCount) then {
                        private _lastWaypoint = _group addWaypoint [_waypointPosition, 0];
                        _lastWaypoint setWaypointType "CYCLE";
                        _lastWaypoint setWaypointBehaviour "SAFE";
                        _lastWaypoint setWaypointCombatMode "RED";
                        _lastWaypoint setWaypointSpeed "LIMITED";
                        _lastWaypoint setWaypointFormation _formation;
                        _lastWaypoint setWaypointCompletionRadius 2;
                    };
                };
            };
        } forEach _aliveGroups;
    };
    if (_behaviour == "defend") then {
        {
            private _group = _x;
            private _waypointPosition = _logic getPos [(random _logicSize), random 360];
            private _waypoint = _group addWaypoint [_waypointPosition, 0];
            _waypoint setWaypointType "MOVE";
            _waypoint setWaypointBehaviour "COMBAT";
            _waypoint setWaypointCombatMode "RED";
            _waypoint setWaypointSpeed "NORMAL";
            _waypoint setWaypointFormation _formation;
            _waypoint setWaypointCompletionRadius 30;
            _staticWeapons = _waypointPosition nearEntities ["StaticWeapon", 30];
            {
                private _static = _x;
                private _getInThisStatic = true;
                if (_static isKindOf "StaticMortar") then {_getInThisStatic = false;};
                if (!canMove _static) then {_getInThisStatic = false;};
                if (!isNull (gunner _static)) then {_getInThisStatic = false;};
                if (_getInThisStatic) then {
                    private _unit = objNull;
                    {if (_x == vehicle _x) then {_unit = _x;};} forEach (units _group);
                    _unit assignAsGunner _static;
                    _unit moveInGunner _static;
                };
            } forEach _staticWeapons;
        } forEach _aliveGroups;
    };
    if (_behaviour == "base") then {
        {
            private _group = _x;
            private _waypointPosition = _logic getPos [(random _logicSize), random 360];
            private _waypoint = _group addWaypoint [_waypointPosition, 0];
            _waypoint setWaypointType "MOVE";
            _waypoint setWaypointBehaviour "SAFE";
            _waypoint setWaypointCombatMode "RED";
            _waypoint setWaypointSpeed "LIMITED";
            _waypoint setWaypointFormation _formation;
            _waypoint setWaypointCompletionRadius 30;
        } forEach _aliveGroups;
    };

    //Set place as respawned
    _logic setVariable [QGVAR(genSoldiers_respawned), true, true];

    //Add groups in cache array
    if (GVAR(cacheInited)) then {GVAR(cacheGroups) append _aliveGroups;};

    //Spawn custom script
    if (!isNil "_script") then {
        {_x spawn _script;} forEach _aliveUnits;
    };

    //Add groups to curators
    //ace_zeus to the same?
    /*if (count allCurators > 0) then {
        {
            private _curator = _x;
            {
                private _group = _x;
                _curator addCuratorEditableObjects [units _group, true];
            } foreach  _aliveGroups;
        } foreach allCurators;
    };*/

    //Transfer groups to headless
    [_aliveGroups] call FUNC(transferGroups);

    //Start debug if SP/Editor
    if (!isMultiplayer) then {
        _aliveUnits spawn {
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

    //Set as disposable if possible
    _logic call FUNC(setDisposable);
};
// EDEN - When some attributes were changed (including position and rotation)
if (_mode == "attributesChanged3DEN") then {};
// EDEN - When added to the world (e.g., after undoing and redoing creation)
if (_mode == "registeredToWorld3DEN") then {};
// When removed from the world (i.e., by deletion or undoing creation)
if (_mode == "unregisteredFromWorld3DEN") then {};
// EDEN - When connection to object changes (i.e., new one is added or existing one removed)
if (_mode == "connectionChanged3DEN") then {};

true
