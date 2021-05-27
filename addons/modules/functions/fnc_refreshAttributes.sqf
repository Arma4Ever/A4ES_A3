#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates attributes UI
 */

LOG_1("Refreshing attributes started (attributes: %1).",str count GVAR(allAttributesControls));

private _warningSources = GVAR(moduleWarningsSources);
private _attributesValues = GVAR(dynamicAttributesValues);
private _currentHeight = 0;
private _attributeMargin = 1 * (pixelH * pixelGrid * 0.50);

{
  private _controlGroup = _x;
  
  // Get attribute config
  private _config = _controlGroup getVariable QGVAR(attributeConfig);

  private _condition = _controlGroup getVariable [QGVAR(conditionActive), {true}];
  private _state = (_attributesValues call _condition) isEqualTo true;
  if (isNil "_state") then {
    ERROR_2("Attribute '%1' condition: '%2' returned nil",configName _config,str _condition);
    _state = false;
  };

  // Update attribute title if available
  private _controlTitle = _controlGroup controlsGroupCtrl IDC_DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE;
  if (!(isNull _controlTitle) && _state) then {
    private _configName = _controlTitle getVariable [QGVAR(attributeClass), ""];
    private _titleFormat = _controlTitle getVariable [QGVAR(attributeTitle), ""];
    private _titleText = format [
      _titleFormat,
      [
        "",
        "<img color='#cd2323' image='\z\a3cs\addons\modules\data\leftpanel\warning.paa'/> "
      ] select (_configName in _warningSources)
    ];

    _controlTitle ctrlSetStructuredText parseText _titleText;
  };

  // Update show status
  _controlGroup ctrlShow _state;

  // Call onValuesChanged handler
  private _onValuesChangedHandler = _controlGroup getVariable QGVAR(onValuesChanged);
  if !(isNil "_onValuesChangedHandler") then {
    [
      _controlGroup,
      _config,
      _attributesValues
    ] call _onValuesChangedHandler;
  };

  // Calc new control group height
  private _groupPos = ctrlPosition _controlGroup;
  private _groupHeight = [
    0,
    (_groupPos # 3) + _attributeMargin
  ] select _state;

  // Update group pos
  _groupPos set [1, _currentHeight];
  _controlGroup ctrlSetPosition _groupPos;
  _controlGroup ctrlCommit 0;

  // Update current height
  _currentHeight = _currentHeight + _groupHeight;

  LOG_3("Attribute '%1' refreshed (condition: '%2' active: %3).",configName _config,str _condition,str _state);
} forEach GVAR(allAttributesControls);

private _attributesListControl = uiNamespace getVariable QGVAR(currentModuleAttributesList);
private _attributesCategory = uiNamespace getVariable QGVAR(currentModuleAttributesCategory);

// Update attributes list height
private _attributesListPos = ctrlPosition _attributesListControl;
_attributesListPos set [3, _currentHeight];
_attributesListControl ctrlSetPosition _attributesListPos;
_attributesListControl ctrlCommit 0;

// Update attributes category height
private _attributesCategoryPos = ctrlPosition _attributesCategory;
_attributesCategoryPos set [3, _currentHeight + (7 * (pixelH * pixelGrid * 0.50))];
_attributesCategory ctrlSetPosition _attributesCategoryPos;
_attributesCategory ctrlCommit 0;

LOG("Refreshing attributes finished.");
