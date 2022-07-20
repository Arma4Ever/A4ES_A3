#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles deleted EH for tracked projectiles
 */

params ["_projectile"];
TRACE_1("handleProjectileDeleted",_projectile);

if (isNull _projectile) exitWith {};

private _endPos = getPos _projectile;
private _dir = getDir _projectile;

private _index = GVAR(radarProjectiles) findIf {(_x # 0) == _projectile};
if (_index == -1) exitWith {};

private _radarData = GVAR(radarProjectiles) select _index;
_radarData set [0, objNull];
_radarData set [3, _dir];
_radarData set [4, _endPos];
