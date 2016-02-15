/*
 * Author: SzwedzikPL
 * Add community (A3C) group special item (bandana)
 */
#include "script_component.hpp"

if(!GVAR(addSpecialItem)) exitWith {};
if(ace_player getVariable [QGVAR(specialItemAdded), false]) exitWith {};

private _communityData = (ace_player call FUNC(getUnitCommunityData));
_communityData params ["_communityGroup"];

if(_communityGroup == "") exitWith {};

private _bandanaClass = "";
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

ace_player setVariable [QGVAR(specialItemAdded), true, true];
