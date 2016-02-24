/*
 * Author: SzwedzikPL
 * Killed HitPart handler
 */
#include "script_component.hpp"

private _params = _this select 0;
_params params ["_unit", "_shooter"];

A3CS_LOGINFO_1("handleHitPart: %1",[_unit, _shooter])

_unit setVariable ["a3cs_lastHitPartSource", _shooter, true]; //To Do: better solution that public var every hit
