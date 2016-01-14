#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "Utes",                            //utes
            "Chernarus",                       //chernarus
            "AiA_Chernarus_Config",            //chernarus
            "AiA_Worlds",                      //takistan
            "Takistan",                        //takistan
            "AiA_Zargabad_Config",             //zargabad
            "AiA_Shapur_baf_Config",           //shapur
            "Bootcamp_ACR",                    //bukovina
            "AiA_Bootcamp_acr_Config",         //bukovina
            "AiA_Afghan_Config",               //takistanmountains
            "Woodland_ACR",                    //bystrica
            "AiA_Bohemia_Config",              //bystrica
            "ProvingGrounds_PMC",              //provinggrounds
            "AiA_Provinggrounds_pmc_Config",   //provinggrounds
            "A3_Map_Panthera3",                //panthera
            "A3_Map_IslaDuala3",               //isladuala
            "A3_Map_lingor3",                  //lingor
            "Caribou",                         //caribou
            "fallujah_v1_0",                   //fallujah
            "fata",                            //fata
            "MCN_HazarKot",                    //hazarkot
            "namalsk",                         //namalsk
            "FDF_Isle1_a",                     //podagorsk
            "reshmaan",                        //reshmaan
            "AiA_Sara_Config",                 //sahrani
            "AiA_Sara_dbe1_Config",            //sahrani
            "AiA_Saralite_Config",             //sahrani
            "torabora"                         //torabora
        };
        version = A3CS_VERSION;
        versionStr = QUOTE(A3CS_VERSION);
        versionAr[] = A3CS_VERSION_ARRAY;
        author[] = {"SzwedzikPL"};
        authorUrl = "http://arma3coop.pl";
    };
};
class CfgWorlds {
    class CAWorld;
    class DefaultWorld;
    //utes
    class Utes: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //chernarus
    class Chernarus: DefaultWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //takistan
    class Takistan: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //zargabad
    class Zargabad: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //shapur
    class Shapur_BAF: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //panthera
    class panthera3: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //isladuala
    class IslaDuala3: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //lingor
    class lingor3: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //fallujah
    class fallujah: Utes {
        class AmbientA3 {maxCost = 0;};
    };
    //caribou
    class Caribou: Chernarus {
        class AmbientA3 {maxCost = 0;};
    };
    //bukovina
    class Bootcamp_ACR: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //takistanmountains
    class Mountains_ACR: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //bystrica
    class Woodland_ACR: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //provinggrounds
    class ProvingGrounds_PMC: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //fata
    class fata: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //hazarkot
    class MCN_HazarKot: Takistan {
        class AmbientA3 {maxCost = 0;};
    };
    //namalsk
    class namalsk: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //podagorsk
    class FDF_Isle1_a: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //reshmaan
    class reshmaan: Takistan {
        class AmbientA3 {maxCost = 0;};
    };
    //sahrani
    class Sara: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    class Sara_dbe1: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    class SaraLite: CAWorld {
        class AmbientA3 {maxCost = 0;};
    };
    //torabora
    class torabora: Takistan {
        class AmbientA3 {maxCost = 0;};
    };

};
