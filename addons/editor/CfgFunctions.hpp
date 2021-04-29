class CfgFunctions {
    delete SCAR_EEO;

    class 3denEnhanced {
        tag = "ENH";
        class 3DENRadio {
            // file = "3denEnhanced\functions\GUI\3DENRadio";
            class 3DENRadio_exportClassname;
            class 3DENRadio_handlePlaylist;
            class 3DENRadio_onLoad;
            class 3DENRadio_playNewSong;
            class 3DENRadio_searchList;
            class 3DENRadio_timelineControl;
            class 3DENRadio_toggleRadio;
        };
        class Garrison {
            // file = "3denEnhanced\functions\GUI\garrison";
            class garrison_garrison;
            class garrison_onLoad;
        };
        class Extraction {
            // file = "3denEnhanced\functions\GUI\extraction";
            delete extraction_onCheckedChanged;
            delete extraction_onLoad;
            delete extraction_setup;
        };
        class TextureFinder {
            // file = "3denEnhanced\functions\GUI\TextureFinder";
            class textureFinder_copyPath;
            class textureFinder_fillList;
            class textureFinder_findTextures;
            class textureFinder_progressText;
            class textureFinder_updatePreview;
        };
        class BatchReplace {
            // file = "3denEnhanced\functions\GUI\batchReplace";
            class batchReplace;
            class batchReplace_onLoad;
            class batchReplace_createDisplay;
            class batchReplace_onTreeSelChanged;
            class batchReplace_initTreeView;
        };
        class FunctionsViewer {
            // file = "3denEnhanced\functions\GUI\functionsViewer";
            class functionsViewer_copy;
            class functionsViewer_fillCtrlTV;
            class functionsViewer_getFunctionsData;
            class functionsViewer_incrementKey;
            class functionsViewer_onLoad;
            class functionsViewer_onTreeSelChanged;
            class functionsViewer_recompileSelected;
            class functionsViewer_searchkey;
            class functionsViewer_togglePanel;
        };
        class ActionCreator {
            // file = "3denEnhanced\functions\GUI\actionCreator";
            delete actionCreator_export;
            delete actionCreator_onLoad;
        };
        class BriefingEditor {
            // file = "3denEnhanced\functions\GUI\briefingEditor";
            delete briefingEditor_addTAG;
            delete briefingEditor_createTemplate;
            delete briefingEditor_export;
            delete briefingEditor_getTemplate;
            delete briefingEditor_onLBSelChanged;
            delete briefingEditor_onLoad;
            delete briefingEditor_onUnload;
        };
        class PlacementTools {
            // file = "3denEnhanced\functions\GUI\placementTools";
            class placementTools_centralAngle;
            class placementTools_createDisplay;
            class placementTools_fillArea;
            class placementTools_grid;
            class placementTools_initialAngle;
            class placementTools_onLoad;
            class placementTools_onToolBoxSelChanged;
            class placementTools_onUnload;
            class placementTools_radius;
            class placementTools_spacing;
        };
        class ScenarioAttributesManager {
            // file = "3denEnhanced\functions\GUI\scenarioAttributesManager";
            delete scenarioAttributesManager_applyAttribute;
            delete scenarioAttributesManager_applyTemplate;
            delete scenarioAttributesManager_createTemplate;
            delete scenarioAttributesManager_deleteTemplate;
            delete scenarioAttributesManager_exportToClipboard;
            delete scenarioAttributesManager_getScenarioAttributes;
            delete scenarioAttributesManager_loadTemplate;
            delete scenarioAttributesManager_onLoad;
            delete scenarioAttributesManager_onUnload;
        };
        class NameObjects {
            // file = "3denEnhanced\functions\GUI\nameObjects";
            class nameObjects_name;
            class nameObjects_onLoad;
        };
        class ModuleInformation {
            // file = "3denEnhanced\functions\GUI\moduleInformation";
            delete moduleInformation_onLoad;
        };
        class 3DENCam {
            // file = "3denEnhanced\functions\GUI\3DENCam";
            class 3DENCam_deleteEntry;
            class 3DENCam_get3DENCameraParameters;
            class 3DENCam_onKillFocus;
            class 3DENCam_onSetFocus;
            class 3DENCam_saveList;
            class 3DENCam_set3DENCameraParameters;
            class 3DENCam_updateList;
        };
        class VariableViewer {
            // file = "3denEnhanced\functions\GUI\variableViewer";
            class variableViewer_delete;
            class variableViewer_fillLNB;
            class variableViewer_getNamespace;
            class variableViewer_hideFunctions;
            class variableViewer_messageConfirm;
            class variableViewer_onFilterChanged;
            class variableViewer_onLNBSelChanged;
            class variableViewer_onLoad;
            class variableViewer_onSearch;
            class variableViewer_setOrCreate;
        };
        class IM {
            // file = "3denEnhanced\functions\GUI\IM";
            class IM_addItem;
            class IM_applyAttribute;
            class IM_applyTemplate;
            class IM_clearInventory;
            class IM_createTemplate;
            class IM_deleteTemplate;
            class IM_filterList;
            class IM_lbAdd;
            class IM_lnbAdd;
            class IM_loadAttributeValue;
            class IM_onModFilterChanged;
            class IM_open;
            class IM_removeItem;
            class IM_resetSearch;
            class IM_resetStorage;
            class IM_search;
            class IM_showTemplates;
            class IM_toggleVirtual;
            class IM_updateTemplateList;
        };
        class CfgSentencesBrowser {
            // file = "3denEnhanced\functions\GUI\CFGS";
            class CFGS_changeFilter;
            class CFGS_changePage;
            class CFGS_getCfgSentences;
            class CFGS_getSentenceDataFromConfig;
            class CFGS_handleFavorites;
            class CFGS_onLoad;
            class CFGS_playOrCopy;
        };
        class 3DENShortcuts {
            // file = "3denEnhanced\functions\GUI\3DENShortcuts";
            class 3DENShortcuts_init;
            class 3DENShortcuts_fillList;
        };
        class Misc {
            // file = "3denEnhanced\functions\Misc";
            class 3denNotificationNoSound;
            class all3DENSelected;
            class deleteCrew;
            class deleteEmptyLayers {DUMMY_FNC};
            class dynamicViewDistance {DUMMY_FNC};
            class floatToTime;
            class generateSteamMissionDescription {DUMMY_FNC};
            class getAllItems;
            class hasStorage;
            class loadoutTool;
            class measureDistance;
            class removeGear;
            class setOrientation;
            class switchTime;
            class toggleAIFeatures;
            class toggleAttribute;
            class toggleDrawBuildingPositions;
            class toggleDrawDLCIcons;
            class toggleDrawHitpoints;
            class toggleGrass;
            class twoDigitsStr;
        };
        class Interface {
            // file = "3denEnhanced\functions\interface";
            class 3DENCollapseAssetBrowser;
            class locationList;
            class menuStrip_removeItems {DUMMY_FNC};
            class sessionTimer;
            class statusbar_entityCounter;
        };
        class Log {
            // file = "3denEnhanced\functions\log";
            class exportGUIDefines;
            class exportLoadout;
            class exportWithLB;
            class log;
        };
        class Debug {
            // file = "3denEnhanced\functions\debug";
            class productInfo;
            class toggleMapIDs;
        };
        class EventHandlers {
            // file = "3denEnhanced\functions\eventHandlers";
            class EH_onMissionLoad;
            class EH_onMissionNew;
            class EH_onMissionPreview;
            class EH_onMissionPreviewEnd;
            class EH_onSelectionChange;
            class EH_onTerrainNew;
        };
        class Attributes {
            // file = "3denEnhanced\functions\attributes";
            delete advancedDamage_onAttributeLoad;
            delete advancedDamage_onAttributeSave;
            delete airdrop_onAttributeLoad;
            delete airdrop_onAttributeSave;
            delete ambientAnimations_onAttributeLoad;
            delete ambientAnimations_onAttributeSave;
            delete ambientFlyby_onAttributeLoad;
            delete ambientFlyby_onAttributeSave;
            delete debugOptions_activeScripts;
            delete dynamicSkill_onAttributeLoad;
            delete dynamicSkill_onAttributeSave;
            delete establishingShot_onAttributeLoad;
            delete establishingShot_onAttributeSave;
            delete groupMarker_onAttributeLoad;
            delete groupMarker_onAttributeSave;
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
            delete timeMultiplier_onAttributeLoad;
            delete timeMultiplier_onAttributeSave;

            class ambientAnimations_initInEditor {DUMMY_FNC};
            class debugOptions_init {DUMMY_FNC};
        };
    };
};
