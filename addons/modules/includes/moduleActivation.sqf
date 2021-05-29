
private _activationMode = _logic getVariable [QGVAR(activationMode), 0];
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
  private _condition = compile ([_logic, _activationMode] call FUNC(getModuleActivatorCond));
  // Add module to activator system
  [_logic, _condition, _logic, QUOTE(EXEC_MODULE_FNC), _activationDelayTime] call FUNC(addModuleToActivator);
  LOG('Init of EXEC_MODULE_NAME finished - added to activator.');
};

// Activation on mission start
_logic call EXEC_MODULE_FNC;
LOG('Init of EXEC_MODULE_NAME finished - executed.');
