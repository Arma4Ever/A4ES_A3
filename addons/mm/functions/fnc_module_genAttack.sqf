/*
 * Author: SzwedzikPL
 * genAttack module function
 */
#include "script_component.hpp"

if(!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if(_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if(isNull _logic || !_isActivated) exitWith {true};
    if(!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("genAttack: blokuje wykonanie modulu");true};

    //Load module params
    private _place = call compile (_logic getVariable ["place", ""]);
    private _attackTarget = _logic getVariable ["attackTarget", ""];
    private _timeCondition = _logic getVariable ["timeCondition", 0];
    private _countCondition = _logic getVariable ["countCondition", 0];
    private _codeCondition = compile (_logic getVariable ["codeCondition", "true"]);
    private _side = call compile (_logic getVariable ["side", "west"]);
    private _classes = call compile (_logic getVariable ["classes", "[]"]);
    private _waveCount = _logic getVariable ["waveCount", 0];
    private _groupCount = _logic getVariable ["groupCount", 0];
    private _training = _logic getVariable ["training", "conscripts"];
    private _groupVehicle = _logic getVariable ["groupVehicle", ""];
    private _script = compile (_logic getVariable ["script", ""]);
    private _ignore = call compile (_logic getVariable ["ignore", "[]"]);

    if(isNil "_codeCondition") then {_codeCondition = {true};};

    _timeCondition = _timeCondition max 0;
    _countCondition = _countCondition max 0;

    //Save data in resp trigger
    _place setVariable [QGVAR(genAttack_attackTarget), _attackTarget];
    _place setVariable [QGVAR(genAttack_timeCondition), _timeCondition];
    _place setVariable [QGVAR(genAttack_countCondition), _countCondition];
    _place setVariable [QGVAR(genAttack_codeCondition), _codeCondition];
    _place setVariable [QGVAR(genAttack_side), _side];
    _place setVariable [QGVAR(genAttack_classes), _classes];
    _place setVariable [QGVAR(genAttack_waveCount), _waveCount];
    _place setVariable [QGVAR(genAttack_groupCount), _groupCount];
    _place setVariable [QGVAR(genAttack_training), _training];
    _place setVariable [QGVAR(genAttack_groupVehicle), _groupVehicle];
    _place setVariable [QGVAR(genAttack_script), _script];
    _place setVariable [QGVAR(genAttack_ignore), _ignore];

    _place setVariable [QGVAR(genAttack_aliveUnits), []];
    _place setVariable [QGVAR(genAttack_aliveGroups), []];
    _place setVariable [QGVAR(genAttack_genCount), 0];

    //Calc size of spawn place
    private _placeShape = if ((triggerArea _place) select 3) then {"rectangle"} else {"ellipse"};
    private _placeSize = ((triggerArea _place) select 0) max ((triggerArea _place) select 1);
    _placeSize = if (_placeShape == "ellipse") then {_placeSize + (_placeSize/5)} else {_placeSize + (_placeSize/2)};
    _place setVariable [QGVAR(genAttack_placeSize), _placeSize];

    //Start respawn
    _place setVariable [QGVAR(genAttack_active), true, true];
    _place setVariable [QGVAR(genAttack_started), true, true];
    _place setVariable [QGVAR(genAttack_startTime), ACE_time, true];
    _place call FUNC(genAttack_genUnits);

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
