#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles microdagr dialog opened
 */

params ["_display"];

private _keyDown = _display displayAddEventHandler ["KeyDown", "(if ((_this select 1) == 29) then {ace_microdagr_ctrlmodifer = true;})"];
private _keyUp = _display displayAddEventHandler ["Keyup", "ace_microdagr_ctrlmodifer = false;"];
