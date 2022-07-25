#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles hide body action (scripted, action or arma garbage collector)
 */

params ["_unit"];
TRACE_1("handleHidden",_unit);

// Remove deleted EH - we'll handle replacement here
_unit removeEventHandler ["deleted", _unit getVariable [QGVAR(deletedEH), -1]];

// Don't replace bodies hidden manually by player
if (_unit getVariable [QEGVAR(ai,hidingBody), false]) exitWith {};

private _data = _unit getVariable [QGVAR(bodyData), []];
if (_data isEqualTo []) exitWith {};

_data pushBack (_unit call FUNC(getBodyGear));

_data call FUNC(createSimpleBody);

[{
  [{
    [{
      deleteVehicle _this;
    }, _this] call CBA_fnc_execNextFrame;
  }, _this] call CBA_fnc_execNextFrame;
}, _unit] call CBA_fnc_execNextFrame;
