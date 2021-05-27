#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
  [QGVAR(cutFloraObject), {
    params ["_object"];
    TRACE_1("cutFloraObject event",_object);
    _object setDamage 1;
    [{
      _this hideObjectGlobal true;
    }, _object, 2.5] call CBA_fnc_waitAndExecute;
  }] call CBA_fnc_addEventHandler;
};

ADDON = true;
