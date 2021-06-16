#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Setups isStationary attribute
 */

params ["_entity", "_isStationary"];
TRACE_2("isStationary",_entity,_isStationary);

if (!is3DEN) exitWith {};

// Exit if user changed stationary params manually
if (
  !_isStationary &&
  {
    !((_entity get3DENAttribute QGVAR(DisableAI_FSM)) # 0) ||
    {!((_entity get3DENAttribute QGVAR(DisableAI_PATH)) # 0)} ||
    {!((_entity get3DENAttribute "lambs_danger_disableAI") # 0)}
  }
) exitWith {
  TRACE_2("isStationary abort, manually changed attrs",_entity,_isStationary);
};

TRACE_2("isStationary, updating attributes",_entity,_isStationary);

[_entity, _isStationary] spawn {
  params ["_entity", "_isStationary"];
  sleep 0.001;
  _entity set3DENAttribute [QGVAR(DisableAI_FSM), _isStationary];
  _entity set3DENAttribute [QGVAR(DisableAI_PATH), _isStationary];
  _entity set3DENAttribute ["lambs_danger_disableAI", _isStationary];
};
