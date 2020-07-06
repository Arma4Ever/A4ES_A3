#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Shows notification for 3DEN dynamicClassSelect
 */

params ["_notificationText", "_type", "_notificationBar"];


playsound [
  [
    "3DEN_notificationDefault",
    "3DEN_notificationWarning"
  ] select (_type isEqualTo 2),
  true
];


// Update background color
_notificationBar ctrlSetBackgroundColor ([
  [0.12549,0.505882,0.313726,0.9],
  [0.8,0.35,0,0.9],
  [0.815686,0.266667,0.215686,0.9]
] select _type);

// Show notification about added unit on given notification bar
private _prevFadeSpawn = _notificationBar getVariable [QGVAR(fadeSpawn), scriptNull];
terminate _prevFadeSpawn;

_notificationBar ctrlSetStructuredText parseText ([
  format [
    "<img image='%1'/> ",
    [
      "\a3\3den\data\cfgwaypoints\support_ca.paa",
      "\a3\3den\data\displays\display3den\panelleft\entitylist_delete_ca.paa",
      "\a3\3den\data\displays\display3denmsgbox\picture_ca.paa"
    ] select _type
  ],
  ["<t valign='middle'>", _notificationText, "</t>"] joinString ""
] joinString "");
_notificationBar ctrlSetFade 0;
_notificationBar ctrlCommit 0;

private _fadeSpawn = [
  _notificationBar,
  [1, 3] select (_type isEqualTo 2)
] spawn {
  params ["_notificationBar", "_sleep"];
  uiSleep _sleep;
  _notificationBar ctrlSetFade 1;
  _notificationBar ctrlCommit 1.5;
};

_notificationBar setVariable [QGVAR(fadeSpawn), _fadeSpawn];
