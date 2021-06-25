#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Insert values function for showMessage messageType attribute
 */

params ["_module"];

// All players
private _targets = [
  [
    LLSTRING(Attributes_messageTarget_allPlayers),
    0,
    true,
    LLSTRING(Attributes_messageTarget_allPlayers_tooltip)
  ]
];

// Players in area
if ((getNumber ((configOf _module) >> "canSetArea")) isEqualTo 1) then {
  _targets pushBack [
    LLSTRING(Attributes_messageTarget_playersInArea),
    1,
    false,
    LLSTRING(Attributes_messageTarget_playersInArea_tooltip)
  ];
};

// Action player
if (_module isKindOf QGVAR(addAction)) then {
  _targets pushBack [
    LLSTRING(Attributes_messageTarget_actionPlayer),
    2,
    false,
    LLSTRING(Attributes_messageTarget_actionPlayer_tooltip)
  ];
};

_targets
