#include "script_component.hpp"
class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_main", "a3cs_common", "A3_Weapons_F_Ammoboxes"};
        version = A3CS_VERSION;
        versionStr = QUOTE(A3CS_VERSION);
        versionAr[] = A3CS_VERSION_ARRAY;
        author[] = {"SzwedzikPL", "ACE3 Team"};
        authorUrl = "http://arma3coop.pl";
    };
};

class CfgVehicles
{
    class Box_NATO_Support_F;
    class a3cs_box_base: Box_NATO_Support_F
    {
        scope = 0;
        vehicleClass = "a3cs_boxes";
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

    class a3cs_empty_box: a3cs_box_base
    {
        scope = 2;
        displayName = "Skrzynia pusta";
        vehicleClass = "a3cs_boxes";
        transportMaxWeapons = 50;
        transportMaxMagazines = 200;
        transportMaxItems = 400;
        transportMaxBackpacks = 30;
        class TransportMagazines {};
        class TransportWeapons {};
        class TransportItems {};
        class TransportBackpacks {};
    };
    class a3cs_box_basicItems: a3cs_box_base
    {
        scope = 2;
        displayName = "Skrzynia ze sprzętem podstawowym";
        class TransportItems
        {
            MACRO_ADDITEM(chemlight_green,16);
            MACRO_ADDITEM(chemlight_red,16);
            MACRO_ADDITEM(chemlight_yellow,16);
            MACRO_ADDITEM(chemlight_blue,16);
            MACRO_ADDITEM(ACE_acc_pointer_green,32);
            MACRO_ADDITEM(ACE_CableTie,32);
            MACRO_ADDITEM(ACE_EarPlugs,32);
            MACRO_ADDITEM(ACE_HandFlare_Green,16);
            MACRO_ADDITEM(ACE_HandFlare_Red,16);
            MACRO_ADDITEM(ACE_HandFlare_White,16);
            MACRO_ADDITEM(ACE_HandFlare_Yellow,16);
            MACRO_ADDITEM(ACE_IR_Strobe_Item,32);
            MACRO_ADDITEM(ItemGPS,32);
            MACRO_ADDITEM(ACE_simpleGPS,32);
            MACRO_ADDITEM(ACE_MapTools,32);
            MACRO_ADDITEM(ACE_NVG_Gen2,32);
            MACRO_ADDITEM(ACE_SpareBarrel,16);
            MACRO_ADDITEM(G_Combat,32);
            MACRO_ADDITEM(G_Lowprofile,32);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(ACE_Vector,32);
        };
    };
    class a3cs_box_specialItems: a3cs_box_base
    {
        scope = 2;
        displayName = "Skrzynia ze sprzętem specjalnym";
        class TransportItems
        {
            MACRO_ADDITEM(ACE_microDAGR,8);
            MACRO_ADDITEM(ACE_Altimeter,8);
            MACRO_ADDITEM(ACE_ATragMX,8);
            MACRO_ADDITEM(ACE_Clacker,8);
            MACRO_ADDITEM(ACE_DAGR,8);
            MACRO_ADDITEM(ACE_Deadmanswitch,8);
            MACRO_ADDITEM(ACE_DefusalKit,8);
            MACRO_ADDITEM(ACE_HuntIR_monitor,8);
            MACRO_ADDITEM(ACE_Item_SpottingScope,8);
            MACRO_ADDITEM(ACE_Kestrel4500,8);
            MACRO_ADDITEM(ACE_M26_Clacker,8);
            MACRO_ADDITEM(ACE_M84,32);
            MACRO_ADDITEM(ACE_NVG_Gen4,16);
            MACRO_ADDITEM(ACE_Tripod,8);
            MACRO_ADDITEM(ACE_UAVBattery,8);
            MACRO_ADDITEM(ACE_wirecutter,8);
            MACRO_ADDITEM(ACE_bodyBag,8);
            MACRO_ADDITEM(Laserbatteries,8);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(ACE_MX2A,8);
            MACRO_ADDWEAPON(Laserdesignator,8);
        };
        class TransportMagazines
        {
            MACRO_ADDMAGAZINE(ACE_HuntIR_M203,32);
        };
        class TransportBackpacks
        {
            class _xx_ACE_TacticalLadder_Pack {
                backpack = "ACE_TacticalLadder_Pack";
                count = 4;
            };
        };
    };
    class a3cs_box_sniperItems: a3cs_box_base
    {
        scope = 2;
        displayName = "Skrzynia z sprzętem snajperskim";
        class TransportItems
        {
            MACRO_ADDITEM(ACE_ATragMX,8);
            MACRO_ADDITEM(ACE_DAGR,8);
            MACRO_ADDITEM(ACE_Item_SpottingScope,8);
            MACRO_ADDITEM(ACE_Kestrel4500,8);
            MACRO_ADDITEM(ACE_Tripod,8);
            MACRO_ADDITEM(Laserbatteries,8);
        };
        class TransportWeapons
        {
            MACRO_ADDWEAPON(ACE_MX2A,8);
            MACRO_ADDWEAPON(ACE_Vector,8);
            MACRO_ADDWEAPON(Laserdesignator,8);
        };
    };
    class a3cs_box_sandbags: a3cs_box_base
    {
        scope = 2;
        displayName = "Skrzynia z workami z piaskiem";
        class TransportItems
        {
            MACRO_ADDITEM(ACE_Sandbag_empty,250);
        };
    };
    class a3cs_box_addons: a3cs_box_base
    {
        scope = 2;
        displayName = "Skrzynia z dodatkami";
        model = "\A3\weapons_F\AmmoBoxes\WpnsBox_large_F";
        class TransportItems
        {
            MACRO_ADDITEM(G_Balaclava_blk,32);
            MACRO_ADDITEM(G_Balaclava_combat,32);
            MACRO_ADDITEM(G_Bandanna_blk,32);
            MACRO_ADDITEM(G_Bandanna_oli,32);
            MACRO_ADDITEM(MEC_BIS_olive_shemag,32);
            MACRO_ADDITEM(MEC_shemag_camo,32);
            MACRO_ADDITEM(MEC_shemag_bw,32);
            MACRO_ADDITEM(G_Shades_Black,32);
            MACRO_ADDITEM(G_Shades_Green,32);
            MACRO_ADDITEM(G_Bandanna_beast,32);
        };
    };
    class a3cs_box_parachutes: a3cs_box_base
    {
        scope = 2;
        displayName = "Skrzynia ze spadochronami";
        class TransportBackpacks {
            class _xx_ACE_NonSteerableParachute {
                backpack = "ACE_NonSteerableParachute";
                count = 32;
            };
        };
    };
    class a3cs_box_basicMedical: a3cs_box_base
    {
        scope = 2;
        displayName = "Skrzynia z podstawowymi medykamentami";
        accuracy = 1000;
        model = "\z\ace\addons\medical\data\ace_medcrate.p3d";
        author = "ACE-Team";
        transportMaxWeapons = 9001;
        transportMaxMagazines = 9001;
        transportMaxItems = 9001;
        class TransportItems
        {
            MACRO_ADDITEM(ACE_fieldDressing,64);
            MACRO_ADDITEM(ACE_packingBandage,32);
            MACRO_ADDITEM(ACE_elasticBandage,32);
            MACRO_ADDITEM(ACE_tourniquet,32);
            MACRO_ADDITEM(ACE_morphine,32);
            MACRO_ADDITEM(ACE_atropine,32);
            MACRO_ADDITEM(ACE_epinephrine,32);
            MACRO_ADDITEM(ACE_quikclot,32);
        };
    };
    class a3cs_box_specialMedical: a3cs_box_base
    {
        scope = 2;
        displayName = "Skrzynia z specjalnymi medykamentami";
        accuracy = 1000;
        model = "\z\ace\addons\medical\data\ace_medcrate.p3d";
        author = "ACE-Team";
        transportMaxWeapons = 9001;
        transportMaxMagazines = 9001;
        transportMaxItems = 9001;
        class TransportItems
        {
            MACRO_ADDITEM(ACE_plasmaIV,8);
            MACRO_ADDITEM(ACE_plasmaIV_250,8);
            MACRO_ADDITEM(ACE_plasmaIV_500,8);
            MACRO_ADDITEM(ACE_salineIV,8);
            MACRO_ADDITEM(ACE_salineIV_250,8);
            MACRO_ADDITEM(ACE_salineIV_500,8);
            MACRO_ADDITEM(ACE_bloodIV,8);
            MACRO_ADDITEM(ACE_bloodIV_250,8);
            MACRO_ADDITEM(ACE_bloodIV_500,8);
            MACRO_ADDITEM(ACE_personalAidKit,16);
        };
    };
};