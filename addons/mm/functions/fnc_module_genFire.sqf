/*
 * Author: SzwedzikPL
 * genFire module function
 */
#include "script_component.hpp"

if (!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if (_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if (isNull _logic || !_isActivated) exitWith {true};
    if (!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("genFire: blokuje wykonanie modulu");true};

    private _duration = _logic getVariable ["duration", 0];

    //create particle emitter
    private _emitter = createVehicle ["#particlesource", (getPos _logic), [], 0, "CAN_COLLIDE"];
    _emitter setPosASL (getPosASL _logic);
    _logic setVariable ["emitter", _emitter, true];

    //create light point
    _lightPoint = createVehicle ["#lightpoint", (getPos _logic), [], 0, "CAN_COLLIDE"];
    _lightPoint setPosASL ((getPosASL _logic) vectorAdd [0,0,0.5]);
    _logic setVariable ["lightPoint", _lightPoint, true];

    //send effect init to all clients
    [_logic] remoteExecCall [QFUNC(genFireLocal), 0, true];

    //effect duration
    if (_duration > 0) then {
        [{
            params ["_logic"];
            private _emitter = _logic getVariable ["emitter", objNull];
            private _lightPoint = _logic getVariable ["lightPoint", objNull];

            deleteVehicle _emitter;
            deleteVehicle _lightPoint;
        }, [_logic], _duration] call CBA_fnc_waitAndExecute;
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
