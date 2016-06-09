/*
 * Author: SzwedzikPL
 * fireArtillery module function
 */
#include "script_component.hpp"

if (!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if (_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if (isNull _logic || !_isActivated) exitWith {true};
    if (!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("fireArtillery: blokuje wykonanie modulu");true};

    //Load module params
    private _timeCondition = _logic getVariable ["timeCondition", 0];
    private _countCondition = _logic getVariable ["countCondition", 0];
    private _codeCondition = compile (_logic getVariable ["codeCondition", "true"]);
    private _minDelay = _logic getVariable ["minDelay", 0];
    private _maxDelay = _logic getVariable ["maxDelay", 0];

    if (isNil "_codeCondition") then {_codeCondition = {true};};

    //Save data in logic
    _logic setVariable [QGVAR(fireArtillery_shotsFired), 0];

    //Start fire
    if (_timeCondition > 0 || _countCondition > 0 || (call _codeCondition)) then {
        if (!isMultiplayer) then {systemchat format ["fireArtillery - Rozpoczynam ostrzal"];};
        _logic setVariable [QGVAR(fireArtillery_active), true, true];
        _logic setVariable [QGVAR(fireArtillery_startTime), CBA_missionTime, true];
        private _delay = [_minDelay, _maxDelay] call BIS_fnc_randomNum;
        [DFUNC(fireArtillery_fireShell), _logic, _delay] call CBA_fnc_waitAndExecute;
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
