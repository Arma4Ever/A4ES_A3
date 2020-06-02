class Display3DEN {
    class Controls {
        class PanelLeft: ctrlControlsGroupNoScrollbars {
            class Controls {
                class TabLeftBackground: ctrlStatic {};
                class TabLeftToggle: ctrlButton {};

                class TabLeftSectionsWarningIcon: ctrlStaticPictureKeepAspect {
        			idc = IDC_DISPLAY3DEN_PANELLEFT_WARNINGS_ICON;
                    show = 0;
                    x="(	45.7) * (pixelW * pixelGrid * 	0.50)";
                    y="(	1) * (pixelH * pixelGrid * 	0.50)";
                    w="(	17 - 	(	5 + 1) - 1) * (pixelW * pixelGrid * 	0.50)";
                    h="5 * (pixelH * pixelGrid * 	0.50)";
        			text = QPATHTOF(data\leftpanel\warning.paa);
                    tooltip = CSTRING(Warnings);
        		};

                class TabLeftSections: ctrlToolbox {
                    style = 2098;
                    columns = 3;
					strings[] = {
                        QPATHTOF(data\leftpanel\entitylist.paa),
						QPATHTOF(data\leftpanel\locations.paa),
                        QPATHTOF(data\leftpanel\warning.paa)
					};
                    tooltips[] = {
                        "$STR_3DEN_Display3DEN_Entities",
                        "$STR_3DEN_Display3DEN_Locations",
                        CSTRING(Warnings)
                    };
					values[] = {
                        IDC_DISPLAY3DEN_PANELLEFT_EDIT,
                        IDC_DISPLAY3DEN_PANELLEFT_LOCATIONS,
                        IDC_DISPLAY3DEN_PANELLEFT_WARNINGS
                    };
                    onToolBoxSelChanged = QUOTE(_this call FUNC(switchLeftPanelTab));
                };

                class PanelLeftBackground: ctrlStatic {};
                class PanelLeftEdit: ctrlControlsGroupNoScrollbars {};
                class PanelLeftLocations: ctrlControlsGroupNoScrollbars {};

                class PanelLeftWarnings: ctrlControlsGroupNoScrollbars {
					idc = IDC_DISPLAY3DEN_PANELLEFT_WARNINGS;
					x = 0;
					y = "(	5 + 1) * (pixelH * pixelGrid * 	0.50)";
					w = "60 * (pixelW * pixelGrid * 	0.50)";
					h = "safezoneH - (		5 + 	(	5 + 2) + 	(	5 + 1) + 		4) * (pixelH * pixelGrid * 	0.50)";
					show = 0;
					class Controls {
						class PanelLeftWarningsBackground: ctrlStatic {
							w = "60 * (pixelW * pixelGrid * 	0.50)";
							h = "(	5 + 2) * (pixelH * pixelGrid * 	0.50)";
							colorBackground[] = {0.2,0.2,0.2,1};
						};
						class WarningsInfo: ctrlStructuredText {
							idc = IDC_DISPLAY3DEN_PANELLEFT_WARNINGS_INFO;
							x = "1 * (pixelW * pixelGrid * 	0.50)";
							y ="(pixelH * pixelGrid * 	0.50)";
							w = "60 * (pixelW * pixelGrid * 	0.50)";
							h = "5 * (pixelH * pixelGrid * 	0.50)";
							text = "";
						};
						class WarningsTree: ctrlTree {
							idc = IDC_DISPLAY3DEN_PANELLEFT_WARNINGS_TREE;
							x = 0;
							y = "(	5 + 2) * (pixelH * pixelGrid * 	0.50)";
							w = "60 * (pixelW * pixelGrid * 	0.50)";
							h = "safezoneH - (		5 + 	(	5 + 2) + 	(	5 + 1) + 		4 + 	5 + 2 + 1 + 	5) * (pixelH * pixelGrid * 	0.50)";
							sizeEx = "3.96 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
							font = "RobotoCondensedLight";
							colorBorder[] = {0, 0, 0, 0};
                            onTreeSelChanged = "false";
                			onTreeDblClick = "false";
                            //['select',_this] call bis_fnc_3DENListLocations;
							disableKeyboardSearch = 1;
							expandOnDoubleclick = 0;
						};
					};
				};
            };
        };
    };
};
