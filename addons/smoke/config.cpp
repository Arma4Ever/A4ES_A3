#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common"};
        authors[] = {"SzwedzikPL", "ACE3 Team"};
        AUTHOR_CONFIG;
        VERSION_CONFIG;
    };
};

#include "CfgCloudlets.hpp"

class SmokeShellWhiteEffect {
    class SmokeShell {
        simulation = "particles";
        type = QGVAR(SmokeShellWhiteFilled);
        position[] = {0,0,0};
        intensity = 5;
        interval = 0.333;
    };
    class SmokeShell2 {
        simulation = "particles";
        type = "SmokeShellWhite2";
        position[] = {0,0,0};
        intensity = 0;
        interval = 0;
    };
};
