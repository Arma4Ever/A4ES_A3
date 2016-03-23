/*
 * Author: SzwedzikPL
 * fireArtillery module function
 */
#include "script_component.hpp"

if(!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if(_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if(isNull _logic || !_isActivated) exitWith {true};
    if(!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("fireArtillery: blokuje wykonanie modulu");true};

    //Load module params
    private _place = call compile (_logic getVariable ["place", ""]);
    private _ammo = _logic getVariable ["ammo", "Sh_82mm_AMOS"];
    private _timeCondition = _logic getVariable ["timeCondition", 0];
    private _countCondition = _logic getVariable ["countCondition", 0];
    private _codeCondition = compile (_logic getVariable ["codeCondition", "true"]);
    private _minDelay = _logic getVariable ["minDelay", 0];
    private _maxDelay = _logic getVariable ["maxDelay", 0];

    if(isNil "_codeCondition") then {_codeCondition = {true};};

    //Save data in resp trigger
    _place setVariable [QGVAR(fireArtillery_ammo), _ammo];
    _place setVariable [QGVAR(fireArtillery_timeCondition), _timeCondition];
    _place setVariable [QGVAR(fireArtillery_countCondition), _countCondition];
    _place setVariable [QGVAR(fireArtillery_codeCondition), _codeCondition];
    _place setVariable [QGVAR(fireArtillery_minDelay), _minDelay];
    _place setVariable [QGVAR(fireArtillery_maxDelay), _maxDelay];

    _place setVariable [QGVAR(fireArtillery_shotsFired), 0];

    //Calc size of spawn place
    private _placeShape = if ((triggerArea _place) select 3) then {"rectangle"} else {"ellipse"};
    private _placeSize = ((triggerArea _place) select 0) max ((triggerArea _place) select 1);
    _placeSize = if (_placeShape == "ellipse") then {_placeSize + (_placeSize/5)} else {_placeSize + (_placeSize/2)};
    _place setVariable [QGVAR(fireArtillery_placeSize), _placeSize];

    //Start fire
    if(_timeCondition > 0 || _countCondition > 0 || (call _codeCondition)) then {
        if(!isMultiplayer) then {systemchat format ["fireArtillery - Rozpoczynam ostrzal"];};
        _place setVariable [QGVAR(fireArtillery_active), true, true];
        _place setVariable [QGVAR(fireArtillery_startTime), ACE_time, true];
        private _delay = [_minDelay, _maxDelay] call BIS_fnc_randomNum;
        [DFUNC(fireArtillery_fireShell), _place, _delay] call ace_common_fnc_waitAndExecute;
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
