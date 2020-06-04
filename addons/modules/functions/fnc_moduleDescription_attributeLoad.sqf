#include "script_component.hpp"
#include "\z\a3cs\addons\modules\controlDefines.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN moduleDescription attributeLoad handler
 */

 // Exit if framework disabled for this display
 if (isNil QGVAR(dynamicAttributesEnabled)) exitWith {
   INFO_1("Skipping init of dynamic attribute '%1' (framework disabled for current display).",configName _config);
 };

// Setup config vars
private _configHierarchy = configHierarchy _config;
private _moduleConfig = _configHierarchy select (count _configHierarchy - 3);
private _moduleDescriptionConfig = _moduleConfig >> QGVAR(moduleDescription);

// Setup controls vars
private _descriptionTitle =  _this controlsGroupCtrl IDC_DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE;
private _descriptionGroup = _this controlsGroupCtrl 101;
private _controlText = _descriptionGroup controlsGroupCtrl 100;

// Setup description title bar
private _moduleName = getText (configFile >> "CfgVehicles" >> (typeOf GVAR(dynamicAttributesModule)) >> "displayName");
_descriptionTitle ctrlSetText format [
  localize LSTRING(ModuleDescription_Title),
  _moduleName
];
_descriptionTitle ctrlSetTextColor [0.75, 0.75, 0.75, 1];

// Setup description text
/*
Info

description
triggers
canSyncWith
schemas
positionInfo
canSetArea
*/

// ================================================
// Module description is last loaded element
// Use it to trigger ala "postInit" framework stuff
// ================================================

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
