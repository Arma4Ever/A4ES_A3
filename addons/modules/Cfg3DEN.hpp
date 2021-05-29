class Cfg3DEN {
	class Attributes {
		class Default;
		class Title: Default {
			class Controls {
				class Title;
                class GVAR(description): ctrlStructuredText {
                    idc = IDC_DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_DESC;
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
        class EditMulti3: Edit {
			class Controls: Controls {
				class Background: ctrlStaticOverlay {};
				class Title: ctrlStaticFrame {};
				class Value: Value {};
                class GVAR(description): GVAR(description) {
                    x = "5 * (pixelW * pixelGrid * 0.50)";
                    y = "4 * 5 * (pixelH * pixelGrid * 	0.50)";
                    w = "(48 + 82 - 5) * (pixelW * pixelGrid * 0.50)";
                };
			};
		};
		class EditMulti5: EditMulti3 {
			class Controls: Controls {
				class Background: Background {};
                class Title: Title {};
                class Value: Value {};
                class GVAR(description): GVAR(description) {
                    x = "5 * (pixelW * pixelGrid * 0.50)";
                    y = "6 * 5 * (pixelH * pixelGrid * 	0.50)";
                    w = "(48 + 82 - 5) * (pixelW * pixelGrid * 0.50)";
                };
			};
		};
        class EditCode: Edit {
			class Controls: Controls {
				class Title: Title {};
				class Value: Value {};
                class GVAR(description): GVAR(description) {};
			};
		};
        class EditCodeMulti3: EditMulti3 {
			class Controls: Controls {
				class Background: Background {};
				class Title: Title {};
				class Value: Value {};
                class GVAR(description): GVAR(description) {
                    y = "(5 + 3 * 3.5) * (pixelH * pixelGrid * 	0.50)";
                };
			};
		};
		class EditCodeMulti5: EditMulti5 {
			class Controls: Controls {
				class Background: Background {};
				class Title: Title {};
				class Value: Value {};
                class GVAR(description): GVAR(description) {
                    y = "(5 + 5 * 3.5) * (pixelH * pixelGrid * 	0.50)";
                };
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
        class SubCategory: Default {
			class Controls {
				class Group: ctrlControlsGroup {
					class Controls {
						class Title: ctrlStatic {};
						class TitleDeco: ctrlStatic {};
					};
				};
			};
		};
		class SubCategoryDesc1: SubCategory {
			class Controls: Controls {
				class Group: Group {
					class Controls: Controls {
						class Title: Title {};
						class TitleDeco: TitleDeco {};
						class Description: ctrlStructuredText {};
					};
				};
			};
		};
        class GVAR(subCategory): SubCategory {
            class Controls: Controls {
				class Group: Group {
					class Controls: Controls {
						class Title: Title {};
						class TitleDeco: TitleDeco {};
					};
				};
			};
        };
        class GVAR(subCategoryWithDescription): SubCategoryDesc1 {
            class Controls: Controls {
				class Group: Group {
					class Controls: Controls {
						class Title: Title {};
						class TitleDeco: TitleDeco {};
						class Description: Description {};
					};
				};
			};
        };
        class GVAR(moduleShortDescription): SubCategoryDesc1 {
            attributeLoad = QUOTE(_this call FUNC(moduleShortDescription_attributeLoad));
            class Controls: Controls {
				class Group: Group {
					class Controls: Controls {
						class Title: Title {};
						class TitleDeco: TitleDeco {};
						class Description: Description {};
					};
				};
			};
        };
        class GVAR(moduleSubCategory): GVAR(moduleShortDescription) {
            attributeLoad = QUOTE(_this call FUNC(moduleSubCategory_attributeLoad));
            h = "5 * (pixelH * pixelGrid * 0.50)";
            class Controls: Controls {
				class Group: Group {
					class Controls: Controls {
						class Title: Title {
                            x = "15 * (pixelW * pixelGrid * 0.50)";
                            w = "115 * (pixelW * pixelGrid * 0.50)";
                            colorText[] = {1,1,1,0.40000001};
							colorBackground[] = {1,1,1,0};
							colorShadow[] = {0,0,0,0};
                        };
						class TitleDeco: TitleDeco {
                            x = "15 * (pixelW * pixelGrid * 0.50)";
                            w = "115 * (pixelW * pixelGrid * 0.50)";
                        };
						class Description: Description {
                            x = "15 * (pixelW * pixelGrid * 0.50)";
                            y = "5 * (pixelH * pixelGrid * 	0.50)";
                            w = "115 * (pixelW * pixelGrid * 0.50)";
							h = "0";
						};
					};
				};
			};
        };

        #include "attributes\moduleDescription.hpp"
        #include "attributes\moduleWarnings.hpp"

        #include "attributes\dynamicEdit.hpp"
        #include "attributes\dynamicCombo.hpp"
        #include "attributes\dynamicCheckbox.hpp"
        #include "attributes\dynamicToolbox.hpp"
        #include "attributes\dynamicSlider.hpp"

        #include "attributes\dynamicClassSelect.hpp"
        #include "attributes\dynamicToolboxActivationMode.hpp"
        #include "attributes\dynamicToolboxSide.hpp"
        #include "attributes\dynamicToolboxSoundRepeatMode.hpp"
        #include "attributes\dynamicToolboxTaskState.hpp"
        #include "attributes\dynamicToolboxUnitStance.hpp"
        #include "attributes\dynamicOwnerToolbox.hpp"
        #include "attributes\dynamicSkillSlider.hpp"

        #include "modules\fireArtillery\attributes\conditionType.hpp"
        #include "modules\fireArtillery\attributes\targetPosMode.hpp"

        #include "modules\generateSoldiers\attributes\source.hpp"
        #include "modules\generateSoldiers\attributes\classListMode.hpp"
        #include "modules\generateSoldiers\attributes\spawnPosMode.hpp"

		#include "modules\ambientFlyby\attributes\mode.hpp"
	};
    class EventHandlers {
        class ADDON {
			onMissionNew = QUOTE(call FUNC(initWarnings));
			onMissionLoad = QUOTE(call FUNC(initWarnings));
            onMissionPreviewEnd = QUOTE(call FUNC(initWarnings));
        };
	};
};
