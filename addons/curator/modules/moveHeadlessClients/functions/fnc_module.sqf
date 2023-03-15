#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * moveHeadlessClients curator module function
 */

params ["_logic"];
private _pos = getPos _logic;
deleteVehicle _logic;
[QEGVAR(headless,moveHeadlessClients), [_pos]] call CBA_fnc_serverEvent;