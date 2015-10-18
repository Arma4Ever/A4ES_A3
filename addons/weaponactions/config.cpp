#include "script_component.hpp"
class CfgPatches
{
    class ADDON
    {
        units[] = {};
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
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};
class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
    };
};

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class A3CS_WeaponActionsUniformSwitch {
                displayName = CSTRING(switchUniform);
                condition = QUOTE([ARR_3(_player, 'uniform', 1)] call DFUNC(checkDivingGearAction));
                statement = QUOTE([ARR_2(_player, 'uniform')] call DFUNC(startDivingGearSwitch));
                exceptions[] = {};
                priority = -2;
                showDisabled = 0;
            };
            class A3CS_WeaponActionsUniformSwitchBack {
                displayName = CSTRING(switchUniformBack);
                condition = QUOTE([ARR_3(_player, 'uniform', 0)] call DFUNC(checkDivingGearAction));
                statement = QUOTE([ARR_2(_player, 'uniform')] call DFUNC(startDivingGearSwitch));
                exceptions[] = {};
                priority = -2;
                showDisabled = 0;
            };
            class A3CS_WeaponActionsVestSwitch {
                displayName = CSTRING(switchVest);
                condition = QUOTE([ARR_3(_player, 'vest', 1)] call DFUNC(checkDivingGearAction));
                statement = QUOTE([ARR_2(_player, 'vest')] call DFUNC(startDivingGearSwitch));
                exceptions[] = {};
                priority = -2;
                showDisabled = 0;
            };
            class A3CS_WeaponActionsVestSwitchBack {
                displayName = CSTRING(switchVestBack);
                condition = QUOTE([ARR_3(_player, 'vest', 0)] call DFUNC(checkDivingGearAction));
                statement = QUOTE([ARR_2(_player, 'vest')] call DFUNC(startDivingGearSwitch));
                exceptions[] = {};
                priority = -2;
                showDisabled = 0;
            };
            class A3CS_WeaponActions {
                displayName = CSTRING(WeaponActionsCat);
                condition = QUOTE(true);
                exceptions[] = {};
                insertChildren = QUOTE(_this call DFUNC(getWeaponActionsChildren));
                priority = -2;
                icon = QUOTE(\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryweapon_ca.paa);
            };
        };
    };
};
/*
class CfgWeapons {
    class Uniform_Base;
    class U_B_CombatUniform_mcam: Uniform_Base {
        a3cs_weaponactions_switchDivingUniform = "U_B_CombatUniform_mcam_tshirt";
        a3cs_weaponactions_switchDivingUniformType = "diving";
	};
	class U_B_CombatUniform_mcam_tshirt: Uniform_Base {
        a3cs_weaponactions_switchDivingUniform = "U_B_CombatUniform_mcam";
        a3cs_weaponactions_switchDivingUniformType = "normal";
	};

    class arifle_MX_Base_F;
    class arifle_MX_F: arifle_MX_Base_F {
        class a3cs_weaponActions {
            class paintBlack {
                actionName = "Pomaluj na czarno";
                actionProgress = "Malowanie...";
                actionSuccess = "Karabin przemalowany";
                actionFailure = "Przemalowywanie przerwane";
                actionTime = 5;
                unloadMagazine = 0;
                targetWeapon = "arifle_MX_Black_F";
            };
        };
    };
    class arifle_MX_Black_F: arifle_MX_F {
        class a3cs_weaponActions {
            delete paintBlack;
            class paintWhite {
                actionName = "Pomaluj na biało";
                actionProgress = "Malowanie...";
                actionSuccess = "Karabin przemalowany";
                actionFailure = "Przemalowywanie przerwane";
                actionTime = 5;
                unloadMagazine = 0;
                targetWeapon = "arifle_MX_F";
            };
        };
    };
};
*/
