#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            "B_MBT_01_mlrs_ATACMS_F"
        };
        ammo[] = {
            QGVAR(JASSM),
            QGVAR(JASSM_cluster),
            QGVAR(AGM84),
            QGVAR(C802AK),
            QGVAR(ATACMS),
            QGVAR(ATACMS_cluster)
        };
        magazines[] = {
            QGVAR(JASSM_magazine_x1),
            QGVAR(JASSM_cluster_magazine_x1),
            QGVAR(JASSM_pylonmissile_x1),
            QGVAR(JASSM_cluster_pylonmissile_x1),
            QGVAR(JASSM_pylonRack_1Rnd),
            QGVAR(JASSM_cluster_pylonRack_1Rnd),
            QGVAR(JASSM_PylonRack_x1),
            QGVAR(JASSM_cluster_PylonRack_x1),
            QGVAR(AGM84_magazine_x1),
            QGVAR(AGM84_pylonmissile_x1),
            QGVAR(AGM84_pylonRack_1Rnd),
            QGVAR(AGM84_PylonRack_x1),
            QGVAR(C802AK_magazine_x1),
            QGVAR(C802AK_pylonmissile_x1),
            QGVAR(C802AK_PylonRack_x1),
            QGVAR(2Rnd_ATACMS_rockets),
            QGVAR(2Rnd_ATACMS_rockets_cluster)
        };
        weapons[] = {
            QGVAR(JASSM_Launcher),
            QGVAR(JASSM_cluster_Launcher),
            QGVAR(JASSM_Launcher_Plane),
            QGVAR(JASSM_cluster_Launcher_Plane),
            QGVAR(AGM84_Launcher),
            QGVAR(AGM84_Launcher_Plane),
            QGVAR(C802AK_Launcher),
            QGVAR(ATACMS_launcher)
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a4es_common",
            "ace_missileguidance",
            "a4es_support"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL", "Krzyciu"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class a4es_functions_overrides {
    ace_missileguidance_fnc_gps_setupVehicle = QPATHTOF(functions\fnc_ace_gps_setupVehicle.sqf);
    ace_missileguidance_fnc_shouldFilterRadarHit = QPATHTOF(functions\fnc_ace_shouldFilterRadarHit.sqf);
};

#include "CfgEventHandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "GPSDialog.hpp"

class ace_missileguidance_AttackProfiles {
    class ATACMS {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(attackProfile_ATACMS);
        onFired = QFUNC(attackProfile_ATACMS_onFired);
    };
};