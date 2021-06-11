#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Sets logic flag value based on module attributes
 */

params ["_logic", ["_setLogicFlagValueModule", false]];
TRACE_2("moduleSetLogicFlagValue",_logic,_setLogicFlagValueModule);

_setLogicFlagValueModule = _logic getVariable [QGVAR(setLogicFlagValue), _setLogicFlagValueModule];

if !(_setLogicFlagValueModule) exitWith {
  TRACE_1("moduleSetLogicFlagValue - abort, setting logic flag value disabled",_logic);
};

private _logicFlag = _logic getVariable [QGVAR(logicFlag), ""];
if (_logicFlag isEqualTo "") exitWith {
  ERROR_2("%1 [%2] - abort moduleSetLogicFlagValue, empty flag",str _logic,typeOf _logic);
};

private _logicFlagValue = _logic getVariable [QGVAR(logicFlagValue), 0];
if !(_logicFlagValue in [0, 1]) exitWith {
  ERROR_3("%1 [%2] - abort moduleSetLogicFlagValue, invalid flag value: %3",str _logic,typeOf _logic,str _valueId);
};

private _value = [false, true] select _logicFlagValue;
[_logicFlag, _value] call FUNC(setLogicFlagValue);
