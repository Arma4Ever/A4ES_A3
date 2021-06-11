#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Saves vehicle data for units3DENComp module
 */

params ["_vehicle"];
TRACE_1("units3DENComp_saveData_vehicle",_vehicle);

// Save vehicle animations
private _animations = ((_vehicle get3DENAttribute "VehicleCustomization") # 0) # 1;

[
  typeOf _vehicle,
  getPosATL _vehicle,
  (_vehicle get3DENAttribute "rotation") # 0,
  [vectorDirVisual _vehicle, vectorUpVisual _vehicle],
  (_vehicle get3DENAttribute QEGVAR(editor,disableRandomization)) # 0,
  (_vehicle get3DENAttribute "ObjectTexture") # 0,
  _animations,
  (_vehicle get3DENAttribute "dynamicSimulation") # 0,
  (_vehicle get3DENAttribute "reportRemoteTargets") # 0,
  (_vehicle get3DENAttribute "receiveRemoteTargets") # 0,
  (_vehicle get3DENAttribute "reportOwnPosition") # 0,
  (_vehicle get3DENAttribute "radarUsageAI") # 0,
  (_vehicle get3DENAttribute QACEGVAR(cookoff,enable)) # 0,
  (_vehicle get3DENAttribute QACEGVAR(cookoff,enableAmmoCookoff)) # 0
]
