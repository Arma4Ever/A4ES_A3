/*
 * Author: SzwedzikPL
 * genFlare module function
 */
#include "script_component.hpp"

if (!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if (_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if (isNull _logic || !_isActivated) exitWith {true};
    if (!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("genFlare: blokuje wykonanie modulu");true};

    //Load module params
    private _color = _logic getVariable ["color", 0];
    private _alt = 66;
    private _velocity = [wind select 0, wind select 1, 30];

    private _posASL = getPosASL _logic;
    private _posATL = (getPosATL _logic) vectorAdd [0, 0, _alt];

    private _projectile = createVehicle [_color, _posATL ,[], 0, "NONE"];
    _projectile setPosATL _posATL;
    _projectile setVelocity _velocity;
    
    //play fired sound
    playSound3D ["a3\missions_f_beta\data\sounds\Showcase_Night\flaregun_4.wss", objNull, false, _posASL];

    //start flare sound loop
    private _soundSource = createSoundSource ["SoundFlareLoop_F", _posATL, [], 0];

    //update flare sound source pos every sec
    [{
        params ["_args","_idPFH"];
        _args params ["_projectile", "_soundSource"];

        //update flare sound source pos
        _soundSource setPosASL (getPosASL _projectile);

        //remove sound source when flare is gone
        if (isNull _projectile) then {
            deleteVehicle _soundSource;
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };
    }, 1, [_projectile, _soundSource]] call CBA_fnc_addPerFrameHandler;

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
