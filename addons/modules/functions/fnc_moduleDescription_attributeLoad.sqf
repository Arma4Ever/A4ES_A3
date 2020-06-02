#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN moduleDescription attributeLoad handler
 */

// TEMP: use bi module description
[_this, _config] call bis_fnc_3DENModuleDescription;

// Exit if framework disabled for this display
if (isNil QGVAR(dynamicAttributesEnabled)) exitWith {
  LOG_1("Skipping init of dynamic attribute '%1' (framework disabled for current display).",_configName);
  _inited
};

private _configHierarchy = configHierarchy _config;
private _moduleConfig = _configHierarchy select (count _configHierarchy - 3);

_moduleConfig call {
  
};

// Update module values
GVAR(dynamicAttributesModule) setVariable [QGVAR(moduleValues), GVAR(dynamicAttributesValues)];

INFO_1("Triggering initial refresh of reactive attributes (attributes: %1).",str count GVAR(reactiveAttributes));

// Trigger initial refresh of attributes
call FUNC(refreshReactiveAttributes);
