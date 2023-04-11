#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a4es_common",
            "A3_Data_F_ParticleEffects",
            "Blastcore_VEP"
        };
        author = ECSTRING(main,Author);
        authors[] = {"Zabuza", "SzwedzikPL", "ARK"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgCloudlets.hpp"
#include "CfgLights.hpp"