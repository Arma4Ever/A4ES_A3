#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * display3DENEditAttributes onLoad handler
 */
params ["_display"];

private _selected = get3DENSelected "";
private _modules = _selected deleteAt 3;

// Exit if modules are not edited
if (_modules isEqualTo []) exitWith {};

// Close display if user is editing more than one module
if !(_selected isEqualTo [[],[],[],[],[]] && {(count _modules) isEqualTo 1}) exitWith {
  LOG_2("Closing display3DENEditAttributes (selected: %1 modules count: %2).",str _selected,str count _modules);

  // Close display
  _display closeDisplay 0;

  // Show error message in next frame
  0 spawn {
    sleep 0.001;
    [
      LLSTRING(EditingMultipleModulesError_Message),
      LLSTRING(EditingMultipleModulesError_Title),
      false,
      'OK'
    ] call BIS_fnc_3DENShowMessage;
  };
};

GVAR(dynamicAttributesEnabled) = true;
GVAR(dynamicAttributesModule) = _modules # 0;

LOG_1("Loading display3DENEditAttributes (module: '%1').",typeof GVAR(dynamicAttributesModule));

GVAR(allAttributesControls) = [];
GVAR(dynamicAttributesValues) = GVAR(dynamicAttributesModule) getVariable [QGVAR(moduleValues), (false call CBA_fnc_createNamespace)];

// Cleanup vars on display unload
_display displayAddEventHandler ["unload", {
  LOG_1("Unloading display3DENEditAttributes (module: '%1').",typeof GVAR(dynamicAttributesModule));

  if (isNil QGVAR(dynamicAttributesEnabled)) exitWith {};

  // Update module values & revalidate in next frame
  GVAR(dynamicAttributesModule) spawn {
    sleep 0.001;
    _this call FUNC(updateModuleValues);
  };

  // Cleanup variables
  GVAR(dynamicAttributesEnabled) = nil;
  GVAR(dynamicAttributesModule) = nil;
  GVAR(moduleWarningsParams) = nil;
  GVAR(moduleWarningsSources) = nil;
  GVAR(allAttributesControls) = nil;
  GVAR(dynamicAttributesValues) = nil;

  uiNamespace setVariable [QGVAR(currentModuleAttributesList), nil];
  uiNamespace setVariable [QGVAR(currentModuleAttributesCategory), nil];
}];
