class CfgVehicles {
    class Box_NATO_Support_F;
    class Box_NATO_Ammo_F;
    class Box_NATO_AmmoVeh_F;
    class CargoNet_01_base_F;
    class B_supplyCrate_F;
    class MetalCase_01_base_F;
    class PlasticCase_01_base_F;

    class GVAR(base): Box_NATO_Support_F {
        scope = 0;
        scopeCurator = 0;
        vehicleClass = "a3cs_crates_empty"; //a3cs_crates
        accuracy = 1000;
        transportMaxWeapons = 9001;
        transportMaxMagazines = 9001;
        transportMaxItems = 9001;
        transportMaxBackpacks = 9001;
        maximumload = 9001;
        class TransportMagazines {};
        class TransportWeapons {};
        class TransportItems {};
        class TransportBackpacks {};
    };

    //drewniane us
    class GVAR(us_ammo_empty): GVAR(base) {
        displayName = CSTRING(US_Ammo_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        icon = "iconCrateAmmo";
        model = "\A3\weapons_F\AmmoBoxes\USBasicAmmo";
        ace_cargo_size = 1;
        ace_cargo_canLoad = 1;
        ace_dragging_canCarry = 1;
        ace_dragging_carryPosition[] = {0,1.2,0};
        ace_dragging_carryDirection = 0;
        ace_dragging_canDrag = 1;
        ace_dragging_dragPosition[] = {0,1.2,0};
        ace_dragging_dragDirection = 0;
    };
    class GVAR(us_weapons_empty): GVAR(base) {
        displayName = CSTRING(US_Weapons_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        icon = "iconCrateWpns";
        model = "\A3\weapons_F\AmmoBoxes\USBasicWeapons";
        ace_cargo_size = 2;
        ace_cargo_canLoad = 1;
        ace_dragging_canCarry = 0;
        ace_dragging_canDrag = 0;
    };
    class GVAR(us_launchers_empty): GVAR(base) {
        displayName = CSTRING(US_Launchers_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
		icon = "iconCrateLong";
		model = "\A3\weapons_F\AmmoBoxes\USLaunchers";
        ace_cargo_size = 1;
        ace_cargo_canLoad = 1;
        ace_dragging_canCarry = 0;
        ace_dragging_canDrag = 0;
    };
    class GVAR(us_explosives_empty): GVAR(base) {
        displayName = CSTRING(US_Explosives_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
		icon = "iconCrateOrd";
		model = "\A3\weapons_F\AmmoBoxes\Proxy_UsBasicExplosives";
        ace_cargo_size = 1;
        ace_cargo_canLoad = 1;
        ace_dragging_canCarry = 1;
        ace_dragging_carryPosition[] = {0,1.2,0};
        ace_dragging_carryDirection = 0;
        ace_dragging_canDrag = 1;
        ace_dragging_dragPosition[] = {0,1.2,0};
        ace_dragging_dragDirection = 0;
    };

    //ace medical crate
    class GVAR(medical_crate_empty): GVAR(base) {
        displayName = CSTRING(Medical_Crate_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        icon = "iconCrate";
        model = "\z\ace\addons\medical\data\ace_medcrate";
    };

    //fia cache
    class GVAR(weapon_cache_empty): GVAR(base) {
        displayName = CSTRING(Weapon_Cache_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        mapSize = 3.19;
        model = "\A3\Weapons_F_Bootcamp\Ammoboxes\Weaponsbox_02_F";
		icon = "iconCrateWpns";
        ace_cargo_size = 2;
        ace_cargo_canLoad = 1;
        ace_dragging_canCarry = 0;
        ace_dragging_canDrag = 0;
    };
    class GVAR(ammo_cache_empty): GVAR(base) {
        displayName = CSTRING(Ammo_Cache_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
		mapSize = 3.19;
        model = "\A3\Weapons_F_Bootcamp\Ammoboxes\Ammobox_02_F";
		icon = "iconCrateAmmo";
        ace_cargo_size = 2;
        ace_cargo_canLoad = 1;
        ace_dragging_canCarry = 0;
        ace_dragging_canDrag = 0;
    };
    class GVAR(support_cache_empty): GVAR(base) {
        displayName = CSTRING(Support_Cache_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
		mapSize = 3.19;
        model = "\A3\Weapons_F_Bootcamp\Ammoboxes\Itembox_02_F";
		icon = "iconCrateSupp";
        ace_cargo_size = 2;
        ace_cargo_canLoad = 1;
        ace_dragging_canCarry = 0;
        ace_dragging_canDrag = 0;
    };

    //male skrzyneczki
    class GVAR(metal_case_large_empty): MetalCase_01_base_F {
        displayName = CSTRING(Metal_Case_Large_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        mapSize = 1.25;
        vehicleClass = "a3cs_crates_empty";
        model = "\A3\Structures_F_Heli\Items\Luggage\MetalCase_01_large_F";
        icon = "iconObject_1x2";
        accuracy = 1000;
        transportMaxWeapons = 9001;
        transportMaxMagazines = 9001;
        transportMaxItems = 9001;
        transportMaxBackpacks = 9001;
        maximumload = 9001;
        class TransportMagazines {};
        class TransportWeapons {};
        class TransportItems {};
        class TransportBackpacks {};
        XEH_ENABLED;
        ace_cargo_size = 1;
        ace_cargo_canLoad = 1;
        ace_dragging_canCarry = 1;
        ace_dragging_carryPosition[] = {0,1.2,0};
        ace_dragging_carryDirection = 0;
        ace_dragging_canDrag = 1;
        ace_dragging_dragPosition[] = {0,1.2,0};
        ace_dragging_dragDirection = 0;
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ACE_Interaction_MainAction";
                selection = "";
                distance = 2;
                condition = "true";
                class ACE_OpenBox {
                    displayName = "$STR_ACE_Interaction_OpenBox";
                    condition = QUOTE(alive _target);
                    statement = QUOTE(_player action [ARR_2(QUOTE(QUOTE(Gear)), _target)]);
                    showDisabled = 0;
                    priority = -1;
                };
            };
        };
    };
    class GVAR(metal_case_medium_empty): GVAR(metal_case_large_empty) {
        displayName = CSTRING(Metal_Case_Medium_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        mapSize = 0.81;
        model = "\A3\Structures_F_Heli\Items\Luggage\MetalCase_01_medium_F";
        icon = "iconObject_4x5";
    };
    class GVAR(metal_case_small_empty): GVAR(metal_case_large_empty) {
        displayName = CSTRING(Metal_Case_Small_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        mapSize = 0.65;
        model = "\A3\Structures_F_Heli\Items\Luggage\MetalCase_01_small_F";
        icon = "iconObject_1x2";
    };
    class GVAR(plastic_case_large_empty): PlasticCase_01_base_F {
        displayName = CSTRING(Plastic_Case_Large_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        mapSize = 1.25;
        vehicleClass = "a3cs_crates_empty";
        model = "\A3\Structures_F_Heli\Items\Luggage\PlasticCase_01_large_F";
        icon = "iconObject_1x2";
        accuracy = 1000;
        transportMaxWeapons = 9001;
        transportMaxMagazines = 9001;
        transportMaxItems = 9001;
        transportMaxBackpacks = 9001;
        maximumload = 9001;
        class TransportMagazines {};
        class TransportWeapons {};
        class TransportItems {};
        class TransportBackpacks {};
        XEH_ENABLED;
        ace_cargo_size = 1;
        ace_cargo_canLoad = 1;
        ace_dragging_canCarry = 1;
        ace_dragging_carryPosition[] = {0,1.2,0};
        ace_dragging_carryDirection = 0;
        ace_dragging_canDrag = 1;
        ace_dragging_dragPosition[] = {0,1.2,0};
        ace_dragging_dragDirection = 0;
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ACE_Interaction_MainAction";
                selection = "";
                distance = 2;
                condition = "true";
                class ACE_OpenBox {
                    displayName = "$STR_ACE_Interaction_OpenBox";
                    condition = QUOTE(alive _target);
                    statement = QUOTE(_player action [ARR_2(QUOTE(QUOTE(Gear)), _target)]);
                    showDisabled = 0;
                    priority = -1;
                };
            };
        };
    };
    class GVAR(plastic_case_medium_empty): GVAR(plastic_case_large_empty) {
        displayName = CSTRING(Plastic_Case_Medium_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        mapSize = 0.81;
        model = "\A3\Structures_F_Heli\Items\Luggage\PlasticCase_01_medium_F";
        icon = "iconObject_4x5";
    };
    class GVAR(plastic_case_small_empty): GVAR(plastic_case_large_empty) {
        displayName = CSTRING(Plastic_Case_Small_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        mapSize = 0.65;
        model = "\A3\Structures_F_Heli\Items\Luggage\PlasticCase_01_small_F";
        icon = "iconObject_1x2";
    };

    //cargo
    class GVAR(support_cargo_box_empty): B_supplyCrate_F {
        displayName = CSTRING(Support_Cargo_Box_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        vehicleClass = "a3cs_crates_empty";
        accuracy = 1000;
        transportMaxWeapons = 9001;
        transportMaxMagazines = 9001;
        transportMaxItems = 9001;
        transportMaxBackpacks = 9001;
        maximumload = 9001;
        class TransportMagazines {};
        class TransportWeapons {};
        class TransportItems {};
        class TransportBackpacks {};
        ace_cargo_size = 2;
        ace_cargo_canLoad = 1;
        ace_dragging_canCarry = 0;
        ace_dragging_canDrag = 0;
    };

    class GVAR(cargo_net_empty): CargoNet_01_base_F {
        displayName = CSTRING(Cargo_Net_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
		mapSize = 1.51;
        model = "\A3\Supplies_F_Heli\CargoNets\CargoNet_01_box_F";
		icon = "iconObject_1x1";
        vehicleClass = "a3cs_crates_empty";
        accuracy = 1000;
        transportMaxWeapons = 9001;
        transportMaxMagazines = 9001;
        transportMaxItems = 9001;
        transportMaxBackpacks = 9001;
        maximumload = 9001;
        class TransportMagazines {};
        class TransportWeapons {};
        class TransportItems {};
        class TransportBackpacks {};
        ace_cargo_size = 2;
        ace_cargo_canLoad = 1;
        ace_dragging_canCarry = 0;
        ace_dragging_canDrag = 0;
    };

    //kontenery
    class GVAR(metal_blue_container_empty): Box_NATO_AmmoVeh_F {
        displayName = CSTRING(Metal_Blue_Container_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        icon = "iconObject_1x1";
        vehicleClass = "a3cs_crates_empty";
        hiddenSelectionsTextures[] = {"\z\a3cs\addons\main\data\empty.paa","A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa"};
        transportAmmo = 0;
		supplyRadius = 0;
        accuracy = 1000;
        transportMaxWeapons = 9001;
        transportMaxMagazines = 9001;
        transportMaxItems = 9001;
        transportMaxBackpacks = 9001;
        maximumload = 9001;
        class TransportMagazines {};
        class TransportWeapons {};
        class TransportItems {};
        class TransportBackpacks {};
        ace_cargo_size = 3;
        ace_cargo_canLoad = 1;
        ace_dragging_canCarry = 0;
        ace_dragging_canDrag = 0;
    };
    class GVAR(metal_yellow_container_empty): GVAR(metal_blue_container_empty) {
        displayName = CSTRING(Metal_Yellow_Container_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        hiddenSelectionsTextures[] = {"\z\a3cs\addons\main\data\empty.paa","A3\Weapons_F\Ammoboxes\data\AmmoVeh_OPFOR_CO.paa"};
    };
    class GVAR(metal_white_container_empty): GVAR(metal_blue_container_empty) {
        displayName = CSTRING(Metal_White_Container_Empty_DisplayName);
        scope = 2;
        scopeCurator = 2;
        hiddenSelectionsTextures[] = {"\z\a3cs\addons\main\data\empty.paa","A3\Weapons_F\Ammoboxes\data\AmmoVeh_HAF_CO.paa"};
    };

    //Skrzynki ze sprzetem
    class GVAR(items_crate_all): GVAR(metal_blue_container_empty) {
        displayName = CSTRING(Items_Crate_All);
        scope = 2;
        scopeCurator = 2;
        vehicleClass = "a3cs_crates";
        class TransportItems {
            MACRO_ADDITEM(ACE_acc_pointer_green,8);
            MACRO_ADDITEM(ACE_acc_pointer_green_IR,8);
            MACRO_ADDITEM(ACE_acc_pointer_red,8);
            MACRO_ADDITEM(ACE_CableTie,8);
            MACRO_ADDITEM(ACE_HandFlare_Green,8);
            MACRO_ADDITEM(ACE_HandFlare_Red,8);
            MACRO_ADDITEM(ACE_HandFlare_White,8);
            MACRO_ADDITEM(ACE_HandFlare_Yellow,8);
            MACRO_ADDITEM(ACE_IR_Strobe_Item,8);
            MACRO_ADDITEM(ACE_simpleGPS,8);
            MACRO_ADDITEM(ACE_MapTools,8);
            MACRO_ADDITEM(ACE_NVG_Gen1,8);
            MACRO_ADDITEM(ACE_NVG_Gen2,8);
            MACRO_ADDITEM(ACE_NVG_Gen4,8);
            MACRO_ADDITEM(ACE_NVG_Wide,8);
            MACRO_ADDITEM(ACE_SpareBarrel,8);
            MACRO_ADDITEM(ACE_RangeTable_82mm,8);
            MACRO_ADDITEM(ACE_microDAGR,8);
            MACRO_ADDITEM(ACE_Altimeter,8);
            MACRO_ADDITEM(ACE_Clacker,8);
            MACRO_ADDITEM(ACE_M26_Clacker,8);
            MACRO_ADDITEM(ACE_Deadmanswitch,8);
            MACRO_ADDITEM(ACE_Cellphone,8);
            MACRO_ADDITEM(ACE_DefusalKit,8);
            MACRO_ADDITEM(ACE_HuntIR_monitor,8);
            MACRO_ADDITEM(ACE_Item_SpottingScope,8);
            MACRO_ADDITEM(ACE_M84,8);
            MACRO_ADDITEM(ACE_Tripod,8);
            MACRO_ADDITEM(ACE_UAVBattery,8);
            MACRO_ADDITEM(ACE_wirecutter,8);
            MACRO_ADDITEM(ACE_Sandbag_empty,8);
            MACRO_ADDITEM(ACE_Flashlight_MX991,8);
            MACRO_ADDITEM(ACE_Flashlight_KSF1,8);
            MACRO_ADDITEM(ACE_Flashlight_XL50,8);
            MACRO_ADDITEM(ACE_EntrenchingTool,8);
            MACRO_ADDITEM(ACE_SpraypaintBlue,8);
            MACRO_ADDITEM(ACE_SpraypaintGreen,8);
            MACRO_ADDITEM(ACE_SpraypaintRed,8);
            //medical
            MACRO_ADDITEM(ACE_bodyBag,8);
            MACRO_ADDITEM(ACE_quikclot,8);
            MACRO_ADDITEM(ACE_morphine,8);
            MACRO_ADDITEM(ACE_epinephrine,8);
            MACRO_ADDITEM(ACE_fieldDressing,8);
            MACRO_ADDITEM(ACE_packingBandage,8);
            MACRO_ADDITEM(ACE_elasticBandage,8);
            MACRO_ADDITEM(ACE_tourniquet,8);
            MACRO_ADDITEM(ACE_atropine,8);
            MACRO_ADDITEM(ACE_adenosine,8);
            MACRO_ADDITEM(ACE_plasmaIV,8);
            MACRO_ADDITEM(ACE_plasmaIV_250,8);
            MACRO_ADDITEM(ACE_plasmaIV_500,8);
            MACRO_ADDITEM(ACE_salineIV,8);
            MACRO_ADDITEM(ACE_salineIV_250,8);
            MACRO_ADDITEM(ACE_salineIV_500,8);
            MACRO_ADDITEM(ACE_bloodIV,8);
            MACRO_ADDITEM(ACE_bloodIV_250,8);
            MACRO_ADDITEM(ACE_bloodIV_500,8);
            MACRO_ADDITEM(ACE_personalAidKit,8);
            MACRO_ADDITEM(ACE_surgicalKit,8);
            //vanilla working stuff
            MACRO_ADDITEM(Laserbatteries,8);
            MACRO_ADDITEM(ToolKit,8);
        };
        class TransportWeapons {
            MACRO_ADDWEAPON(ACE_Vector,8);
            MACRO_ADDWEAPON(ACE_MX2A,8);
            MACRO_ADDWEAPON(ACE_Yardage450,8);
            //vanilla working stuff
            MACRO_ADDWEAPON(Rangefinder,8);
            MACRO_ADDWEAPON(Laserdesignator,8);
        };
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_HuntIR_M203,8);
        };
        class TransportBackpacks {
            MACRO_ADDBACKPACK(ACE_TacticalLadder_Pack,8);
        };
    };
    class GVAR(medical_crate_basic): GVAR(medical_crate_empty) {
        displayName = CSTRING(Medical_Crate_Basic);
        scope = 2;
        scopeCurator = 2;
        vehicleClass = "a3cs_crates";
        class TransportItems {
            MACRO_ADDITEM(ACE_quikclot,256);
            MACRO_ADDITEM(ACE_morphine,128);
            MACRO_ADDITEM(ACE_epinephrine,128);
        };
    };
    class GVAR(medical_crate_advanced): GVAR(medical_crate_empty) {
        displayName = CSTRING(Medical_Crate_Advanced);
        scope = 2;
        scopeCurator = 2;
        vehicleClass = "a3cs_crates";
        class TransportItems {
            MACRO_ADDITEM(ACE_bodyBag,32);
            MACRO_ADDITEM(ACE_quikclot,128);
            MACRO_ADDITEM(ACE_morphine,128);
            MACRO_ADDITEM(ACE_epinephrine,128);
            MACRO_ADDITEM(ACE_fieldDressing,128);
            MACRO_ADDITEM(ACE_packingBandage,128);
            MACRO_ADDITEM(ACE_elasticBandage,128);
            MACRO_ADDITEM(ACE_tourniquet,128);
            MACRO_ADDITEM(ACE_atropine,128);
            MACRO_ADDITEM(ACE_adenosine,128);
            MACRO_ADDITEM(ACE_plasmaIV,64);
            MACRO_ADDITEM(ACE_plasmaIV_250,64);
            MACRO_ADDITEM(ACE_plasmaIV_500,64);
            MACRO_ADDITEM(ACE_personalAidKit,64);
            MACRO_ADDITEM(ACE_surgicalKit,64);
        };
    };
    class GVAR(items_crate_basic): GVAR(base) {
        displayName = CSTRING(Items_Crate_Basic);
        scope = 2;
        scopeCurator = 2;
        vehicleClass = "a3cs_crates";
        class TransportItems {
            MACRO_ADDITEM(ACE_acc_pointer_green,32);
            MACRO_ADDITEM(ACE_acc_pointer_green_IR,32);
            MACRO_ADDITEM(ACE_acc_pointer_red,32);
            MACRO_ADDITEM(ACE_CableTie,32);
            MACRO_ADDITEM(ACE_HandFlare_Green,32);
            MACRO_ADDITEM(ACE_HandFlare_Red,32);
            MACRO_ADDITEM(ACE_HandFlare_White,32);
            MACRO_ADDITEM(ACE_HandFlare_Yellow,32);
            MACRO_ADDITEM(ACE_IR_Strobe_Item,32);
            MACRO_ADDITEM(ACE_simpleGPS,32);
            MACRO_ADDITEM(ACE_MapTools,32);
            MACRO_ADDITEM(ACE_NVG_Gen2,32);
            MACRO_ADDITEM(ACE_SpareBarrel,32);
            MACRO_ADDITEM(ACE_Flashlight_MX991,32);
            MACRO_ADDITEM(ACE_Flashlight_KSF1,32);
            MACRO_ADDITEM(ACE_Flashlight_XL50,32);
            MACRO_ADDITEM(ACE_EntrenchingTool,32);
            MACRO_ADDITEM(ACE_SpraypaintBlue,32);
            MACRO_ADDITEM(ACE_SpraypaintGreen,32);
            MACRO_ADDITEM(ACE_SpraypaintRed,32);
            //vanilla working stuff
            MACRO_ADDITEM(ToolKit,8);
        };
        class TransportWeapons {
            MACRO_ADDWEAPON(ACE_Vector,32);
        };
    };
    class GVAR(items_crate_advanced): GVAR(base) {
        displayName = CSTRING(Items_Crate_Advanced);
        scope = 2;
        scopeCurator = 2;
        vehicleClass = "a3cs_crates";
        class TransportItems {
            MACRO_ADDITEM(ACE_acc_pointer_green,8);
            MACRO_ADDITEM(ACE_acc_pointer_green_IR,8);
            MACRO_ADDITEM(ACE_acc_pointer_red,8);
            MACRO_ADDITEM(ACE_CableTie,32);
            MACRO_ADDITEM(ACE_IR_Strobe_Item,32);
            MACRO_ADDITEM(ACE_simpleGPS,32);
            MACRO_ADDITEM(ACE_MapTools,32);
            MACRO_ADDITEM(ACE_NVG_Gen4,32);
            MACRO_ADDITEM(ACE_SpareBarrel,8);
            MACRO_ADDITEM(ACE_RangeTable_82mm,8);
            MACRO_ADDITEM(ACE_microDAGR,16);
            MACRO_ADDITEM(ACE_Altimeter,8);
            MACRO_ADDITEM(ACE_Clacker,8);
            MACRO_ADDITEM(ACE_M26_Clacker,8);
            MACRO_ADDITEM(ACE_Deadmanswitch,8);
            MACRO_ADDITEM(ACE_Cellphone,8);
            MACRO_ADDITEM(ACE_DefusalKit,8);
            MACRO_ADDITEM(ACE_HuntIR_monitor,8);
            MACRO_ADDITEM(ACE_Item_SpottingScope,8);
            MACRO_ADDITEM(ACE_M84,32);
            MACRO_ADDITEM(ACE_Tripod,8);
            MACRO_ADDITEM(ACE_UAVBattery,8);
            MACRO_ADDITEM(ACE_wirecutter,8);
            MACRO_ADDITEM(ACE_Sandbag_empty,8);
            MACRO_ADDITEM(ACE_Flashlight_MX991,8);
            MACRO_ADDITEM(ACE_Flashlight_KSF1,8);
            MACRO_ADDITEM(ACE_Flashlight_XL50,8);
            MACRO_ADDITEM(ACE_SpraypaintBlue,8);
            MACRO_ADDITEM(ACE_SpraypaintGreen,8);
            MACRO_ADDITEM(ACE_SpraypaintRed,8);
            MACRO_ADDITEM(ACE_EntrenchingTool,32);
            //vanilla working stuff
            MACRO_ADDITEM(Laserbatteries,8);
            MACRO_ADDITEM(ToolKit,8);
        };
        class TransportWeapons {
            MACRO_ADDWEAPON(ACE_Vector,16);
            MACRO_ADDWEAPON(ACE_MX2A,16);
            MACRO_ADDWEAPON(ACE_Yardage450,16);
            //vanilla working stuff
            MACRO_ADDWEAPON(Rangefinder,8);
            MACRO_ADDWEAPON(Laserdesignator,8);
        };
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_HuntIR_M203,32);
        };
        class TransportBackpacks {
            MACRO_ADDBACKPACK(ACE_TacticalLadder_Pack,4);
        };
    };
    class GVAR(items_crate_extra): GVAR(base) {
        displayName = CSTRING(Items_Crate_Extra);
        scope = 2;
        scopeCurator = 2;
        vehicleClass = "a3cs_crates";
        class TransportItems {
            MACRO_ADDITEM(chemlight_green,32);
            MACRO_ADDITEM(chemlight_red,32);
            MACRO_ADDITEM(chemlight_yellow,32);
            MACRO_ADDITEM(chemlight_blue,32);
            MACRO_ADDITEM(G_Combat,32);
            MACRO_ADDITEM(G_Lowprofile,32);
            MACRO_ADDITEM(G_Balaclava_blk,32);
            MACRO_ADDITEM(G_Balaclava_combat,32);
            MACRO_ADDITEM(G_Balaclava_lowprofile,32);
            MACRO_ADDITEM(G_Balaclava_oli,32);
            MACRO_ADDITEM(G_Bandanna_blk,32);
            MACRO_ADDITEM(G_Bandanna_oli,32);
            MACRO_ADDITEM(G_Bandanna_beast,32);
            MACRO_ADDITEM(G_Bandanna_khk,32);
            MACRO_ADDITEM(G_Bandanna_shades,32);
            MACRO_ADDITEM(G_Bandanna_tan,32);
            MACRO_ADDITEM(G_Shades_Black,32);
            MACRO_ADDITEM(G_Shades_Green,32);
        };
    };
    class GVAR(items_crate_sandbags): GVAR(base) {
        displayName = CSTRING(Items_Crate_Sandbags);
        scope = 2;
        scopeCurator = 2;
        vehicleClass = "a3cs_crates";
        class TransportItems {
            MACRO_ADDITEM(ACE_Sandbag_empty,128);
        };
    };
};
