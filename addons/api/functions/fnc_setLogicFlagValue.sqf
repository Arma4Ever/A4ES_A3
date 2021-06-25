#include "script_component.hpp"
/***
  Autor: SzwedzikPL

  Opis:
      Zmienia wartość podanej flagi logicznej

  Parametry:
      _flag - Identyfikator flagi (wyświetlany w module dodawania nowej flagi logicznej) <STRING>
      _value - Nowa wartość flagi <BOOLEAN>

  Zwraca:
      nic

  Przykład:
      // Zmiana flagi flag_21 na true
      ["flag_21", true] call A3CS_fnc_setLogicFlagValue;
      // Zmiana flagi flag_21 na false
      ["flag_21", false] call A3CS_fnc_setLogicFlagValue;
***/

params [["_flag", "", [""]], ["_value", false, [false]]];

if (isServer) then {
  [_flag, _value] call EFUNC(modules,setLogicFlagValue);
} else {
  [QEGVAR(modules,setLogicFlagValue), [_flag, _value]] call CBA_fnc_serverEvent;
};
