#include "script_component.hpp"
/*
 * Author: Krzyciu
 * locationName module editor exec function
 */

params ["_logic"];
private _text = "";
private _locationType = "";
private _customName = "";

private _mapLocation = nearestLocation [_logic, ""];
private _pos = getPos _mapLocation;

_logic call FUNC(locationName_restorePreviousLocation);
_logic setVariable [QGVAR(previous), [_mapLocation, text _mapLocation, type _mapLocation]];

if (type _mapLocation isEqualTo "Mount") then {
  // Height marks don't have text value
  _text = "Mount";
} else {
  _text = text _mapLocation;
};

_logic set3DENAttribute ["position", _pos];
_logic set3DENAttribute [QGVAR(mapName), _text];

if (_logic getVariable [QGVAR(replaceName), false]) then {
  _locationType = _logic getVariable [QGVAR(locationType), "Invisible"];	
  _customName = _logic getVariable [QGVAR(customName), ""];
  [_mapLocation,_customName,_locationType] call FUNC(locationName_moduleExecLocal);
} else {
  _locationType = "Invisible";
  [_mapLocation,_customName,_locationType] call FUNC(locationName_moduleExecLocal);
};