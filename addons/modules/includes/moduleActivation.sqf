
private _activationMode = _logic getVariable [QGVAR(activationMode), 0];

// Exec module if activated & activation mode by trigger
if (_activationMode isEqualTo 2) exitWith {
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

// Add module to activator system
[_logic, _activationMode, QUOTE(EXEC_MODULE_FNC)] call FUNC(addModuleToActivator);
