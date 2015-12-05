/*
	Autor: SzwedzikPL
	Opis: Dodaje możliwosć rozmowy z jednostką (client)
*/
#include "script_component.hpp"

if(!hasInterface) exitWith {};

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_unit addAction [
    "Porozmawiaj",
    {_this spawn FUNC(openDialog)},
    [],
    6,
    false,
    true,
    "",
    "(alive _target) AND (player distance _target < 4) AND (_target getVariable ['a3c_dialog_cantalk', false])"
];
