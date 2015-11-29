#include "script_component.hpp"

params ["_target", "_uid", "_index", "_communityGroup", "_communityGroupName", "_communityGroupColor", "_communityRank"];

_emptyReturn = ["","","",""];

if(!isPlayer _target) exitWith {_emptyReturn};
if(GVAR(members) isEqualTo [[],[]]) exitWith {_emptyReturn};

GVAR(members) params ["_uids", "_classes"];

_uid = getPlayerUID _target;
_index = _uids find _uid;

if(_index == -1) exitWith {_emptyReturn};

_communityGroup = _classes select _index;
_communityGroupName = "";
_communityGroupColor = "";
_communityRank = "";

[_communityGroup, _communityGroupName, _communityGroupColor, _communityRank]
