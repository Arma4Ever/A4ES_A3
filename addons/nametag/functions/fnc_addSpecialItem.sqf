#include "script_component.hpp"

private ["_communityData", "_bandanaClass"];

_communityData = [ace_player] call FUNC(getUnitCommunityData);
_communityData params ["_communityGroup", "_communityGroupName", "_communityGroupColor", "_communityRank"];

if(_communityGroup == "") exitWith {};

_bandanaClass = "";
if(_communityGroup == "adm") then {_bandanaClass = "maska_admin";};
if(_communityGroup == "ofc") then {_bandanaClass = "maska_oficer";};
if(_communityGroup == "dow") then {_bandanaClass = "maska_dowodca";};
if(_communityGroup == "ins") then {_bandanaClass = "maska_instruktor";};

if(_bandanaClass == "") exitWith {};

if(goggles ace_player == "") then {
    ace_player addGoggles _bandanaClass;
} else {
    ace_player addItem _bandanaClass;
};
