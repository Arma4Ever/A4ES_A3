#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles marker shortcut button click
 */
params ["_ctrl"];
TRACE_1("handleButtonClick",_ctrl);

private _display = _ctrl getVariable QGVAR(display);
private _params = _ctrl getVariable QGVAR(params);
_params params ["_shape", "_color", "_timestampState"];

private _shapeIndex = ace_markers_markersCache findIf {(_x # 3) == _shape};
private _colorIndex = ace_markers_markerColorsCache findIf {(_x # 3) == _color};

private _shapeCtrl = _display displayCtrl 1220;
_shapeCtrl lbSetCurSel _shapeIndex;

private _colorCtrl = _display displayCtrl 1221;
_colorCtrl lbSetCurSel _colorIndex;

if (_timestampState > 0) then {
  private _timestampCtrl = _display displayCtrl 1210;
  private _checked = [true, false] select (_timestampState - 1);
  _timestampCtrl cbSetChecked _checked;
  uiNamespace setVariable ["ace_markers_timestampChecked", _checked];
};

// Focus text field
private _textCtrl = _display displayCtrl 101;
ctrlSetFocus _textCtrl;
