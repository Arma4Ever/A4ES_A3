class Cfg3DEN {
	class Attributes {
		class Default;
		class Title: Default {
			class Controls {
				class Title;
                class GVAR(description): ctrlStructuredText {
                    idc = 702;
                    x = "48 * (pixelW * pixelGrid * 0.50)";
                    y = "5 * (pixelH * pixelGrid * 	0.50)";
                    w = "82 * (pixelW * pixelGrid * 0.50)";
                    h = "0";
                    colorBackground[] = {1,1,1,0};
                    shadow = 0;
                    class Attributes {
                        color = "#999999";
                        size = 1;
                        align = "left";
                        colorLink = "#c2c2c2";
                        font = "RobotoCondensedLight";
                    };
                };
			};
		};
        class Combo: Title {
            class Controls: Controls {
				class Title: Title {};
                class Value: ctrlCombo {};
                class GVAR(description): GVAR(description) {};
			};
        };
        class Edit: Title {
            class Controls: Controls {
				class Title: Title {};
                class Value: ctrlEdit {};
                class GVAR(description): GVAR(description) {};
			};
        };
        class ModuleInfo: Default {
			class Controls {
				class TitleCustom: ctrlStatic {};
				class Group: ctrlControlsGroup {
					class Controls {
                        class Text: ctrlStructuredText {};
                    };
				};
			};
		};

        class SubCategory: Default {};
    	class SubCategoryDesc1: SubCategory {};
        class GVAR(subCategory): SubCategory {};
        class GVAR(subCategoryWithDescription): SubCategoryDesc1 {};
        class GVAR(moduleShortDescription): SubCategoryDesc1 {
            attributeLoad = QUOTE(_this call FUNC(moduleShortDescription_attributeLoad));
        };

        class GVAR(moduleDescription): ModuleInfo {
            attributeLoad = QUOTE(_this call FUNC(moduleDescription_attributeLoad));
            h = "5 * (pixelH * pixelGrid * 0.50)";
            class Controls: Controls {
				class TitleCustom: TitleCustom {
                    idc = IDC_DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE;
					text = CSTRING(ModuleDescription_Title);
                    colorText[] = {0.75, 0.75, 0.75, 1};
                    colorShadow[] = {0, 0, 0, 0};
                    colorBackground[] = {0, 0, 0, 0.25};
                    h = "5 * (pixelH * pixelGrid * 0.50)";
				};
				class Group: Group {
                    h = "0";
                    class Controls: Controls {
                        class Text: Text {
                            colorBackground[] = {0, 0, 0, 0.15};
                            h = "0";
                        };
                    };
                };
			};
        };
        class GVAR(moduleWarnings): ModuleInfo {
            attributeLoad = QUOTE(_this call FUNC(moduleWarnings_attributeLoad));
            h = "5 * 	5 * (pixelH * pixelGrid * 0.50)";
            class Controls {
                delete TitleCustom;
                class Group: ctrlControlsGroup {
                    idc = 101;
                    x = "5 * (pixelW * pixelGrid * 0.50)";
                    y = "0";
                    w = "(	48 + 82 - 5) * (pixelW * pixelGrid * 0.50)";
                    h = "5 * 5 * (pixelH * pixelGrid * 0.50)";

                    class ScrollBar {
                        scrollSpeed = 0;
                    };
                    class Controls {
                        class Text: ctrlStructuredText {
                            idc = 100;
                            size = "3.96 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                            y = "0";
                            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 0.50)";
                            h = "5 * 5 * (pixelH * pixelGrid * 	0.50)";
                            colorBackground[]={0,0,0,0};
                        };
                    };
                };
            };
        };

        class GVAR(dynamicCombo): Combo {
			attributeLoad = QUOTE(_this call FUNC(dynamicCombo_attributeLoad));

            class Controls: Controls {
				class Title: Title {
                    DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES;
                };
                class Value: Value {};
                class GVAR(description): GVAR(description) {};
			};
        };
        class GVAR(dynamicEdit): Edit {
			attributeLoad = QUOTE(_this call FUNC(dynamicEdit_attributeLoad));
            class Controls: Controls {
				class Title: Title {
                    DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES;
                };
                class Value: Value {};
                class GVAR(description): GVAR(description) {};
			};
		};
	};
    class EventHandlers {
        class ADDON {
			onMissionNew = QUOTE(call FUNC(initWarnings));
			onMissionLoad = QUOTE(call FUNC(initWarnings));
            onMissionPreviewEnd = QUOTE(call FUNC(initWarnings));
        };
	};
};
