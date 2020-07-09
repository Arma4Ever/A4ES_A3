#include "script_component.hpp"
/***
  Autor: SzwedzikPL

  Opis:
      Sprawdza czy wszystkie podane moduły wygenerowały już jednostki.
      Uwaga: funkcja nie sprawdza czy podane moduły są generatorami więc
      upewnij się, że używasz jej na dobrych modułach (jeśli w parametrze
      podasz moduł który nie jest generatorem, funkcja zawsze zwróci false).

  Parametry:
      _modul1 - Pierwszy moduł który należy sprawdzić <OBJECT>
      _modul2 - Drugi moduł który należy sprawdzić <OBJECT>
      i tak dalej...

  Zwraca:
      true jeśli wszystkie podane moduły wygenerowały już jednostki <BOOLEAN>

  Przykład:
      private _juzWygenerowal = [generatorPiechoty] call A3CS_fnc_didGenerateUnits;
      private _juzWszystkieWygenerowaly = [generator1, generator2, generator3] call A3CS_fnc_didGenerateUnits;
***/

if !(_this isEqualType []) exitWith {
  LSTRING(didGenerateUnits_paramNotArray) call EFUNC(common,showError);
  false
};
if (_this isEqualTo []) exitWith {
  // Exit without errror
  false
};
if !(_this isEqualTypeAll objNull) exitWith {
  LSTRING(didGenerateUnits_notObjectInParam) call EFUNC(common,showError);
  false
};

(_this findIf {
  !(_x getVariable [QGVAR(unitsGenerated), false])
}) isEqualTo -1
