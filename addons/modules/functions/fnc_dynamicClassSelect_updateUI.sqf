#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates UI (labels) of 3DEN dynamicClassSelect
 */

params ["_ctrlGroup"];

private _ctrlClassList = _this controlsGroupCtrl 101;
private _ctrlClassListModeTitle = _this controlsGroupCtrl 103;
private _ctrlClassListTitle = _this controlsGroupCtrl 107;
private _ctrlClassListDesc = _this controlsGroupCtrl 106;

private _moduleSource = GVAR(dynamicAttributesValues) getVariable [QGVAR(source), 0];
private _moduleClassListMode = GVAR(dynamicAttributesValues) getVariable [QGVAR(classListMode), 0];
