#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common"};
        author = "SzwedzikPL, ARC_AI, ACE3 Team";
        authorUrl = "http://arma3coop.pl";
        VERSION_CONFIG;
    };
};

#include "CfgSurfaces.hpp"
#include "CfgAISkill.hpp"

class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class CfgAmmo {
    class Default;
    A3CS_GRENADE(GrenadeCore, Default);
    A3CS_GRENADE(Grenade, Default);
};

class CfgWeapons {
    #include "CfgWeapons_rifles.hpp"
    #include "CfgWeapons_smg.hpp"
    #include "CfgWeapons_dmr.hpp"
    #include "CfgWeapons_mg.hpp"
};
