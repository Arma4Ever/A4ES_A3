#include "script_component.hpp"

ADDON = false;

PREP(addSpecialItem);
PREP(checkGear);
PREP(checkId);
PREP(drawNametag);
PREP(drawNametag3d);
PREP(getUnitData);
PREP(onDraw3D);
PREP(updateSettings);

//sthud
PREP(sthud_hud_update);
PREP(sthud_hud_assignedTeam);
PREP(sthud_hud_core);
PREP(sthud_canvas);
PREP(sthud_init);

if(isNil QGVAR(members)) then {GVAR(members) = [[],[]];};

ADDON = true;
