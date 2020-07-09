#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Replaces old unit with new unit in old unit squad
 */

params ["_oldUnit", "_newUnit"];

// Get old unit squad
private _squad = _oldUnit call FUNC(getUnitSquad);

LOG_3('Replacing "%1" unit with "%2" unit in "%3" squad',str _oldUnit,str _newUnit,str _squad);

// Exit if old unit has no squad
if (isNull _squad) exitWith {};

private _squadUnits = _squad call FUNC(getSquadUnits);
private _oldUnitIndex = _squadUnits find _oldUnit;

// Check old unit index in squad (this should never happend)
if (_oldUnitIndex isEqualTo -1) exitWith {};

// Replace corpse with new unit
_squadUnits set [_oldUnitIndex, _newUnit];

// Save data
_squad setVariable ["units", _squadUnits, true];
_oldUnit setVariable [QGVAR(squad), objNull, true];
_newUnit setVariable [QGVAR(squad), _squad, true];

// Trigger squad change
[_squad, _oldUnit] call FUNC(triggerSquadChanged);
