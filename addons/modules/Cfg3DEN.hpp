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
        class Type: Title {
			class Controls: Controls {
				class Title: Title {};
				class Search: ctrlEdit {};
				class SearchButton: ctrlButtonSearch {};
				class Value: ctrlTree {};
                class GVAR(description): GVAR(description) {};
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
        class Toolbox: Title {
			class Controls: Controls {
				class Title: Title {};
				class Value: ctrlToolbox {};
                class GVAR(description): GVAR(description) {};
			};
		};
        class Checkbox: Title {
			class Controls: Controls {
				class Title: Title {};
				class Value: ctrlCheckboxBaseline {};
                class GVAR(description): GVAR(description) {};
			};
		};
        class Slider: Title {
			class Controls: Controls {
				class Title: Title {};
				class Value: ctrlXSliderH {};
				class Edit: ctrlEdit {};
                class GVAR(description): GVAR(description) {};
			};
		};
        class Skill: Slider {
            class Controls: Controls {
                class Title: Title {};
                class Value: Value {};
                class Edit: Edit {};
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

        #include "attributes\moduleDescription.hpp"
        #include "attributes\moduleWarnings.hpp"

        #include "attributes\dynamicEdit.hpp"
        #include "attributes\dynamicCombo.hpp"
        #include "attributes\dynamicCheckbox.hpp"
        #include "attributes\dynamicToolbox.hpp"

        #include "attributes\dynamicClassSelect.hpp"
        #include "attributes\dynamicToolboxSide.hpp"
        #include "attributes\dynamicToolboxUnitPos.hpp"
        #include "attributes\dynamicSkillSlider.hpp"

        #include "modules\genSoldiers\attributes\source.hpp"
        #include "modules\genSoldiers\attributes\classListMode.hpp"
	};
    class EventHandlers {
        class ADDON {
			onMissionNew = QUOTE(call FUNC(initWarnings));
			onMissionLoad = QUOTE(call FUNC(initWarnings));
            onMissionPreviewEnd = QUOTE(call FUNC(initWarnings));
        };
	};
};
