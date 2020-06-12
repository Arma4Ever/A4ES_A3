#include "script_component.hpp"
/***
	Autor: SzwedzikPL

	Opis:
      Sprawdza czy dana jednostka jest liderem swojej grupy

	Parametry:
      _unit - Jednostka która ma być sprawdzona <OBJECT>

	Zwraca:
	    true jeśli jednostka jest liderem swojej grupy, false jeśli nie jest <BOOLEAN>

  Przykład:
      private _jestLiderem = mojaJednostka call A3CS_fnc_isSquadLeader;
***/

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {false};

_unit call EFUNC(squads,isLeader)
