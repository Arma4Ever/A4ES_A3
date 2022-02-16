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
            class garrison_onLoad;
            class garrison_drawBuildingInfo;
            class garrison_fillBuildings;
            class garrison_onUnload;
            class garrison_updateValues;
        };
        class Extraction {
            // file = "3denEnhanced\functions\GUI\extraction";
            delete extraction_onCheckedChanged;
            delete extraction_onLoad;
            delete extraction_setup;
        };
        class CreateObject {
            // file = "3denEnhanced\functions\GUI\createObject";
            class createObject_create;
            class createObject_changeFilter;
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
            class functionsViewer_setUpMenuStrip;
            class functionsViewer_togglePanel;
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
        class VIM {
            // file = "3denEnhanced\functions\GUI\VIM";
            class VIM_addItem;
            class VIM_applyAttribute;
            class VIM_changeFilter;
            class VIM_clearInventory;
            class VIM_close;
            class VIM_export;
            class VIM_fullArsenal;
            class VIM_handleTemplates;
            class VIM_lbAdd;
            class VIM_lnbAdd;
            class VIM_loadAttributeValue;
            class VIM_onModFilterChanged;
            class VIM_open;
            class VIM_removeItem;
            class VIM_resetSearch;
            class VIM_resetStorage;
            class VIM_search;
            class VIM_sort;
            class VIM_toggleVirtual;
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
        class RPTViewer {
            // file = "3denEnhanced\functions\GUI\RPTViewer";
            delete RPTViewer;
        };
        class ZeusAddons {
            // file = "3denEnhanced\functions\GUI\ZeusAddons";
            delete zeusAddons;
        };
        class Misc {
            // file = "3denEnhanced\functions\Misc";
            class 3denNotificationNoSound;
            class alignEntities;
            class all3DENSelected;
            class deleteCrew;
            class deleteEmptyLayers {DUMMY_FNC};
            class dynamicViewDistance {DUMMY_FNC};
            class exportMissionParams;
            class floatToTime;
            class generateSteamMissionDescription {DUMMY_FNC};
            class getAllItems;
            class getConfigSourceAddon;
            class hasStorage;
            class loadoutTool;
            class measureDistance;
            class preloadAmmoAttribute;
            class pylonTools;
            class removeGear;
            class setOrientation;
            class spaceEqually;
            class switchTime;
            class systemTimeFormatted;
            class toggleAttributes;
            class toggleDrawBuildingPositions;
            class toggleDrawDLCIcons;
            class toggleDrawHitpoints;
            class toggleGrass;
            class toggleMarkerAlpha;
            class twoDigitsStr;
            class VHCTools;
        };
        class Interface {
            // file = "3denEnhanced\functions\interface";
            class assetBrowser_collapse;
            class favoritesList;
            class locationList;
            class menuStrip_removeItems {DUMMY_FNC};
            class statusbar_entityCounter;
            class statusbar_sessionTimer;
        };
        class Log {
            // file = "3denEnhanced\functions\log";
            class 3DENLog;
            class exportGUIDefines;
            class exportLoadout;
            class exportWithLB;
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
