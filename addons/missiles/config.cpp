#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        ammo[] = {
            QGVAR(JASSM),
            QGVAR(JASSM_cluster)
        };
        magazines[] = {
            QGVAR(JASSM_magazine_x1),
            QGVAR(JASSM_cluster_magazine_x1),
            QGVAR(JASSM_pylonmissile_x1),
            QGVAR(JASSM_cluster_pylonmissile_x1),
            QGVAR(JASSM_pylonRack_1Rnd),
            QGVAR(JASSM_cluster_pylonRack_1Rnd),
            QGVAR(JASSM_PylonRack_x1),
            QGVAR(JASSM_cluster_PylonRack_x1)
        };
        weapons[] = {
            QGVAR(JASSM_Launcher),
            QGVAR(JASSM_cluster_Launcher),
            QGVAR(JASSM_Launcher_Plane),
            QGVAR(JASSM_cluster_Launcher_Plane)
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3cs_common",
            "ace_missileguidance"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL", "Krzyciu"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
