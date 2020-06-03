#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN moduleDescription attributeLoad handler
 */

// Exit if framework disabled for this display
if (isNil QGVAR(dynamicAttributesEnabled)) exitWith {
  LOG_1("Skipping init of dynamic attribute '%1' (framework disabled for current display).",_configName);
  _inited
};

private _configHierarchy = configHierarchy _config;
private _moduleConfig = _configHierarchy select (count _configHierarchy - 3);

// TEMP: use bi module description
[_this, _config] call bis_fnc_3DENModuleDescription;

// Update module values
GVAR(dynamicAttributesModule) setVariable [QGVAR(moduleValues), GVAR(dynamicAttributesValues)];

// Add control to controls list
GVAR(allAttributesControls) pushBackUnique [_this, (ctrlPosition _this # 1)];

private _attributesListControl = ctrlParentControlsGroup _this;
private _attributesCategory = ctrlParentControlsGroup _attributesListControl;

// Save original heights of attributes list and category
GVAR(attributesListHeight) = (ctrlPosition _attributesListControl) # 3;
GVAR(attributesCategoryHeight) = (ctrlPosition _attributesCategory) # 3;

// Trigger initial refresh of attributes
INFO_1("Triggering initial refresh of reactive attributes (attributes: %1).",str count GVAR(reactiveAttributes));
call FUNC(refreshReactiveAttributes);

// Get current module warnings
private _entityIDVarName = str (get3DENEntityID GVAR(dynamicAttributesModule));
private _warnings = GVAR(allWarnings) getVariable [_entityIDVarName, []];

// Trigger module warnings update
INFO_1("Triggering initial refresh of module warnings (warnings: %1).",str _warnings);
[_warnings] call FUNC(refreshModuleWarnings);
