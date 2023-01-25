#include "script_component.hpp"
/***
  Autor: SzwedzikPL

  Opis:
      Zakłóca działanie radaru drużynowego

  Parametry:
      _units - lista jednostek których radar chcemy zakłócać <ARRAY>
      _jamRadar - czy radar (tarcza radaru) ma być zakłócana (opcjonalny, domyślnie: true) <BOOLEAN>
      _jamMemberlist - czy lista członków drużyny ma być zakłócana (opcjonalny, domyślnie: true) <BOOLEAN>
      _animate - czy przejście w tryb zakłócania ma być animowane (opcjonalny, domyślnie: true) <BOOLEAN>
      _isGlobal - czy efekt tej funkcji ma być transmitowany przez sieć (opcjonalny, domyślnie: true) <BOOLEAN>
      INFO: jeśli efekt działania funkcji nie jest globalny (_isGlobal = false) funkcja musi być <BOOLEAN>
      wykonana na komputerze gracza którego dotyczy. Dodatkowo jeśli efekt nie jest globalny
      informacja o zakłócaniu nie będzie dostępna dla graczy dołączających w trakcie gry (JIP)
      więc sam musisz zadbać o obsługę takiego przypadku jeśli zdecydujesz się na taki wariant.
      Warto nadmienić również, że jeśli efekt działania nie jest globalny funkcja jest dużo
      lżejsza w grze multiplayer gdyż żadne dane nie są transmitowane sieciowo!

  Zwraca:
      Nic <NIL>

  Przykład:
      // Zakłóca radar i listę członków drużyny wszystkim graczom na serwerze globalnie
      [playableUnits] call A4ES_fnc_jamSquadRadar;

      // Zakłóca radar i listę członków drużyny lokalnie (np. część initu misji lub triggera)
      [[player], true, true, true, false] call A4ES_fnc_jamSquadRadar;
***/

params [
  ["_units", [], [[]]],
  ["_jamRadar", true, [false]],
  ["_jamMemberlist", true, [false]],
  ["_animate", true, [false]],
  ["_isGlobal", true, [false]]
];

if (_units isEqualTo []) exitWith {
  LSTRING(squadRadar_emptyUnits) call EFUNC(common,showError);
};
if !(_units isEqualTypeAll objNull) exitWith {
  LSTRING(squadRadar_nonObjectUnits) call EFUNC(common,showError);
};

{
  _x setVariable [QEGVAR(squadradar,jamRadar), _jamRadar, _isGlobal];
  _x setVariable [QEGVAR(squadradar,jamMemberlist), _jamMemberlist, _isGlobal];
  _x setVariable [QEGVAR(squadradar,jamAnimation), _animate, _isGlobal];
} forEach _units;

if (_isGlobal) then {
  [QEGVAR(squadradar,jamRadar), [], _units] call CBA_fnc_targetEvent;
} else {
  // Don't refresh player's UI if change doesn't affect him
  if !(ace_player in _units) exitWith {};
  [QEGVAR(squadradar,jamRadar), []] call CBA_fnc_localEvent;
};
