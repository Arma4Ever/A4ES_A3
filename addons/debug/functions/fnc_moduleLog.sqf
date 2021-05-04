#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Debug log from module
 */

if !(is3DENPreview) exitWith {};

private _params = +_this;
if ((count _params) < 2) exitWith {};

private _module = _params deleteAt 0;
private _moduleName = getText ((configOf _module) >> "displayName");

_params set [0, (format ["[%1] ", _moduleName]) + (_params # 0)];

diag_log text format _params;
