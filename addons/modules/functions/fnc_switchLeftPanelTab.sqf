#include "script_component.hpp"
#include "\z\a3cs\addons\modules\controlDefines.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * Switches left panel tab
 */

disableserialization;

params ["_control", "_index"];

private _display = findDisplay IDD_DISPLAY3DEN;

["ShowPanelLeft", true] call bis_fnc_3DENInterface;

for "_i" from 0 to 10 do {
  private _idc = _control lbValue _i;
  if (_idc <= 0) exitwith {};
  private _ctrl = _display displayCtrl _idc;
  private _active = (_i isEqualTo _index);
  _ctrl ctrlShow _active;

  // Set focus on active tab
  if (_active) then {
    ctrlSetFocus _ctrl;
  };
};
