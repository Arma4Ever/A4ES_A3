#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles missionSave 3DEN event
 */

diag_log "handleMissionSave";
0 call FUNC(objects3DENComp_saveLocalObjectsData);