#include "script_component.hpp"

ADDON = false;

PREP(initMan);
PREP(handleKilled);
PREP(onEachFrame);
PREP(getMissionData);
PREP(missionLog);
PREP(queryDB);
PREP(sendNametagData);
PREP(updateGameStatus);

GVAR(status_id) = "";

ADDON = true;
