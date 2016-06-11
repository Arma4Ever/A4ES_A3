class CfgVehicles {
    class Logic;
    class Module_F;
    class ACE_Module;
    class ace_zeus_moduleBase: Module_F {};
    #include "hidden_modules.hpp"

    class House_F;
    class House_Small_F;
    class FloatingStructure_F;
    class Cargo_House_base_F;
    class Cargo_tower_base_F;
    class Cargo_HQ_base_F;
    class Cargo_Patrol_base_F;
    class Strategic;
    class Camping_base_F;
    class Steerable_Parachute_F;
    class Lamps_base_F: House_Small_F {};

    //--- Szpital polowy
    class GVAR(fieldhospital): Camping_base_F {
        displayName = CSTRING(FieldHospital_DisplayName);
        vehicleClass = "a3cs_objects";
        editorCategory = "EdCat_Default";
        editorSubcategory  = "EdSubcat_Default";
        author = "$STR_A3_Bohemia_Interactive";
        scope = 2;
        scopeCurator = 2;
        model = "\A3\Structures_F_Bootcamp\Civ\Camping\PartyTent_01_F.p3d";
        icon = "iconObject_1x1";
        destrType = "DestructTent";
        cost = 100;
        armor = 3;
        mapSize = 13.06;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {PATHTOF(data\fieldhospital_01_co.paa)};
        XEH_ENABLED;
    };
    class B_Steerable_Parachute_F: Steerable_Parachute_F {
        scope = 2;
        author = "$STR_A3_Bohemia_Interactive";
        faction = "BLU_F";
        crew = "B_Soldier_F";
        side = 1;
        vehicleClass = "Air";
        editorSubcategory = "EdSubcat_Planes";
    };
    class O_Steerable_Parachute_F: B_Steerable_Parachute_F {
        scope = 2;
        author = "$STR_A3_Bohemia_Interactive";
        faction = "OPF_F";
        crew = "O_Soldier_F";
        side = 0;
    };
    class I_Steerable_Parachute_F: B_Steerable_Parachute_F {
        scope = 2;
        author = "$STR_A3_Bohemia_Interactive";
        faction = "IND_F";
        crew = "I_Soldier_F";
        side = 2;
    };
};
