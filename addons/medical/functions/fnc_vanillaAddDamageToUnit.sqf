#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Placeholder for ace_medical_fnc_addDamageToUnit in case of disabled medical system
 */

params [["_unit", objNull, [objNull]], ["_damageToAdd", 0, [0]], ["_bodyPart", "", [""]]];

if (isNull _unit || {!local _unit} || {!alive _unit}) exitWith {};

_bodyPart = toLower _bodyPart;
private _hitPoint = "";
private _bodyParts = ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"];
private _hitPoints = ["hithead", "hitbody", "hitarms", "hitarms", "hitlegs", "hitlegs"];
private _index = _bodyParts find _bodyPart;

if (_index >= 0) then {
  _hitPoint = _hitPoints select _index;
};

if (_hitPoint isEqualTo "") then {
  _unit setDamage ((damage _unit) + _damageToAdd);
} else {
  _unit setHitPointDamage [_hitPoint, (_unit getHitPointDamage _hitPoint) + _damageToAdd];
};
