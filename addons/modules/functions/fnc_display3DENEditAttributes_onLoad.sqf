#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * display3DENEditAttributes onLoad handler
 */
params ["_display"];

private _selected = get3DENSelected "";
private _modules = _selected deleteAt 3;

// Close display if user is editing more than one module
if !(_selected isEqualTo [[],[],[],[],[]] && {(count _modules) isEqualTo 1}) exitWith {
  INFO_2("Closing display3DENEditAttributes (selected: %1 modules count: %2).",str _selected,str count _modules);

  // Close display
  _display closeDisplay 0;

  // Show error message in next frame
  0 spawn {
    sleep 0.001;
    [
      localize LSTRING(EditingMultipleModulesError_Message),
      localize LSTRING(EditingMultipleModulesError_Title),
      false,
      'OK'
    ] call BIS_fnc_3DENShowMessage;
  };
};

GVAR(dynamicAttributesModule) = _modules # 0;

private _entityIDVarName = str get3DENEntityID GVAR(dynamicAttributesModule);
private _warningsData = GVAR(warningsData) getVariable [_entityIDVarName, [[]]];
_warningsData params ["_warnings"];

GVAR(dynamicAttributesEnabled) = true;
GVAR(dynamicAttributesModuleWarnings) = _warnings;
GVAR(reactiveAttributes) = [];
GVAR(dynamicAttributesValues) = false call CBA_fnc_createNamespace;

// Remove old values namespace from module
private _moduleValues = _module getVariable QGVAR(moduleValues);
if !(isNil "_moduleValues") then {
  _moduleValues call CBA_fnc_deleteNamespace;
};

INFO_1("Loading display3DENEditAttributes (module: '%1').",typeof GVAR(dynamicAttributesModule));

// Cleanup vars on display unload
_display displayAddEventHandler ["onUnload", {
  INFO_1("Unloading display3DENEditAttributes (module: '%1').",typeof GVAR(dynamicAttributesModule));

  if (isNil QGVAR(dynamicAttributesEnabled)) exitWith {};

  GVAR(dynamicAttributesModule) setVariable [QGVAR(moduleValues), GVAR(dynamicAttributesValues)];

  GVAR(dynamicAttributesEnabled) = nil;
  GVAR(dynamicAttributesModule) = nil;
  GVAR(reactiveAttributes) = nil;
  GVAR(dynamicAttributesValues) = nil;
}];
