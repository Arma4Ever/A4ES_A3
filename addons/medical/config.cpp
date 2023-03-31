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

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgFunctions.hpp"

#include "ACE_Medical_Treatment.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
