#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Transfers curator group to headless if possible
 */

params ["_group"];

if (_group getVariable [QGVAR(transferToHC), false]) exitWith {};
_group setVariable [QGVAR(transferToHC), true];

private _clients = missionNamespace getVariable [QEGVAR(headless,headlessClients), []];
if (_clients isEqualTo []) exitWith {};

_group spawn {
  sleep 4;
  if ((isNull _group) || {(units _this) isEqualTo []}) exitWith {};
  private _client = 0 call EFUNC(headless,getBestClient);
  if (isNull _client) exitWith {};
  _this setGroupOwner (owner _client);
};