class CfgVehicles {
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
        displayName = "$STR_A3CS_Editor_displayName_fieldhospital";
        vehicleClass = "a3cs_objects";
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

    /*
    #define SCOPE_PUBLIC scope = 2

    //--- Budynki
    class Land_Offices_01_V1_F: House_F { SCOPE_PUBLIC; };
    class Land_WIP_F: House_F { SCOPE_PUBLIC; };
    class Land_Unfinished_Building_01_F: House_F { SCOPE_PUBLIC; };
    class Land_Unfinished_Building_02_F: House_F { SCOPE_PUBLIC; };
    class Land_i_Barracks_V1_F: House_F { SCOPE_PUBLIC; };
    class Land_i_Barracks_V1_dam_F: Land_i_Barracks_V1_F { SCOPE_PUBLIC; };
    class Land_i_Barracks_V2_F: Land_i_Barracks_V1_F { SCOPE_PUBLIC; };
    class Land_i_Barracks_V2_dam_F: Land_i_Barracks_V1_dam_F { SCOPE_PUBLIC; };
    class Land_u_Barracks_V2_F: Land_i_Barracks_V1_F { SCOPE_PUBLIC; };
    class Land_Airport_Tower_F: House_F { SCOPE_PUBLIC; };
    class Land_Factory_Main_F: House_F { SCOPE_PUBLIC; };
    class Land_Metal_Shed_F: House_Small_F { SCOPE_PUBLIC; };
    class Land_i_shed_ind_F: House_F { SCOPE_PUBLIC; };
    class Land_u_shed_ind_F : House_F { SCOPE_PUBLIC; };
    class Land_TBox_F: House_Small_F { SCOPE_PUBLIC; };
    class Land_cargo_tower_v1_f: Cargo_tower_base_F { SCOPE_PUBLIC; };
    class Land_cargo_tower_v2_f: Cargo_tower_base_F  { SCOPE_PUBLIC; };
    class Land_cargo_tower_v3_f: Cargo_tower_base_F  { SCOPE_PUBLIC; };
    class Land_Cargo_HQ_V1_F: Cargo_HQ_base_F { SCOPE_PUBLIC; };
    class Land_Cargo_HQ_V2_F: Cargo_HQ_base_F { SCOPE_PUBLIC; };
    class Land_Cargo_HQ_V3_F: Cargo_HQ_base_F { SCOPE_PUBLIC; };
    class Land_Cargo_House_V1_F: Cargo_House_base_F { SCOPE_PUBLIC; };
    class Land_Cargo_House_V2_F: Cargo_House_base_F { SCOPE_PUBLIC; };
    class Land_Cargo_House_V3_F: Cargo_House_base_F { SCOPE_PUBLIC; };
    class Land_Cargo_Patrol_V1_F: Cargo_Patrol_base_F { SCOPE_PUBLIC; };
    class Land_Cargo_Patrol_V2_F: Cargo_Patrol_base_F { SCOPE_PUBLIC; };
    class Land_Cargo_Patrol_V3_F: Cargo_Patrol_base_F { SCOPE_PUBLIC; };
    class Land_research_hq_f: House_F { SCOPE_PUBLIC; };
    class Land_research_house_v1_f: House_Small_F { SCOPE_PUBLIC; };
    class Land_medevac_hq_v1_f: Cargo_HQ_base_F { SCOPE_PUBLIC; };
    class Land_medevac_house_v1_f: Cargo_House_base_F { SCOPE_PUBLIC; };
    class Land_dome_big_f: House_F { SCOPE_PUBLIC; };
    class Land_dome_small_f: House_F { SCOPE_PUBLIC; };
    class Land_Slum_House01_F: House_Small_F { SCOPE_PUBLIC; };
    class Land_Slum_House02_F: Land_Slum_House01_F { SCOPE_PUBLIC; };
    class Land_Slum_House03_F: Land_Slum_House01_F { SCOPE_PUBLIC; };
    class Land_cargo_house_slum_F: House_Small_F { SCOPE_PUBLIC; };

    //--- Wieże radiowe
    class Land_TTowerBig_1_F: House_F { SCOPE_PUBLIC; };
    class Land_TTowerBig_2_F: House_F { SCOPE_PUBLIC; };
    class Land_TTowerSmall_1_F: House_Small_F { SCOPE_PUBLIC; };
    class Land_TTowerSmall_2_F: House_Small_F { SCOPE_PUBLIC; };
    class Land_Communication_F: House_F { SCOPE_PUBLIC; };

    //--- Obiekty
    class Land_dp_transformer_F: House_F { SCOPE_PUBLIC; };
    class Land_spp_Transformer_F: House_F { SCOPE_PUBLIC; };
    class Land_cargo_addon01_V1_F: House_small_F { SCOPE_PUBLIC; };
    class Land_cargo_addon01_V2_F: House_small_F { SCOPE_PUBLIC; };
    class Land_cargo_addon02_V1_F: House_small_F { SCOPE_PUBLIC; };
    class Land_cargo_addon02_V2_F: House_small_F { SCOPE_PUBLIC; };
    class Land_Device_assembled_F: Strategic { SCOPE_PUBLIC; };
    class Land_Device_disassembled_F: Land_Device_assembled_F { SCOPE_PUBLIC; };
    class Submarine_01_F: FloatingStructure_F { SCOPE_PUBLIC; };

    //--- Lampy
    class Land_PortableLight_single_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_PortableLight_double_F: Land_PortableLight_single_F { SCOPE_PUBLIC; };
    class Land_LampAirport_off_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampAirport_F: Land_LampAirport_off_F { SCOPE_PUBLIC; };
    class Land_LampDecor_off_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampDecor_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampHalogen_off_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampHalogen_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampHarbour_off_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampHarbour_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampShabby_off_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampShabby_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampSolar_off_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampSolar_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampStadium_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampStreet_off_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampStreet_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampStreet_small_off_F: Lamps_base_F { SCOPE_PUBLIC; };
    class Land_LampStreet_small_F: Lamps_base_F { SCOPE_PUBLIC; };
    */
};
