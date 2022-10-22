
private _preActivationMode = _logic getVariable [QGVAR(preActivationMode), 0];
private _preactivated = _logic getVariable [QGVAR(preactivated), false];
private _activationMode = _logic getVariable [QGVAR(activationMode), 0];

if (_preActivationMode != 0 && {!_preactivated}) exitWith {
  private _function = getText ((configOf _logic) >> "function");
  if (_function == "") exitWith {};

  private _condition = parseSimpleArray (_logic getVariable [QGVAR(preActivationFlags), "[]"]);

  // Convert if not activated by trigger
  if (_activationMode != 3) then {
    _logic = _logic call FUNC(convertToNamespace);
  };

  // Mark as preactivated - we're using the same function as init, prevents double preactivation
  _logic setVariable [QGVAR(preactivated), true];

  // Add module to activator system
  [_logic, _condition, _logic, _function, 0] call FUNC(addModuleToActivator);

  LOG('Init of EXEC_MODULE_NAME finished - added to activator (preactivation).');
};

private _activationDelay = _logic getVariable [QGVAR(activationDelay), false];
private _activationDelayTime = [
  0,
  _logic getVariable [QGVAR(activationDelayTime), 0]
] select _activationDelay;

// Activation by trigger
if (_activationMode isEqualTo 3) exitWith {
  if !(_isActivated) exitWith {
    LOG('Init of EXEC_MODULE_NAME finished - exection aborted - not activated.');
  };
  if (_activationDelay) then {
    [
      {_this call EXEC_MODULE_FNC},
      [_logic],
      _activationDelayTime
    ] call CBA_fnc_waitAndExecute;
    LOG('Init of EXEC_MODULE_NAME finished - exection delayed.');
  } else {
    #ifdef EXEC_MODULE_MISSION_START_DELAY
    // Add extra sync time if module is executed on mission start
    if (CBA_missionTime < 10) then {
      sleep EXEC_MODULE_MISSION_START_DELAY;
    };
    #endif
    _logic call EXEC_MODULE_FNC;
    LOG('Init of EXEC_MODULE_NAME finished - executed.');
  };
};

// Activation by proximity, flags or condition
if (_activationMode in [0, 1, 2]) exitWith {
  _logic = _logic call FUNC(convertToNamespace);

  // Get condition
  private _condition =  [_logic, _activationMode] call FUNC(getModuleActivatorCond);
  // Add module to activator system
  [_logic, _condition, _logic, QUOTE(EXEC_MODULE_FNC), _activationDelayTime] call FUNC(addModuleToActivator);
  LOG('Init of EXEC_MODULE_NAME finished - added to activator.');
};

// Activation on mission start
_logic call EXEC_MODULE_FNC;
LOG('Init of EXEC_MODULE_NAME finished - executed.');
