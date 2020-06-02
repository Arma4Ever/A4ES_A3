class Cfg3DEN {
	class Attributes {
		class Default;
		class Title: Default {
			class Controls {
				class Title;
			};
		};
        class Combo: Title {};
        class Edit: Title {};
        class ModuleInfo: Default {};

        class GVAR(moduleShortDescription): ModuleInfo {
            attributeLoad = QUOTE(_this call FUNC(moduleShortDescription_attributeLoad));
        };

        class GVAR(moduleWarnings): ModuleInfo {
            attributeLoad = QUOTE(_this call FUNC(moduleWarnings_attributeLoad));
            attributeSave = "";
            h = "5 * 	5 * (pixelH * pixelGrid * 	0.50)";
            class Controls {
                delete TitleCustom;
                class Group: ctrlControlsGroup {
                    idc = 101;
                    x = "5 * (pixelW * pixelGrid * 	0.50)";
                    y = "0";
                    w = "(	48 + 	82 - 5) * (pixelW * pixelGrid * 	0.50)";
                    h = "5 * 	5 * (pixelH * pixelGrid * 	0.50)";
                    class Controls {
                        class Text: ctrlStructuredText {
                            idc = 100;
                            size = "5.5 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                            y = "0";
                            w = "(	48 + 	82 - 5) * (pixelW * pixelGrid * 	0.50)";
                            h = "5 * 	5 * (pixelH * pixelGrid * 	0.50)";
                            colorBackground[]={0,0,0,0.25};
                        };
                    };
                };
            };
        };

        class GVAR(dynamicCombo): Combo {
			attributeLoad = QUOTE(_this call FUNC(dynamicCombo_attributeLoad));
        };

        class GVAR(dynamicEdit): Edit {
			attributeLoad = QUOTE(_this call FUNC(dynamicEdit_attributeLoad));
		};

        class GVAR(moduleDescription): ModuleInfo {
            attributeLoad = QUOTE(_this call FUNC(moduleDescription_attributeLoad));
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
