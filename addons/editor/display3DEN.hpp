class Display3DEN {
	class ContextMenu: ctrlMenu {
		class Items {
            items[] += {
            	"ENH_MeasureDistance",
            	"ENH_Garrison",
            };
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
            class ConnectParent {
            	items[] += {
            		"ENH_TriggerOwnerPlayer",
            	};
            };

			#include "ENH\contextMenu.hpp"
		};
	};
	class Controls {
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
