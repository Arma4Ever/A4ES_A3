#include "script_component.hpp"
#include "\z\a4es\addons\modules\controlDefines.hpp"
/*
 * Author: SzwedzikPL
 * Updates warnings tab icon & info
 */
disableserialization;

private _display = findDisplay IDD_DISPLAY3DEN;
private _warningsTabInfo = _display displayCtrl IDC_DISPLAY3DEN_PANELLEFT_WARNINGS_INFO;
private _warningsTabIcon = _display displayCtrl IDC_DISPLAY3DEN_PANELLEFT_WARNINGS_ICON;
private _entitiesCount = count GVAR(warningsEntities);

// Update warnings tab icon
if (_entitiesCount > 0) then {
  _warningsTabIcon ctrlSetText format [
    QPATHTOF(data\leftpanel\warning_%1.paa),
    [_entitiesCount, '9plus'] select (_entitiesCount > 9)
  ];
  _warningsTabIcon ctrlShow true;
} else {
  _warningsTabIcon ctrlShow false;
};
_warningsTabIcon ctrlCommit 0;

// Update warnings tab info
_warningsTabInfo ctrlSetStructuredText parseText format [
  "<t align='center'>%1</t>",
  format [
    LLSTRING(WarningsInfo),
    format ["<t font='RobotoCondensedBold' size='1.1' color='%1'>%2</t>",
      ['#17b712', '#d01e1e'] select (_entitiesCount > 0),
      _entitiesCount
    ]
  ]
];

LOG_1("Warnings tab UI updated (entities: %1).",str _entitiesCount);
