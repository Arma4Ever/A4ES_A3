#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3cs_common",
            "A3_Air_F_Jets_Plane_Fighter_01",
            "A3_Air_F_Jets_Plane_Fighter_02"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL", "Jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
