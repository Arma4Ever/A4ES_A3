#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Land vehicle init
 */

params ["_vehicle"];
TRACE_1("initVehicle",_vehicle);

private _config = configOf _vehicle;

if !((getNumber (_config >> "artilleryScanner")) > 0) exitWith {};

private _type = typeOf _vehicle;

if !(_type in GVAR(artWeaponsCache)) then {
  private _weapons = getArray (_config >> "Turrets" >> "MainTurret" >> "weapons");
  if (_weapons isEqualTo []) exitWith {
    GVAR(artWeaponsCache) set [_type, ""];
  };
  GVAR(artWeaponsCache) set [_type, _weapons # 0];
};

TRACE_2("Adding fired EH to vehicle",_vehicle,_type);
_vehicle addEventHandler ["fired", {_this call FUNC(firedEH);}];
