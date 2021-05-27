
private _activationMode = _logic getVariable [QGVAR(activationMode), 0];

// Activation by trigger
if (_activationMode isEqualTo 2) exitWith {
  if !(_isActivated) exitWith {
    LOG('Init of EXEC_MODULE_NAME finished - exection aborted - not activated.');
  };
  if (_logic getVariable [QGVAR(activationDelay), false]) then {
    [
      {_this call EXEC_MODULE_FNC},
      [_logic],
      _logic getVariable [QGVAR(activationDelayTime), 0]
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

// Activation by proximity or condition
if (_activationMode in [0, 1]) exitWith {
  // Add module to activator system
  [_logic, _activationMode, QUOTE(EXEC_MODULE_FNC)] call FUNC(addModuleToActivator);
  LOG('Init of EXEC_MODULE_NAME finished - added to activator.');
};

// Activation on mission start
_logic call EXEC_MODULE_FNC;
LOG('Init of EXEC_MODULE_NAME finished - executed.');
