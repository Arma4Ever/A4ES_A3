#include "script_component.hpp"
/*
 * Author: Krzyciu, SzwedzikPL
 * spawnSupply function
 */

params ["_objectName", "_class", "_objectCount", "_pos", "_items", "_objectPostInit", "_side"];

private _object = _class createVehicle _pos;

{
  _x addCuratorEditableObjects [[_object], true];
} forEach allCurators;

clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearItemCargoGlobal _object;
clearBackpackCargoGlobal _object;
_object setMaxLoad 99999;

{_object addItemCargoGlobal _x} forEach _items;

_object setVariable ["ace_cargo_customName", _objectName, true];
[_object, 4] call ace_cargo_fnc_setSize;

_object call _objectPostInit;

private _objectsVar = format ["a4es_modules_supplies_%1", _side];
private _objects = missionNamespace getVariable [_objectsVar, []];
_index = _objects apply {_x#0} find _objectName;
(_objects #_index) set [2,_objectCount - 1];
missionNamespace setVariable [_objectsVar, _objects, true];