/*
 * Author: SzwedzikPL
 *
 * Create A3MP LHD lights on every client
 */

#include "script_component.hpp"

params ["_object"];
private ["_objectPos"];

if(!hasInterface) exitWith {};

_objectPos = getPos _object;

{
    private ["_light", "_lightVector"];
    _lightVector = _x;
    _light = "#lightpoint" createVehicleLocal _objectPos;
    _light setLightUseFlare false;
    _light setLightAmbient [1, 1, 1];
    _light setLightColor [1, 1, 1];
    _light setLightIntensity 40;
    _light setLightDayLight false;
    _light lightAttachObject [_object, _lightVector];
} forEach [
    [9.1, -1.1, 2.65],
    [9.1, -0.25, 2.65],
    [10.22, 13.1, 2.65],
    [10.22, 14.2, 2.65],
    [14.85, -1.25, 2.65],
    [14.85, -0.2, 2.65],
    [14.85, 5.9, 2.65],
    [14.85, 7, 2.65]
];
