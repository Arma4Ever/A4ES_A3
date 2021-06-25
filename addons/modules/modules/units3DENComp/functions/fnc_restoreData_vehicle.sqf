#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Restores vehicle for 3DEN from vehicle data
 */

params ["_logic", "_vehicleData"];
TRACE_2("units3DENComp_restoreData_vehicle",_logic,_vehicleData);

_vehicleData params [
  "_className",
  "_posATL",
  "_rotation",
  "_vectors",
  "_disableRandomization",
  "_texture",
  "_animations",
  "_dynamicSimulation",
  "_reportRemoteTargets",
  "_receiveRemoteTargets",
  "_reportOwnPosition",
  "_radarUsageAI",
  "_aceCookoffEnable",
  "_aceCookoffEnableAmmoCookoff",
  "_engineOn",
  "_enableHeadlights"
];

private _vehicle = create3DENEntity ["Object", _className, _posATL, true];

_vehicle set3DENAttribute ["position", _posATL];
_vehicle set3DENAttribute ["rotation", _rotation];
_vehicle set3DENAttribute [QEGVAR(editor,disableRandomization), _disableRandomization];
_vehicle set3DENAttribute ["ObjectTexture", _texture];
_vehicle set3DENAttribute ["VehicleCustomization", [[], _animations]];
_vehicle set3DENAttribute ["dynamicSimulation", _dynamicSimulation];
_vehicle set3DENAttribute [QEGVAR(editor,dynamicSimulationInited), true];
_vehicle set3DENAttribute ["reportRemoteTargets", _reportRemoteTargets];
_vehicle set3DENAttribute ["receiveRemoteTargets", _receiveRemoteTargets];
_vehicle set3DENAttribute ["reportOwnPosition", _reportOwnPosition];
_vehicle set3DENAttribute ["radarUsageAI", _radarUsageAI];
_vehicle set3DENAttribute [QACEGVAR(cookoff,enable), _aceCookoffEnable];
_vehicle set3DENAttribute [QACEGVAR(cookoff,enableAmmoCookoff), _aceCookoffEnableAmmoCookoff];
_vehicle set3DENAttribute [QEGVAR(editor,engineOn), _engineOn];
_vehicle set3DENAttribute [QEGVAR(editor,enableHeadlights), _enableHeadlights];

add3DENConnection ["Sync", [_vehicle], _logic];

_vehicle
