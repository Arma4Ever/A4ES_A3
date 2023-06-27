class CfgFunctions {
    delete SCAR_EEO;

    class 3denEnhanced {
        tag = "ENH";
        class Extraction {
            // file = "3denEnhanced\functions\GUI\extraction";
            delete extraction_onCheckedChanged;
            delete extraction_onLoad;
            delete extraction_setup;
        };
        class ActionCreator {
            // file = "3denEnhanced\functions\GUI\actionCreator";
            delete actionCreator;
        };
        class BriefingEditor {
            // file = "3denEnhanced\functions\GUI\briefingEditor";
            delete briefingEditor_addTAG;
            delete briefingEditor_handleTemplates;
            delete briefingEditor_export;
            delete briefingEditor_onLBSelChanged;
            delete briefingEditor_onLoad;
            delete briefingEditor_onUnload;
            delete briefingEditor_htmlHighlight;
        };
        class SAM {
            // file = "3denEnhanced\functions\GUI\SAM";
            delete SAM_applyAttribute;
            delete SAM_applyTemplate;
            delete SAM_createTemplate;
            delete SAM_deleteTemplate;
            delete SAM_exportToClipboard;
            delete SAM_getScenarioAttributes;
            delete SAM_loadTemplate;
            delete SAM_onLoad;
            delete SAM_onUnload;
        };
        class ModuleInformation {
            // file = "3denEnhanced\functions\GUI\moduleInformation";
            delete moduleInformation_onLoad;
        };
        class RPTViewer {
            // file = "3denEnhanced\functions\GUI\RPTViewer";
            delete RPTViewer;
        };
        class ZeusAddons {
            // file = "3denEnhanced\functions\GUI\ZeusAddons";
            delete zeusAddons;
        };
        class Misc {
            class deleteEmptyLayers {DUMMY_FNC};
            class dynamicViewDistance {DUMMY_FNC};
            class generateSteamMissionDescription {DUMMY_FNC};
        };
        class Interface {
            class menuStrip_removeItems {DUMMY_FNC};
        };
        class Attributes {
            // file = "3denEnhanced\functions\attributes";
            delete advancedDamage_onAttributeLoad;
            delete advancedDamage_onAttributeSave;
            delete airdrop_onAttributeLoad;
            delete airdrop_onAttributeSave;
            class ambientAnimations_initInEditor {DUMMY_FNC};
            delete ambientAnimations_onAttributeLoad;
            delete ambientAnimations_onAttributeSave;
            delete ambientFlyby_onAttributeLoad;
            delete ambientFlyby_onAttributeSave;
            delete debugOptions_activeScripts;
            class debugOptions_init {DUMMY_FNC};
            delete dynamicSkill_onAttributeLoad;
            delete dynamicSkill_onAttributeSave;
            delete establishingShot_onAttributeLoad;
            delete establishingShot_onAttributeSave;
            delete groupMarker_onAttributeLoad;
            delete groupMarker_onAttributeSave;
            delete groupMarker_onLoad;
            delete holdAction_onAttributeLoad;
            delete holdAction_onAttributeSave;
            delete introText_onAttributeLoad;
            delete introText_onAttributeSave;
            delete mapIndicators_onAttributeLoad;
            delete mapIndicators_onAttributeSave;
            delete menuStripBlacklist_onAttributeLoad;
            delete missionEndingCasualties_initDebriefingCombo;
            delete missionEndingCasualties_onAttributeLoad;
            delete missionEndingCasualties_onAttributeSave;
            delete SPR_onAttributeLoad;
            delete SPR_onAttributeSave;
            delete slider_onAttributeLoad;
            delete slider_onAttributeSave;
        };
    };
};
