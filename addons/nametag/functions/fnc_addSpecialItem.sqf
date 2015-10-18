#include "script_component.hpp"

private ["_uid", "_index", "_class", "_bandana"];

if(GVAR(members) isEqualTo [[],[]]) exitWith {};
if(!GVAR(addSpecialItems)) exitWith {};

GVAR(members) params ["_uids", "_classes"];

_uid = getPlayerUID ace_player;
_index = _uids find _uid;

if(_index == -1) exitWith {};

_class = _classes select _index;
_bandana = "";
if(_class == "adm") then {_bandana = "maska_admin";};
if(_class == "ofc") then {_bandana = "maska_oficer";};
if(_class == "dow") then {_bandana = "maska_dowodca";};
if(_class == "ins") then {_bandana = "maska_instruktor";};

if(_bandana == "") exitWith {};

if(goggles ace_player == "") then {
    ace_player addGoggles _bandana;
} else {
    ace_player addItem _bandana;
};

/*
0 spawn {
    sleep 5;
    if(isNil ("A3CSS_ADMIN")) then {A3CSS_ADMIN=[];};
    if(isNil ("A3CSS_OFICER")) then {A3CSS_OFICER=[];};
    if(isNil ("A3CSS_DOWODCA")) then {A3CSS_DOWODCA=[];};
    if(isNil ("A3CSS_INSTRUKTOR")) then {A3CSS_INSTRUKTOR=[];};
    _bandana = "";
    switch(true) do {
        case ((name ace_player) in A3CSS_ADMIN) : {_bandana = "maska_admin";};
        case ((name ace_player) in A3CSS_OFICER) : {_bandana = "maska_oficer";};
        case ((name ace_player) in A3CSS_DOWODCA) : {_bandana = "maska_dowodca";};
        case ((name ace_player) in A3CSS_INSTRUKTOR) : {_bandana = "maska_instruktor";};
        default {};
    };
    if(GVAR(addFunctionUnitsItems) && _bandana != "") then {
        if(goggles ace_player == "") then {
            ace_player addGoggles _bandana;
        } else {
            ace_player addItem _bandana;
        };
    };
    */
