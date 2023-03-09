#include "\x\zen\addons\modules\script_component.hpp"
/*
 * Author: mharis001
 * Zeus module function to heal a unit.
 *
 * Arguments:
 * 0: Logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC] call zen_modules_fnc_moduleHeal
 *
 * Public: No
 */

params ["_logic"];

private _unit = attachedTo _logic;
deleteVehicle _logic;

if (isNull _unit) exitWith {
    [LSTRING(NoUnitSelected)] call EFUNC(common,showMessage);
};

if !(_unit isKindOf "CAManBase") exitWith {
    [LSTRING(OnlyInfantry)] call EFUNC(common,showMessage);
};

if (!alive _unit) exitWith {
    [LSTRING(OnlyAlive)] call EFUNC(common,showMessage);
};

[_unit] call EFUNC(common,healUnit);

if (_unit getVariable ["a4es_common_isPlayer", false]) then {
  ["a4es_curatorHealed", [player, _unit]] call CBA_fnc_serverEvent;
};
