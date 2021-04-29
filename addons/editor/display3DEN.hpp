class Display3DEN {
	class ContextMenu: ctrlMenu {
		class Items {
            delete Eden_Extended_Objects_Multiply_Contextual;
            delete ENH_ShowModuleInformation;
            delete ENH_Extraction;
            delete ENH_TriggerOwnerPlayer;

            items[] = {
                "ConnectParent",
                "SeparatorSelected",
                "MoveCamera",
                "PlayFromHere",
                "PlayAsEntity",
                "Separator",
                "Select",
                "Edit",
                "Transform",
                "Grid",
                "Log",
                "ChangeSeatParent",
                "SeparatorEntity",
                "CustomComposition",
                "FindCreate",
                "FindConfig",
                "SeparatorSelected",
                "SeparatorNotSelected",
                "CreateComment",
                "Arsenal",
                "ArsenalReset",
                "Garage",
                "GarageReset",
                "SeparatorArsenal",
                "Attributes",
                "Separator",
                // "Eden_Extended_Objects_Multiply_Contextual",
                // "Separator",
                "ENH_MeasureDistance",
                // "ENH_ShowModuleInformation",
                "ENH_Garrison"
                // "ENH_Extraction"
            };
            class Log {
            	items[] = {
                    "LogPosition",
                    "LogClasses",
                    "ENH_LogClassesString",
                    "SeparatorSelected",
                    "ENH_LogVarNames",
                    "ENH_LogFactions",
                    "SeparatorSelected",
                    "ENH_LogPositions3D",
                    "ENH_LogPositions2D",
                    "ENH_LogGridPositon",
                    "SeparatorSelected",
                    "ENH_Log3DENID",
                    "ENH_LogObjectInfo"
                };
            };
            class Edit {
            	items[] = {
                    "Cut",
                    "Copy",
                    "Paste",
                    "PasteOrig",
                    "Delete",
                    "ENH_DeleteCrew"
                };
            };
            class ConnectParent {
                items[] = {
                    "Connect",
                    "ConnectOther"
                    // "ENH_TriggerOwnerPlayer"
                };
            };
        };
	};
    class ControlsBackground {
		delete Eden_Extended_Objects_multiply_modal;
	};
	class Controls {
        delete Eden_Extended_Objects_multiply_dialog;

		class MenuStrip: ctrlMenuStrip {
            class Items {
                delete ENH_About;
                delete ace_arsenal_portVALoadouts;
                // delete ENH_Help_GetExtensions;
                delete ENH_Help_MissionCampaignGuide;
                delete ENH_Help_AICompilationList;
                delete ENH_Help_Folder_Wiki;
                delete ENH_CfgDisabledCommands;
                delete ENH_3DENCamPositions;
                delete ENH_ScenarioAttributesManager;
                delete ENH_BriefingEditor;
                delete ENH_ActionCreator;
                delete ENH_DeleteEmptyLayers;
                delete ENH_ExportMissionParameters;
                delete ENH_GenerateSteamMissionDescription;
                delete ENH_SwitchTime;
                delete ENH_ToggleSimpleObject;
                delete ENH_ToggleSimulation;
                delete ENH_ToggleDynamicSimulation;
                delete ENH_ToggleAIFeatures;
                delete ENH_CreateTrigger;

                items[] = {
                    "File",
                    "Edit",
                    "View",
                    "Attributes",
                    "Tools",
                    "Options",
                    "Preview",
                    "Help"
                    // "ENH_About"
                };

                class Tools {
                    items[] = {
                        "DebugConsole",
                        "FunctionsViewer",
                        "ConfigViewer",
                        "AnimationViewer",
                        "SplendidCamera",
                        "FieldManual",
                        "Separator",
                        "ENH_Folder_Utilities",
                        "ENH_Folder_Placement",
                        "ENH_Folder_Loadout",
                        "ENH_Folder_Miscellaneous",
                        "ENH_Folder_Debug",
                        "ENH_Folder_GUI"
                        // "ace_arsenal_portVALoadouts"
                    };
                };
                class Help {
                    items[] = {
                        "HelpDoc",
                        "HelpScripting",
                        "Separator",
                        "HelpBiki",
                        "HelpForums",
                        "HelpFeedback",
                        "HelpDevHub",
                        "Separator",
                        "HelpTutorials",
                        // "ENH_Help_GetExtensions",
                        // "ENH_Help_MissionCampaignGuide",
                        // "ENH_Help_AICompilationList",
                        // "ENH_Help_Folder_Wiki",
                        "ENH_Help_3DENShortcuts"
                    };
                };
                class MissionPreviewSP {
                    shortcuts[] = {};
                };
                class ENH_Folder_Placement {
                    items[] = {
                        "ENH_PlacementTools",
                        "Separator",
                        "ENH_SetRandomDir",
                        "ENH_ReverseDirection",
                        "Separator",
                        "ENH_OrientateNorth",
                        "ENH_OrientateEast",
                        "ENH_OrientateSouth",
                        "ENH_OrientateWest"
                    };
                };
                class ENH_Folder_Debug {
                  items[] = {
                      "ENH_VariableViewer",
                      "Separator",
                      "ENH_ProductInfo",
                      "ENH_RecompileFunctions",
                      "ENH_ToggleMapIDs",
                      "ENH_ClearChat"
                  };
                };
                class ENH_Folder_Loadout {
                  items[] = {
                      "ENH_InventoryManager",
                      "ENH_CopyLoadout",
                      "ENH_ApplyLoadout",
                      "ENH_ExportLoadoutConfig",
                      "ENH_ExportLoadoutCfgRespawnInventory",
                      "Separator",
                      "ENH_RemoveNVGs",
                      "ENH_RemoveVests",
                      "ENH_RemoveGoggles",
                      "ENH_RemoveHeadgear",
                      "ENH_RemoveWeapons",
                      "ENH_RemoveGear"
                  };
                };
                class ENH_Folder_GUI {
                  items[] = {
                      "ENH_ExportGUIBaseClasses",
                      "Separator",
                      "ENH_GUITestGrids",
                      "ENH_ControlStyles",
                      "ENH_ControlTypes"
                  };
                };
                class ENH_Folder_Utilities {
                  items[] = {
                      // "ENH_CfgDisabledCommands",
                      "ENH_Jukebox",
                      "ENH_MoonPhases",
                      "ENH_PrintConfig",
                      "ENH_ScriptCommands",
                      "Separator",
                      "ENH_3DENRadio",
                      // "ENH_3DENCamPositions",
                      // "ENH_ScenarioAttributesManager",
                      "ENH_CfgSentencesBrowser",
                      "ENH_TextureFinder",
                      "Separator",
                      // "ENH_BriefingEditor",
                      // "ENH_ActionCreator",
                      "ENH_BatchReplace",
                      "ENH_NameObjects"
                  };
                };
                class ENH_Folder_Miscellaneous {
                  items[] = {
                      // "ENH_DeleteEmptyLayers",
                      // "ENH_ExportMissionParameters",
                      // "ENH_GenerateSteamMissionDescription",
                      // "ENH_SwitchTime",
                      // "Separator",
                      "ENH_ToggleGrass",
                      // "ENH_ToggleSimpleObject",
                      // "ENH_ToggleSimulation",
                      // "ENH_ToggleDynamicSimulation",
                      "ENH_ToggleDrawBuildingPositions",
                      "ENH_ToggleDrawDLCIcons",
                      "ENH_ToggleDrawHitpoints"
                      // "ENH_ToggleAIFeatures",
                      // "Separator",
                      // "ENH_CreateTrigger"
                  };
                };
			};
		};
        class ButtonPlay: ctrlShortcutButton {
            shortcuts[] = {"0x00050000 + 0", 57};
        };
	};
};
