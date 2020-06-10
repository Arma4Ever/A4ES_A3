class Cfg3DEN {
	class Attributes {
		class Default;
		class Title: Default {
			class Controls {
				class Title;
			};
		};
        class Combo: Title {
            class Controls: Controls {
                class Title: Title {};
                class Value: ctrlCombo {};
			};
		};
        class GVAR(gameType): Combo {
            attributeLoad = QUOTE(_this call FUNC(gameType_attributeLoad));
            h = "6 * 5 * (pixelH * pixelGrid * 	0.50)";
			class Controls: Controls {
				class Title: Title {};
				class Value: Value {};
                class Group: ctrlControlsGroup {
    				idc = 102;
                    x = "48 * (pixelW * pixelGrid * 0.50)";
                    y = "5 * (pixelH * pixelGrid * 	0.50)";
                    w = "82 * (pixelW * pixelGrid * 0.50)";
    				h = "4 * 5 * (pixelH * pixelGrid * 0.50)";
    				class Controls {
    					class Text: ctrlStructuredText {
    						idc = 103;
    						size=  "3.96 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
    						w = "82 * (pixelW * pixelGrid * 0.50)";
    						h = "4 * 5 * (pixelH * pixelGrid * 0.50)";
                            colorBackground[] = {0, 0, 0, 0};
                            shadow = 0;
                            class Attributes {
                                color = "#ffffff";
                                size = 1;
                                align = "left";
                                colorLink = "#c2c2c2";
                                font = "RobotoCondensedLight";
                            };
    					};
    				};
    			};


                /* class GVAR(description): ctrlStructuredText {
                    idc = 702;
                    x = "48 * (pixelW * pixelGrid * 0.50)";
                    y = "5 * (pixelH * pixelGrid * 	0.50)";
                    w = "82 * (pixelW * pixelGrid * 0.50)";
                    h = "4 * 5 * (pixelH * pixelGrid * 0.50)";
                    colorBackground[] = {1,1,1,0};
                    shadow = 0;
                    class Attributes {
                        color = "#ffffff";
                        size = 1;
                        align = "left";
                        colorLink = "#c2c2c2";
                        font = "RobotoCondensedLight";
                    };
                }; */
			};
		};
	};
    class Mission {
        class Multiplayer {
            class AttributeCategories {
				class Type {
					class Attributes {
						class GameType {
							control = QEGVAR(editor,hiddenCombo);
						};
                        class MinPlayers {
                            control = QEGVAR(editor,hiddenCombo);
						};
						class MaxPlayers {
                            control = QEGVAR(editor,hiddenEdit);
						};
                        class GVAR(gameType) {
							property = QGVAR(gameType);
							control = QGVAR(gameType);
							displayName = "$STR_3DEN_Multiplayer_Attribute_GameType_displayName";
							tooltip = "$STR_3DEN_Multiplayer_Attribute_GameType_tooltip";
							defaultValue = 0;
						};
					};
				};
            };
        };
    };
};
