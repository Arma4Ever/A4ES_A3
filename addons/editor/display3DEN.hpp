class Display3DEN {
    class ContextMenu: ctrlMenu {
        class Items {
            delete acd_exportScript;
            delete acd_makeScriptSimple;
            delete acd_makeScriptVehicle;
            delete acd_makeScriptVehicleSimOff;
            delete acd_makeScriptVehicleSimOn;
            delete Eden_Extended_Objects_Multiply_Contextual;
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
                // "acd_exportScript",
                // "Separator",
                // "Eden_Extended_Objects_Multiply_Contextual",
                "Separator",
                "ENH_MeasureDistance",
                "ENH_ShowModuleInformation",
                "ENH_Garrison",
                //"ENH_Extraction",
                "ENH_AddToFavorites",
                "ENH_MoveToLayer"
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

        class Map: ctrlMap {
            scaleMax = 8;
        };
	};
    class Controls {
        delete Eden_Extended_Objects_multiply_dialog;

        class MenuStrip: ctrlMenuStrip {
            class Items {
                delete ENH_About;
                delete ENH_About_BugReport;
                delete ENH_About_Changelog;
                delete ENH_About_Credits;
                delete ENH_About_Documentation;
                delete ENH_About_Steam;
                delete ENH_About_Translation;
                delete ENH_Folder_VHC;
                delete ENH_CopyVHC;
                delete ENH_ApplyVHC;
                delete ENH_RandomVHC;
                delete ENH_CopyPylonSettings;
                delete ENH_ApplyPylonSettings;
                delete ENH_ExportPylonsToSQF;
                delete ENH_3DENCamPositions;
                delete ENH_SAM;
                delete ENH_BriefingEditor;
                delete ENH_AttributeSearch;
                delete ENH_ActionCreator;
                delete ENH_ZeusAddons;
                delete ENH_RPTViewer;
                delete ENH_CreateObject;
                delete ENH_CreateTrigger;
                delete ENH_ExportMissionParameters;
                delete ENH_GenerateSteamMissionDescription;
                delete ENH_SwitchTime;
                delete ENH_ToggleSimpleObject;
                delete ENH_ToggleSimulation;
                delete ENH_ToggleDynamicSimulation;
                delete ENH_TogglePlayable;
                delete ENH_ToggleIsLocalOnly;
                delete ENH_ToggleAIFeatures;
                delete ENH_ToggleMarkerAlpha;

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

                class MissionPreviewSP {
                    shortcuts[] = {};
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
                        "GF_deform",
                        "ENH_Folder_Utilities",
                        "ENH_Folder_Placement",
                        "ENH_Folder_Loadout",
                        // "ENH_Folder_VHC",
                        "ENH_Folder_Debug",
                        "ENH_Folder_Miscellaneous",
                        "cba_ui_LobbyManager"
                        // "ace_arsenal_portVALoadouts"
                    };
                };

                class ENH_Folder_Utilities {
                    items[] = {
                        "ENH_CfgDisabledCommands",
                        "ENH_Jukebox",
                        "ENH_MoonPhases",
                        "ENH_PrintConfig",
                        "ENH_ScriptCommands",
                        "Separator",
                        "ENH_3DENRadio",
                        // "ENH_3DENCamPositions",
                        // "ENH_SAM",
                        "ENH_CfgSentencesBrowser",
                        "ENH_TextureFinder",
                        "Separator",
                        // "ENH_BriefingEditor",
                        // "ENH_AttributeSearch",
                        // "ENH_ActionCreator",
                        "ENH_BatchReplace",
                        "ENH_NameObjects",
                        // "ENH_ZeusAddons"
                    };
                };

                class ENH_Folder_Debug {
                    items[] = {
                        "ENH_VariableViewer",
                        // "ENH_RPTViewer",
                        // "ENH_CreateObject",
                        "Separator",
                        "ENH_ProductInfo",
                        "ENH_ClearChat",
                        "Separator",
                        "ENH_ExportGUIBaseClasses",
                        "ENH_GUITestGrids",
                        "Separator",
                        "ENH_ToggleDrawBuildingPositions",
                        "ENH_ToggleDrawDLCIcons",
                        "ENH_ToggleDrawHitpoints"
                    };
                };

                class ENH_Folder_Miscellaneous {
                    items[] = {
                        // "ENH_CreateTrigger",
                        "ENH_DeleteEmptyLayers",
                        // "ENH_ExportMissionParameters",
                        // "ENH_GenerateSteamMissionDescription",
                        "Separator",
                        // "ENH_SwitchTime",
                        "ENH_ToggleGrass",
                        // "Separator",
                        // "ENH_ToggleSimpleObject",
                        // "ENH_ToggleSimulation",
                        // "ENH_ToggleDynamicSimulation",
                        // "ENH_TogglePlayable",
                        // "ENH_ToggleIsLocalOnly",
                        // "ENH_ToggleAIFeatures",
                        // "ENH_ToggleMarkerAlpha"
                    };
                };
			};
		};

        class ButtonPlay: ctrlShortcutButton {
            shortcuts[] = {"0x00050000 + 0", 57};
        };
    };
};
