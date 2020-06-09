class Display3DEN {
	class ContextMenu: ctrlMenu {
		class Items {
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
                "ENH_MeasureDistance",
                "ENH_Garrison"
            };
            delete Eden_Extended_Objects_Multiply_Contextual;

            class Log {
            	picture = PATHTOF(ENH\data\icon_clipboard.paa);
            	items[] = {
                    "LogClasses",
                    "ENH_LogClassesString",
            		"ENH_LogPositions3D",
            		"ENH_LogPositions2D",
            		"ENH_LogGridPositon",
                };
            };
            class Edit {
            	items[] += {
            		"ENH_DeleteCrew",
            		"ENH_FirstPerson"
            	};
            };

			#include "ENH\contextMenu.hpp"
		};
	};
    class ControlsBackground {
		delete Eden_Extended_Objects_multiply_modal;
	};
	class Controls {
        delete Eden_Extended_Objects_multiply_dialog;
        
		class MenuStrip: ctrlMenuStrip {
            class Items {
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
                        "ENH_Folder_Miscellaneous",
                    };
                };
                #include "ENH\menustrip.hpp"
			};
		};
        #include "ENH\statusbar.hpp"
	};
};
