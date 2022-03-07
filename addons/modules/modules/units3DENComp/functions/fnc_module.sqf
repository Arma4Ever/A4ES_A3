#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * units3DENComp module function
 */

params ["_mode", "_input"];
TRACE_2(QUOTE(EXEC_MODULE_NAME),_mode,_input);

if (is3DEN && {_mode isEqualTo "attributesChanged3DEN"}) exitWith {
  _input params ["_logic"];

  private _mode = (_logic get3DENAttribute QGVAR(mode)) # 0;
  private _dataSaved = (_logic get3DENAttribute QGVAR(dataSaved)) # 0;

  if ((_mode isEqualTo 0) && _dataSaved) exitWith {
    _logic call FUNC(units3DENComp_restoreData);
  };
  if ((_mode isEqualTo 1) && !_dataSaved) exitWith {
    _logic call FUNC(units3DENComp_saveData);
  };
};

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || (_mode isNotEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null or placed by zeus (should not happen)
if (isNull _logic || _isCuratorPlaced) exitWith {};

LOG('Starting init of EXEC_MODULE_NAME.');

#include "\z\a3cs\addons\modules\includes\moduleActivation.sqf"
