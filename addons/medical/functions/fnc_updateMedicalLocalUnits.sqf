#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns list of local units with enabled ace damage for ace medical statemachine
 */

if (GVAR(localMedicalUnitsLastUpdate) < diag_frameNo) then {
  GVAR(localMedicalUnits) = (0 call ACEFUNC(common,getLocalUnits)) select {
    _x getVariable [QGVAR(aceDamageEnabled), false]
  };
  GVAR(localMedicalUnitsLastUpdate) = diag_frameNo;
};
