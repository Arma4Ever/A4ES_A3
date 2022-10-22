#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles weapon changed CBA player EH
 */

private _weapon = primaryWeapon player;
if (_weapon == GVAR(curPrimaryWeap)) exitWith {};

GVAR(curPrimaryWeap) = _weapon;

private _advBallEnabled = (
  (isClass (configFile >> QGVAR(AB_weapons) >> _weapon)) ||
  {_weapon in (missionNamespace getVariable [QGVAR(ABWeapons), []])}
);

if (_advBallEnabled isNotEqualTo (player getVariable [QGVAR(advBallEnabled), false])) then {
  player setVariable [QGVAR(advBallEnabled), _advBallEnabled, true];
};
