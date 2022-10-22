#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * display3DEN onLoad handler
 */
params ["_display"];

private _ctrlMap = _display displayCtrl 51;

GVAR(modulesActRangePreviewsData) = [];

_ctrlMap ctrlAddEventHandler ["draw", {
  params ["_map"];
  {
    _map drawEllipse [
  		_x # 0, _x # 1, _x # 1, 0, [0, 0, 1, 1], "a3\3den\data\cfg3den\trigger\areatexture_ca.paa"
  	];
    _map drawEllipse [
  		_x # 0, _x # 2, _x # 2, 0, [1, 0, 0, 1], "a3\3den\data\cfg3den\trigger\areatexture_ca.paa"
  	];
  } forEach GVAR(modulesActRangePreviewsData);
}];
