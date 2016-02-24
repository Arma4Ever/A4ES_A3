#include "script_component.hpp"

ADDON = false;

PREP(handleKilled);
PREP(onEachFrame);
PREP(missionLog);
PREP(queryDB);
PREP(sendNametagData);
PREP(updateGameStatus);

GVAR(serverState) = "";

ADDON = true;
