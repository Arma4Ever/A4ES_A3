#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a4es_common"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgNotifications.hpp"
#include "dialogs.hpp"

class GVAR(modules) {
    /* ACTIONS */
    class endMission {
        mode = 2;
        type = 0;
        serveradmin = 1;
        displayName = CSTRING(Module_EndMission_DisplayName);
        function = QFUNC(moduleEndMission);
    };
    class adminMessages {
        mode = 2;
        type = 2;
        serveradmin = 1;
        displayName = CSTRING(Module_AdminMessages_DisplayName);
        function = QFUNC(moduleAdminMessages);
    };
    class debugConsole {
        mode = 1;
        type = 2;
        serveradmin = 0;
        displayName = CSTRING(Module_DebugConsole_DisplayName);
        function = QFUNC(moduleDebugConsole);
    };
    class debugCamera {
        mode = 1;
        type = 3;
        serveradmin = 0;
        displayName = "%1";
        function = QFUNC(moduleDebugCamera);
        variable = QGVAR(debugCameraEnabled);
        defaultValue = 0;
        values[] = {CSTRING(Module_DebugCamera_EnableCamera), CSTRING(Module_DebugCamera_DisableCamera)};
    };
    class debug3rdPerson {
        mode = 1;
        type = 3;
        serveradmin = 0;
        displayName = "%1";
        function = QFUNC(moduleDebug3rdPerson);
        variable = QGVAR(debug3rdPersonEnabled);
        defaultValue = 0;
        values[] = {CSTRING(Module_Debug3rdPerson_Enable3rdPerson), CSTRING(Module_Debug3rdPerson_Disable3rdPerson)};
    };
    class debugCurator {
        mode = 2;
        type = 3;
        serveradmin = 1;
        displayName = "%1";
        function = QFUNC(moduleDebugCurator);
        variable = QGVAR(debugCuratorEnabled);
        defaultValue = 0;
        values[] = {CSTRING(Module_DebugCurator_EnableCurator), CSTRING(Module_DebugCurator_DisableCurator)};
    };
    /* LOGS */
    class debugLogs {
        mode = 2;
        type = 1;
        serveradmin = 1;
        displayName = CSTRING(Module_DebugLogs_DisplayName);
        server = 1;
    };
    class missionLogs {
        mode = 1;
        type = 1;
        serveradmin = 1;
        displayName = CSTRING(Module_MissionLogs_DisplayName);
        server = 1;
    };
    class adminLogs {
        mode = 1;
        type = 1;
        serveradmin = 1;
        displayName = CSTRING(Module_AdminLogs_DisplayName);
        server = 1;
    };
    class playersList {
        mode = 1;
        type = 1;
        serveradmin = 1;
        displayName = CSTRING(Module_PlayersList_DisplayName);
        server = 0;
    };
    class adminList {
        mode = 1;
        type = 1;
        serveradmin = 1;
        displayName = CSTRING(Module_AdminList_DisplayName);
        server = 0;
    };
    class curatorList {
        mode = 1;
        type = 1;
        serveradmin = 1;
        displayName = CSTRING(Module_CuratorList_DisplayName);
        server = 1;
    };
    class activeScripts {
        mode = 2;
        type = 1;
        serveradmin = 1;
        displayName = CSTRING(Module_ActiveScripts_DisplayName);
        server = 0;
    };
    class activeScriptsServer {
        mode = 1;
        type = 1;
        serveradmin = 1;
        displayName = CSTRING(Module_ActiveScriptsServer_DisplayName);
        server = 1;
    };
};

#define CADRE_ADMIN(STEAMID, NICKNAME) class NICKNAME { \
    uid = QUOTE(STEAMID); \
    allowedModules[] = {"endMission", "adminMessages", "debugCurator", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"}; \
}

class GVAR(admins) {
    class SzwedzikPL {
        uid = "76561198005080407";
        admin = 1;
        allowedModules[] = {"endMission", "adminMessages", "debugConsole", "debugCamera", "debugCurator", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };

    class Krzyciu {
        uid = "76561198017606120";
        admin = 1;
        allowedModules[] = {"endMission", "adminMessages", "debugConsole", "debugCurator", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };

    CADRE_ADMIN(76561198090975186,Diamentowy);
    CADRE_ADMIN(76561198091312264,Radrix);
    CADRE_ADMIN(76561198055300928,Modzyn);
    CADRE_ADMIN(76561197964250959,Foton);

    CADRE_ADMIN(76561198119905360,Symbiotyk);
    CADRE_ADMIN(76561198192520870,Oscar);
    CADRE_ADMIN(76561198062200104,Gazela);
    CADRE_ADMIN(76561198858767937,Sidorowicz);
    CADRE_ADMIN(76561198134192331,Quiet);
    CADRE_ADMIN(76561198023415639,Monobear);
};
