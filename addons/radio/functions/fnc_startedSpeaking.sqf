#include "script_component.hpp"
/*
 * Author: ACRE2Team, SzwedzikPL
 * Handles the started speaking event and plays gesture if possible (without interrupting other actions).
 */

params ["_unit", "_radioType"];
TRACE_2("startedSpeaking",_unit,_radioType);

if (
  !(isNull (objectParent _unit)) ||
  {cameraView == "GROUP"} ||
  {ACEGVAR(common,isReloading)} ||
  {isWeaponDeployed _unit} ||
  {(animationState _unit) in GVAR(blackListAnims)} ||
  {(currentWeapon _unit) in (uiNamespace getVariable [QGVAR(binoClasses), []])}
) exitWith {};

private _hasVest = (vest _unit) != "";
private _hasHeadgear = (headgear _unit) != "";
if (!_hasVest && !_hasHeadgear) exitWith {};

private _isHeadset = (_radioType > 0);

if (_hasVest && !_isHeadset) then {
    _unit playActionNow QGVAR(vest);
    _unit setVariable [QGVAR(onRadio), true];
};

if (_hasHeadgear && _isHeadset) then {
    _unit playActionNow QGVAR(helmet);
    _unit setVariable [QGVAR(onRadio), true];
};
