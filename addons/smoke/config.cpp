#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common", "A3_Data_F_ParticleEffects"};
        author = ECSTRING(main,Author);
        authors[] = {"Zabuzard", "SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgCloudlets.hpp"
