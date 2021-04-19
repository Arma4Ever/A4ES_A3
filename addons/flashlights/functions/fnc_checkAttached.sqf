#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks currently attached item
 */

// Exit if player in vehicle
if !(isNull (objectParent ace_player)) exitWith {};

private _attachedItem = ((ace_player getVariable [QACEGVAR(attach,attached), [[objNull, ""]]]) # 0) # 0;

if (isNull _attachedItem) exitWith {};

if (_attachedItem isKindOf QGVAR(base)) then {
  _attachedItem attachTo [ace_player, [0, 0, -0.05], "leftshoulder"];
  _attachedItem setDir 90;
};
