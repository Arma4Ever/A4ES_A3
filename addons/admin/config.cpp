#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common"};
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
        mode = 1;
        type = 3;
        serveradmin = 0;
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
class GVAR(admins) {
    class szwedzikpl {
        uid = "76561198005080407";
        admin = 1;
        allowedModules[] = {"endMission", "adminMessages", "debugConsole", "debugCamera", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class alduric {
        uid = "76561197998970466";
        allowedModules[] = {"endMission", "adminMessages", "debugCamera", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class sarlack {
        uid = "76561198007533644";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class shock {
        uid = "76561197984292422";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class bohun {
        uid = "76561198001065845";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class radrix {
        uid = "76561198091312264";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class staffo {
        uid = "76561198002312509";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class vincer {
        uid = "76561198026270754";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class wasyl {
        uid = "76561198046275691";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class diament {
        uid = "76561198090975186";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class astetyk {
        uid = "76561198028171810";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class malpa {
        uid = "76561198135829180";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class panuh {
        uid = "76561198025557349";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class aki {
        uid = "76561198024269757";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class modzyn {
        uid = "76561198055300928";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class harven {
        uid = "76561198066648408";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class venon {
        uid = "76561198044299447";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class sabig {
        uid = "76561198028744860";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class jonny {
        uid = "76561198119088699";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class hubi {
        uid = "76561198042922956";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
    class minnow {
        uid = "76561198264982630";
        allowedModules[] = {"endMission", "adminMessages", "debugLogs", "missionLogs", "playersList", "adminList", "curatorList", "activeScripts", "activeScriptsServer"};
    };
};
