#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Structures_F_Heli_Items_Luggage",
            "A3_expEden",
            "A3_Props_F_Enoch_Military_Supplies",
            "A3_Props_F_Orange_Humanitarian_Supplies",
            "A3_Missions_F_Oldman",
            "A3_Supplies_F_Exp_Ammoboxes",
            "A3_Weapons_F_Ammoboxes",
            "A3_Supplies_F_Enoch_Ammoboxes",
            "A3_Weapons_F_Bootcamp_Ammoboxes",
            "A3_Supplies_F_Orange_Ammoboxes",
            "A3_Supplies_F_Heli_CargoNets",
            "A3_Structures_F_EPA_Mil_Scrapyard",
            "A3_Structures_F_Ind_Cargo",
            "A3_Props_F_Exp_Commercial_Market",
            "ace_medical_treatment",
            "plp_containers"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class CfgEditorCategories {
    class GVAR(edCat) {
        displayName = "A4ES Kontenery";
    };
};

class CfgEditorSubcategories {
    class GVAR(crates_50k) {
        displayName = "Skrzynki 50k";
    };
    class GVAR(cargo_50k) {
        displayName = "Cargo 50k";
    };
    class GVAR(lockers_15k) {
        displayName = "Szafki osobiste 15k";
    };
};

#include "CfgVehicles.hpp"
