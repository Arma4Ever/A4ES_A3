/*
 * Author: SzwedzikPL
 * Killed HitPart handler
 */
#include "script_component.hpp"

private _params = _this select 0;
_params params ["_unit", "_shooter", "", "", "", "", "_ammoData"];

private _ammo = _ammoData select 4;
TRACE_2("handleHitPart",_shooter,_ammo);

//To Do: better solution that public var every hit
_unit setVariable ["a3cs_lastHitPartSource", _shooter, true];
_unit setVariable ["a3cs_lastHitPartSourceAmmo", _ammo, true];
