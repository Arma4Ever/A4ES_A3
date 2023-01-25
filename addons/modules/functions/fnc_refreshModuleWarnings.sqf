#include "script_component.hpp"
#include "\z\a4es\addons\modules\controlDefines.hpp"
/*
 * Author: SzwedzikPL
 * Updates module warnings ui
 */
params ["_warnings"];
TRACE_1("refreshModuleWarnings",_warnings);

// Get warnings control params
GVAR(moduleWarningsParams) params ["_controlGroup", "_controlTextGroup", "_controlText"];

private _text = "";
private _warningsHeight = 0;

private _hasWarnings = (_warnings isNotEqualTo []);

if (_hasWarnings) then {
  {
    _x params [["_title", ""], ["_description", ""]];

    if (_title isNotEqualTo "") then {
      private _warningText = format [
        QUOTE(%1<t size='1.5'><img color='#cd2323' image=QQPATHTOF(data\leftpanel\warning.paa)/></t>&#160;&#160;<t size='1.5' font='RobotoCondensedBold' color='#cbcbcb'>%2</t>),
        ["<br/><br/>", ""] select (_text isEqualTo ""),
        toUpper _title
      ];

      if (_description isNotEqualTo "") then {
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
  _warningsHeight = (ctrlTextHeight _controlText) + (5 * (pixelH * pixelGrid * 0.50));

  // Prepare warning sources
  {
    private _source = _x param [2, ""];
    if (_source isNotEqualTo "") then {
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
} forEach GVAR(moduleWarningsParams);

GVAR(moduleWarningsSources) = _warningSources;

LOG_1('Module warnings refreshed (height: %1).',str _warningsHeight);
