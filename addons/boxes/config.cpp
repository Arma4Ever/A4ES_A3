#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {
            QGVAR(us_ammo_empty),
            QGVAR(us_weapons_empty),
            QGVAR(us_launchers_empty),
            QGVAR(us_explosives_empty),
            QGVAR(medical_crate_empty),
            QGVAR(weapon_cache_empty),
            QGVAR(ammo_cache_empty),
            QGVAR(support_cache_empty),
            QGVAR(support_cargo_box_empty),
            QGVAR(cargo_net_empty),
            QGVAR(metal_container_blue_empty),
            QGVAR(metal_container_yellow_empty),
            QGVAR(metal_container_white_empty),
            QGVAR(metal_case_large_empty),
            QGVAR(metal_case_medium_empty),
            QGVAR(metal_case_small_empty),
            QGVAR(plastic_case_large_empty),
            QGVAR(plastic_case_medium_empty),
            QGVAR(plastic_case_small_empty),
            QGVAR(all_items_crate),
            QGVAR(basic_medical_crate),
            QGVAR(advanced_medical_crate),
            QGVAR(basic_items_crate),
            QGVAR(advanced_items_crate),
            QGVAR(additional_equipment_crate),
            QGVAR(sandbags_crate)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_main", "a3cs_common"};
        version = A3CS_VERSION;
        versionStr = QUOTE(A3CS_VERSION);
        versionAr[] = A3CS_VERSION_ARRAY;
        author[] = {"SzwedzikPL", "ACE3 Team"};
        authorUrl = "http://arma3coop.pl";
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
