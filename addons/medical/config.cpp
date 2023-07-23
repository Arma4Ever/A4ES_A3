#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(dressingSet),
            QGVAR(painkillersItem),
            QGVAR(crateBig),
            QGVAR(crateStandard)
        };
        weapons[] = {
            "A4ES_dressingSet",
            "A4ES_painkillers",
            "A4ES_emptyBloodBag",
            "A4ES_usedBloodBag",
            "A4ES_clottedBloodBag"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a4es_common",
            "ace_arsenal",
            "ace_interaction",
            "ace_medical",
            "ace_medical_ai",
            "ace_medical_blood",
            "ace_medical_damage",
            "ace_medical_engine",
            "ace_medical_feedback",
            "ace_medical_gui",
            "ace_medical_statemachine",
            "ace_medical_status",
            "ace_medical_treatment",
            "ace_medical_vitals",
            "ace_captives",
            "A3_Props_F_Orange_Humanitarian_Camps"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL", "Alganthe"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class a4es_functions_overrides {
    ace_medical_treatment_fnc_getBandageTime = QPATHTOF(functions\fnc_ace_getBandageTime.sqf);
    ace_medical_treatment_fnc_getHealTime = QPATHTOF(functions\fnc_ace_getHealTime.sqf);
    ace_medical_treatment_fnc_getStitchTime = QPATHTOF(functions\fnc_ace_getStitchTime.sqf);
    ace_medical_treatment_fnc_cprLocal = QPATHTOF(functions\fnc_ace_cprLocal.sqf);
    ace_medical_treatment_fnc_checkPulseLocal = QPATHTOF(functions\fnc_ace_checkPulseLocal.sqf);
    ace_medical_treatment_fnc_checkBloodPressureLocal = QPATHTOF(functions\fnc_ace_checkBloodPressureLocal.sqf);
    ace_medical_treatment_fnc_ivBag = QPATHTOF(functions\fnc_ace_ivBag.sqf);
    ace_medical_treatment_fnc_medication = QPATHTOF(functions\fnc_ace_medication.sqf);
    ace_medical_treatment_fnc_splint = QPATHTOF(functions\fnc_ace_splint.sqf);
    ace_medical_treatment_fnc_tourniquet = QPATHTOF(functions\fnc_ace_tourniquet.sqf);
    ace_medical_treatment_fnc_tourniquetRemove = QPATHTOF(functions\fnc_ace_tourniquetRemove.sqf);
    ace_medical_treatment_fnc_bandage = QPATHTOF(functions\fnc_ace_bandage.sqf);
    ace_medical_treatment_fnc_canStitch = QPATHTOF(functions\fnc_ace_canStitch.sqf);
    ace_medical_treatment_fnc_fullHeal = QPATHTOF(functions\fnc_ace_fullHeal.sqf);
    ace_medical_treatment_fnc_findMostEffectiveWound = QPATHTOF(functions\fnc_ace_findMostEffectiveWound.sqf);

    ace_medical_damage_fnc_handleIncapacitation = QPATHTOF(functions\fnc_ace_handleIncapacitation.sqf);
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

#include "ACE_Medical_Injuries.hpp"
#include "ACE_Medical_Treatment.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
