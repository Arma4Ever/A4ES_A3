#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Clears corpse gear locally
 */

params ["_corpse"];
TRACE_1("clearGear",_corpse);

{_corpse unlinkItem _x} forEach (assignedItems _corpse);
_corpse unlinkItem (hmd _corpse);
removeGoggles _corpse;
removeHeadgear _corpse;
removeVest _corpse;
removeBackpack _corpse;
_corpse removeWeapon (primaryWeapon _corpse);
_corpse removeWeapon (secondaryWeapon _corpse);
_corpse removeWeapon (handgunWeapon _corpse);
_corpse removeWeapon (binocular _corpse);
