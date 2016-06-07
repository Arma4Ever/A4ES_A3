#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(visionAssistanceDraw) = -1;
GVAR(visionAssistanceEnabled) = false;
GVAR(visionAssistanceIconSize) = 5;
GVAR(visionAssistanceTextSize) = 0.04;
GVAR(visionAssistanceUnits) = [];
GVAR(visionAssistanceDistance) = 2000;
GVAR(visionAssistanceLastRefresh) = 0;

ADDON = true;
