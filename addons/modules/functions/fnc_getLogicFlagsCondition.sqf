#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Creates logic flag condition based on provided flags
 */

private _flags = _this;
TRACE_1("getLogicFlagsCondition",_flags);

private _condition = "";
private _usedFlags = [];

if (_flags isEqualTo []) exitWith {
  TRACE_1("getLogicFlagsCondition abort, empty flags",_flags);
  [_condition, _usedFlags]
};

private _createdFlags = GVAR(createdLogicFlags);
{
  _x params ["_flag", "_value"];

  if !(_flag in _createdFlags) then {
    TRACE_2("Ignoring flag in getLogicFlagsCondition, flag not created",_flag,_flags);
    continue;
  };

  if (_flag in _usedFlags) then {
    TRACE_2("Ignoring flag in getLogicFlagsCondition, flag already used",_flag,_flags);
    continue;
  };

  _usedFlags pushBack _flag;
  private _defaultValue = _createdFlags get _flag;
  private _expectedValue = [false, true] select _value;

  private _varCond = format [
    "%3(_this getVariable ['%1', %2])",
    format [QGVAR(%1), _flag],
    str _defaultValue,
    ["!", ""] select _expectedValue
  ];

  if (_condition isEqualTo "") then {
    _condition = "(" + _varCond + ")";
  } else {
    _condition = _condition + " && {" + _varCond + "}";
  };
} forEach _flags;

if (_usedFlags isEqualTo []) exitWith {
  TRACE_1("getLogicFlagsCondition abort, empty condition",_flags);
  [_condition, _usedFlags]
};

[_condition, _usedFlags]
