#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            "A4ES_Plane_Su35",
            "A4ES_Plane_J10",
            "A4ES_Plane_Jak135"
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a4es_common",
            "A3_Weapons_F",
            "A3_Air_F_Beta_Heli_Attack_01",
            "A3_Air_F_Jets_Plane_Fighter_01",
            "A3_Air_F_Jets_Plane_Fighter_02",
            "A3_Air_F_Jets_Plane_Fighter_04",
            "A3_Air_F_EPC_Plane_CAS_02"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL", "Jonpas", "Krzyciu"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
