#include "\x\grad_trenches\addons\functions\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support, esteldunedain, Salbei
 * Continue process of digging trench.
 *
 * Arguments:
 * 0: Trench <OBJECT>
 * 1: Unit <OBJECT>
 * 2: SwitchingDigger <BOOLEAN> (optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj, ACE_player] call grad_trenches_functions_fnc_continueDiggingTrench
 *
 * Public: No
 */

params ["_trench", "_unit", ["_switchingDigger", false, [true]]];
TRACE_3("continueDiggingTrench",_trench,_unit,_switchingDigger);

private _actualProgress = _trench getVariable ["ace_trenches_progress", 0];
if (_actualProgress >= 1) exitWith {};


// Mark trench as being worked on
_trench setVariable ["ace_trenches_digging", true, true];
_trench setVariable [QGVAR(diggingType), "UP", true];
_unit setVariable [QGVAR(diggingTrench), true, true];

private _diggers =  (_trench getVariable [QGVAR(diggers), []]);

if (count _diggers > 0 && {!_switchingDigger}) exitWith {
    [_trench, _unit] call FUNC(addDigger);
};

_diggers pushBackUnique _unit;
_trench setVariable [QGVAR(diggers), _diggers, true];

private _digTime = missionNamespace getVariable [getText (configOf _trench >> "ace_trenches_diggingDuration"), 20];

// Create progress bar
private _fnc_onFinish = {
    (_this select 0) params ["_unit", "_trench"];

    _unit setVariable [QGVAR(diggingTrench), false, true];
    [QGVAR(handleTrenchState), [_trench]] call CBA_fnc_serverEvent;
    [QGVAR(handleDiggerToGVAR), [_trench, _unit, false, true]] call CBA_fnc_serverEvent;

    // Save progress global
    _trench setVariable ["ace_trenches_progress", 1, true];

    // Reset animation
    [_unit, "", 1] call ace_common_fnc_doAnimation;
};
private _fnc_onFailure = {
    (_this select 0) params ["_unit", "_trench"];

    _unit setVariable [QGVAR(diggingTrench), false, true];
    [QGVAR(handleDiggerToGVAR), [_trench, _unit, true]] call CBA_fnc_serverEvent;

    // Save progress global
    private _progress = _trench getVariable ["ace_trenches_progress", 0];
    _trench setVariable ["ace_trenches_progress", _progress, true];

    // Reset animation
    [_unit, "", 1] call ace_common_fnc_doAnimation;
};
private _fnc_condition = {
    (_this select 0) params ["_unit", "_trench"];

    if !(_trench getVariable ["ace_trenches_digging", false]) exitWith {false};
    if !(_unit getVariable [QGVAR(diggingTrench), false]) exitWith {false};
    if (count (_trench getVariable [QGVAR(diggers),[]]) <= 0) exitWith {false};
    if (GVAR(stopBuildingAtFatigueMax) && (ace_advanced_fatigue_anReserve <= 0)) exitWith {false};

    true
};

[[_unit, _trench], _fnc_onFinish, _fnc_onFailure, localize "STR_ace_trenches_DiggingTrench", _fnc_condition] call FUNC(progressBar);

if (_actualProgress == 0) then {
    // Remove grass
    {
        private _trenchGrassCutter = createVehicle ["Land_ClutterCutter_medium_F", [0, 0, 0], [], 0, "NONE"];
        private _cutterPos = AGLToASL (_trench modelToWorld _x);
        _cutterPos set [2, getTerrainHeightASL _cutterPos];
        _trenchGrassCutter setPosASL _cutterPos;
        deleteVehicle _trenchGrassCutter;
    } forEach getArray (configOf _trench >> "ace_trenches_grassCuttingPoints");
};

[{
    params ["_args", "_handle"];
    _args params ["_trench", "_unit", "_digTime"];

    private _actualProgress = _trench getVariable ["ace_trenches_progress", 0];
    private _diggerCount = count (_trench getVariable [QGVAR(diggers), []]);

    if (
        !(_trench getVariable ["ace_trenches_digging", false]) ||
        {!(_unit getVariable [QGVAR(diggingTrench), false])} ||
        {_diggerCount <= 0}
    ) exitWith {

        [_handle] call CBA_fnc_removePerFrameHandler;
        if (_diggerCount < 1) then {
            _trench setVariable ["ace_trenches_digging", false, true];
        };

        [QGVAR(handleDiggerToGVAR), [_trench, _unit, true]] call CBA_fnc_serverEvent;
    };

    if (_actualProgress >= 1) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    //## Reduce digging time for engineers
    if ([_unit, 1] call ace_repair_fnc_isEngineer) then {
        _diggerCount = _diggerCount + 1;
    };

    private _newProgress = _actualProgress + (_diggerCount / _digTime);
    
    [_trench, _newProgress, 1.5] call FUNC(setTrenchProgress); // Not too fast so animation is still visible
    [QGVAR(applyFatigue), [_trench, _unit], _unit] call CBA_fnc_targetEvent;

    // Show special effects
    if (GVAR(allowEffects)) then {
        [QGVAR(digFX), [_trench]] call CBA_fnc_globalEvent;

        [_trench] call FUNC(playSound);
    };

}, 1, [_trench, _unit, _digTime]] call CBA_fnc_addPerFrameHandler;

// Play animation
[_unit] call FUNC(loopanimation);

[QGVAR(resetDecay), [_trench]] call CBA_fnc_serverEvent;