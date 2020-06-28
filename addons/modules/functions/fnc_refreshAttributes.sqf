#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates attributes UI
 */

LOG_1("Refreshing attributes started (attributes: %1).",str count GVAR(allAttributesControls));

private _warningSources = GVAR(moduleWarningsSources);
private _currentHeight = 0;
private _attributeMargin = 1 * (pixelH * pixelGrid * 0.50);

{
  private _controlGroup = _x;
  private _groupPos = ctrlPosition _controlGroup;
  private _condition = _controlGroup getVariable [QGVAR(conditionActive), {true}];
  private _state = (GVAR(dynamicAttributesValues) call _condition) isEqualTo true;
  private _groupHeight = [
    0,
    (_groupPos # 3) + _attributeMargin
  ] select _state;

  LOG_3("Refreshing attribute '%1' (condition: '%2' active: %3).",ctrlClassName _controlGroup,str _condition,str _state);

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

  // Update group pos
  _groupPos set [1, _currentHeight];
  _controlGroup ctrlSetPosition _groupPos;
  _controlGroup ctrlCommit 0;

  // Update current height
  _currentHeight = _currentHeight + _groupHeight;

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
