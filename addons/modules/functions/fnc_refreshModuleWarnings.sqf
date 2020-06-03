#include "script_component.hpp"
#include "\z\a3cs\addons\modules\controlDefines.hpp"
/*
 * Author: SzwedzikPL
 * Updates module warnings ui
 */
params ["_warnings"];

// This should never happen in any case but check... just in case :P
if (isNil QGVAR(updateModuleWarningsParams)) exitWith {
  ERROR_1("Missing '%1' variable.",QGVAR(updateModuleWarningsParams));
};

// Get warnings control params
GVAR(updateModuleWarningsParams) params ["_controlGroup", "_controlTextGroup", "_controlText"];

private _text = "";
private _warningsHeight = 0;

private _hasWarnings = !(_warnings isEqualTo []);

if (_hasWarnings) then {
  {
    _x params [["_title", ""], ["_description", ""]];

    if !(_title isEqualTo "") then {
      private _warningText = format [
        QUOTE(%1<t size='1.5'><img color='#cd2323' image=QQPATHTOF(data\leftpanel\warning.paa)/></t>&#160;&#160;<t size='1.5' font='RobotoCondensedBold' color='#cbcbcb'>%2</t>),
        ["<br/><br/>", ""] select (_text isEqualTo ""),
        toUpper _title
      ];

      if !(_description isEqualTo "") then {
        _warningText = _warningText + format [
          "<br/><br/><t size='1.1' color='#afafaf'>%1</t>", _description
        ];
      };

      _text = _text + _warningText;
    };
  } forEach _warnings;
};

// Update warnings text
_controlText ctrlSetStructuredText parseText _text;

private _warningSources = [];

if (_hasWarnings) then {
  // Get new control height
  _warningsHeight = (ctrlTextHeight _controlText) + (1 * 5 * (pixelH * pixelGrid *	0.50));

  // Prepare warning sources
  {
    private _source = _x param [2, ""];
    if !(_source isEqualTo "") then {
      _warningSources pushBackUnique _source;
    };
  } forEach _warnings;
};

// Update warnings control height
{
  private _controlPos = ctrlPosition _x;
  _controlPos set [3, _warningsHeight];
  _x ctrlSetPosition _controlPos;
  _x ctrlCommit 0;
} forEach GVAR(updateModuleWarningsParams);

// Update all attribute controls
{
  _x params ["_controlGroup", "_originalY"];

  private _controlTitle = _controlGroup controlsGroupCtrl IDC_DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE;

  // Update attribute title if available
  if !(isNull _controlTitle) then {
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

  private _controlPos = ctrlPosition _controlGroup;
  _controlPos set [1, _originalY + _warningsHeight];
  _controlGroup ctrlSetPosition _controlPos;
  _controlGroup ctrlCommit 0;
} forEach GVAR(allAttributesControls);

private _attributesListControl = ctrlParentControlsGroup _controlGroup;
private _attributesCategory = ctrlParentControlsGroup _attributesListControl;

// Update attributes list height
private _attributesListPos = ctrlPosition _attributesListControl;
_attributesListPos set [3, GVAR(attributesListHeight) + _warningsHeight];
_attributesListControl ctrlSetPosition _attributesListPos;
_attributesListControl ctrlCommit 0;

// Update attributes category height
private _attributesCategoryPos = ctrlPosition _attributesCategory;
_attributesCategoryPos set [3, GVAR(attributesCategoryHeight) + _warningsHeight];
_attributesCategory ctrlSetPosition _attributesCategoryPos;
_attributesCategory ctrlCommit 0;

INFO_1('Module warnings refreshed (height: %1 all controls count: %2).',str _warningsHeight,str count GVAR(allAttributesControls));
