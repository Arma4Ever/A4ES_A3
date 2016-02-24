#include "script_component.hpp"

ADDON = false;

PREP(canAccessPanelModule);
PREP(getOnlineAdmins);
PREP(onLoadAdminPanel);
PREP(onPanelLogTypeChange);
PREP(openAdminPanel);
PREP(openPanelModule);
PREP(sendAdminActionLog);
PREP(updatePanelMissionData);
PREP(showAdminMessage);
PREP(getServerLogsData);
PREP(loadPanelLogs);
PREP(isServerAdmin);
PREP(isAdmin);

PREP(moduleAdminMessages);
PREP(moduleDebug3rdPerson);
PREP(moduleDebugCamera);
PREP(moduleDebugConsole);
PREP(moduleEndMission);

GVAR(debugCameraEnabled) = false;
GVAR(debug3rdPersonEnabled) = false;

ADDON = true;
