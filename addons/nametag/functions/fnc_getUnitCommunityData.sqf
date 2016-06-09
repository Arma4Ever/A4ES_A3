/*
 * Author: SzwedzikPL
 * Get unit community (A3C) identity (community group)
 */
#include "script_component.hpp"

params ["_target"];

private _emptyReturn = ["","","",""];

if (!isPlayer _target) exitWith {_emptyReturn};
if (GVAR(members) isEqualTo [[],[]]) exitWith {_emptyReturn};

GVAR(members) params ["_uids", "_classes"];

private _uid = getPlayerUID _target;
private _index = _uids find _uid;

if (_index < 0) exitWith {_emptyReturn};

private _communityGroup = _classes select _index;
private _communityGroupName = "";
private _communityGroupColor = "";
private _communityRank = "";

[_communityGroup, _communityGroupName, _communityGroupColor, _communityRank]
