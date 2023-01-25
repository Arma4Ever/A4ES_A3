#include "script_component.hpp"
/***
  Autor: SzwedzikPL

  Opis:
      Sprawdza czy podana flaga ma podaną wartość

  Parametry:
      _flag - Identyfikator flagi (wyświetlany w module dodawania nowej flagi logicznej) <STRING>
      _value - Oczekiwana wartość flagi <BOOLEAN>

  Zwraca:
      true jeśli podana flaga ma podaną wartość, false jeśli wartość flagi jest inna lub flaga nie istnieje <BOOLEAN>

  Przykład:
      private _flagaPrawdziwa = ["flag_21", true] call A4ES_fnc_isLogicFlag;
      private _flagaFalszywa = ["flag_21", false] call A4ES_fnc_isLogicFlag;
***/

params [["_flag", "", [""]], ["_value", false, [false]]];

private _flagValue = missionNamespace getVariable (format [QEGVAR(modules,%1), _flag]);
if (isNil "_flagValue") exitWith {false};
_flagValue isEqualTo _value
