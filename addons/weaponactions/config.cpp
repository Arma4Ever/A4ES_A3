#include "script_component.hpp"
class CfgPatches {
    class ADDON {
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
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"

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
