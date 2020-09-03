#include "script_component.hpp"
/*
 * Author: veteran29, SzwedzikPL
 * Checks if tank weapon shot can heat up the vehicle
 */
params ["_vehicle", "_weapon", "", "", "", "", "", "_gunner"];

local _vehicle && {(CBA_missionTime > _vehicle getVariable [QGVAR(heatTime), 0])
  && {(_weapon isKindOf ["CannonCore", configFile >> "CfgWeapons"])
    && {!isPlayer _gunner}
  }
}
