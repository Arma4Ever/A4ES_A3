#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles body deletion
 */

params ["_unit"];
TRACE_1("handleDeleted",_unit);

// Kill obv script
terminate (_unit getVariable [QGVAR(obvScript), scriptNull]);

// Don't replace bodies hidden manually by player
if (_unit getVariable [QEGVAR(ai,hidingBody), false]) exitWith {};

private _data = _unit getVariable [QGVAR(bodyData), []];
if (_data isEqualTo []) exitWith {};

_data pushBack (_unit call FUNC(getBodyGear));

_data call FUNC(createSimpleBody);
