#include "script_component.hpp"
/***
  Autor: SzwedzikPL

  Opis:
      Deklaruje czy nametag jednostki powinien być widoczny dla graczy

  Parametry:
      _unit - Jednostka której dotyczy ustawienie <OBJECT>
      _showNametag - Czy nametag jednostki powinien być widoczny dla graczy (opcjonalny, domyślnie: true) <BOOLEAN>
      _isGlobal - Czy wartośc powinna być ustawiona globalnie czy tylko dla klienta
      na którym została wykonana funkcja (opcjonalny, domyślnie: true) <BOOLEAN>
      INFO: Jeśli deklaracja jest globalna nie ma potrzeby wykonywać funkcji na każdym komputerze,
      wystarczy ją wykonać np. tylko na serwerze

  Zwraca:
      Nic <NIL>

  Przykład:
      // Pokaż nametag jednostki AI dla wszystkich graczy
      jednostkaAI call A3CS_fnc_showUnitNametag;

      // Ukryj nametag jednostki AI dla wszystkich graczy
      [jednostkaAI, false] call A3CS_fnc_showUnitNametag;

      // Pokaż nametag jednostki AI tylko dla gracza który wykonuje funkcję
      [jednostkaAI, true, false] call A3CS_fnc_showUnitNametag;
***/

params [
  ["_unit", objNull, [objNull]],
  ["_showNametag", true, [true]],
  ["_isGlobal", true, [true]]
];

if (isNull _unit) exitWith {};
_unit setVariable [EGVAR(nametags,showNameTag), _showNametag, _isGlobal];
