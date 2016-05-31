#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common"};
        author = "SzwedzikPL, ACE3 Team";
        authorUrl = "http://arma3coop.pl";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgCloudlets.hpp"
#include "CfgLights.hpp"

class Gau8ShellImpact {
    class LightExp {
        simulation = "light";
        type = "Gau8ShellExplLght";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
    class Explosion1 {
        simulation = "particles";
        type = "Gau8ShellExplCldlt";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
    class ExpSpark {
        simulation = "particles";
        type = "Gau8ShellSprksCldlt";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
    class SmallSmoke1 {
        simulation = "particles";
        type = "Gau8ShellSmkCldlt";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
    class MedDust1 {
        simulation = "particles";
        type = "Gau8ShellDstCldlt";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
    class BigDirt1 {
        simulation = "particles";
        type = "Gau8ShellDrtCldlt";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
};
