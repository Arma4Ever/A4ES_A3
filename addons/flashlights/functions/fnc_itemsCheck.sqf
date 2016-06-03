/*
 * Author: SzwedzikPL
 * Open admin panel button action
 */
#include "script_component.hpp"

if (vehicle ace_player != ace_player) exitWith {};

private _attachedItem = (ace_player getVariable ["ace_attach_attached", [[objNull, ""]]]) select 0;
_attachedItem params ["_item", "_itemClass"];

if (isNull _item) exitWith {};

if (_item isKindOf QGVAR(personalFlashlight_base)) then {
    _item attachTo [ace_player, [0, 0, -0.05], "leftshoulder"];
    _item setDir 90;
};
