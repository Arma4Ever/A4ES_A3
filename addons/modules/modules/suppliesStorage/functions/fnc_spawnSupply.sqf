#include "script_component.hpp"
/*
 * Author: Krzyciu
 * spawnSupply function
 */

params ["_objectName", "_class", "_objectCount", "_pos", "_inventory", "_objectPostInit", "_side", "_storageID"];

_inventory params [
    ["_itemCargo", [], [[]]],
    ["_magazineCargo", [], [[]]],
    ["_weaponCargo", [], [[]]],
    ["_backpackCargo", [], [[]]]
];

private _object = _class createVehicle _pos;

{
  _x addCuratorEditableObjects [[_object], true];
} forEach allCurators;

clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearItemCargoGlobal _object;
clearBackpackCargoGlobal _object;
_object setMaxLoad 99999;

{_object addMagazineCargoGlobal [_x, (_magazineCargo #1) select _forEachIndex]} forEach (_magazineCargo #0);
{_object addWeaponCargoGlobal [_x, (_weaponCargo #1) select _forEachIndex]} forEach (_weaponCargo #0);
{_object addBackpackCargoGlobal [_x, (_backpackCargo #1) select _forEachIndex]} forEach (_backpackCargo #0);
{_object addItemCargoGlobal [_x, (_itemCargo #1) select _forEachIndex]} forEach (_itemCargo #0);

_object setVariable ["ace_cargo_customName", _objectName, true];
[_object, 2] call ace_cargo_fnc_setSize;

_object call _objectPostInit;

private _objects = missionNamespace getVariable [format [QGVAR(storage_%1_%2), _storageID, _side],[]];
_index = _objects apply {_x#0} find _objectName;
(_objects #_index) set [2,_objectCount - 1];
missionNamespace setVariable [format [QGVAR(storage_%1_%2), _storageID, _side], _objects, true];