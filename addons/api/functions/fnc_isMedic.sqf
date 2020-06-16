#include "script_component.hpp"
/***
  Autor: SzwedzikPL

  Opis:
      Sprawdza czy dana jednostka jest medykiem

  Parametry:
      _unit - Jednostka która ma być sprawdzona <OBJECT>
      _minClass - Klasa medyka, 1 - zwykły medyk lub doktor, 2 - doktor (opcjonalny, domyślnie: 1) <NUMBER>
      _useLocationBoost - Czy lokalizacja ma być brana pod uwagę (opcjonalny, domyślnie: false) <BOOLEAN>
          INFO: Zależnie od ustawień systemu będąc w pobliżu punktu medycznego lub
          pojazdu medycznego osoby niebędące medykami mogę mieć ich uprawnienia.
          Parametr _useLocationBoost pozwala wziąć to pod uwagę jeśli istnieje
          taka potrzeba.

  Zwraca:
      true jeśli jednostka jest medykiem danej klasy, false jeśli nie jest <BOOLEAN>

  Przykład:
      private _jestMedykiem = mojaJednostka call A3CS_fnc_isMedic;
      private _jestDoktorem = [mojaJednostka, 2] call A3CS_fnc_isMedic;
      private _maAktualnieUprawnieniaMedyka = [mojaJednostka, 1, true] call A3CS_fnc_isMedic;
***/

params [
  ["_unit", objNull, [objNull]],
  ["_minClass", 1, [1]],
  ["_useLocationBoost", false, [false]]
];

if (isNull _unit) exitWith {false};

if (_useLocationBoost) exitWith {
  [_unit, _minClass] call ACEFUNC(medical_treatment,isMedic)
};

[_unit, _minClass] call EFUNC(medical,isMedic)
