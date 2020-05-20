#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns tag data of cursor target
 */

private _target = cursorTarget;

if ((ace_player distance2D _target) > NAMETAG_2D_MAX_DISTANCE) exitWith {nil};
if !(_target call FUNC(shouldShowNameTag)) exitWith {nil};
if !([ace_player, objNull, []] call ace_common_fnc_canInteractWith) exitWith {nil};

_target call FUNC(getUnitData)
