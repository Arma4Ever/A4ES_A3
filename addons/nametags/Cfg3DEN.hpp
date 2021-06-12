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
        class GVAR(rankSelect): Combo {
            attributeLoad = QUOTE(_this call FUNC(rankSelect_attributeLoad));
            attributeSave = QUOTE(_this call FUNC(rankSelect_attributeSave));
            h = "4 * 5 * (pixelH * pixelGrid * 0.50)";

            class Controls: Controls {
                class Title: Title {
                    y = "1.5 * 5 * (pixelH * pixelGrid * 0.50)";
                };
                class GVAR(categoryTitle): ctrlStatic {
                    idc = -1;
                    x = "48 * (pixelW * pixelGrid * 	0.50)";
                    y = "0 * 5 * (pixelH * pixelGrid * 0.50)";
                    w = "82 * (pixelW * pixelGrid * 0.50)";
                    h = "5 * (pixelH * pixelGrid * 0.50)";
                    text = "Kategoria rangi";
                    colorText[] = {1, 1, 1, 0.4};
                };
                class GVAR(category): ctrlCombo {
                    idc = 1091;
                    x = "48 * (pixelW * pixelGrid * 	0.50)";
                    y = "1 * 5 * (pixelH * pixelGrid * 0.50)";
                    w = "82 * (pixelW * pixelGrid * 0.50)";
                    h = "5 * (pixelH * pixelGrid * 0.50)";
                };
                class GVAR(valueTitle): ctrlStatic {
                    idc = -1;
                    x = "48 * (pixelW * pixelGrid * 	0.50)";
                    y = "2 * 5 * (pixelH * pixelGrid * 0.50)";
                    w = "82 * (pixelW * pixelGrid * 0.50)";
                    h = "5 * (pixelH * pixelGrid * 0.50)";
                    text = "Ranga";
                    colorText[] = {1, 1, 1, 0.4};
                };
                class Value: Value {
                    idc = 100;
                    x = "48 * (pixelW * pixelGrid * 	0.50)";
                    y = "3 * 5 * (pixelH * pixelGrid * 0.50)";
                    w = "82 * (pixelW * pixelGrid * 0.50)";
                    h = "5 * (pixelH * pixelGrid * 0.50)";
                };
            };
        };
    };
    class Object {
        class AttributeCategories {
            class GVAR(attributes) {
                displayName = CSTRING(Settings_Addon);
                collapsed = 1;
                class Attributes {
                    class GVAR(showNameTag) {
                        displayName = CSTRING(Attributes_showNameTag);
                        tooltip = CSTRING(Attributes_showNameTag_Tooltip);
                        property = QGVAR(showNameTag);
                        control = "Checkbox";
                        expression = "if (_value) then {_this setVariable ['%s', _value, true];};";
                        defaultValue = "false";
                        typeName = "BOOL";
                        condition = "objectControllable";
                    };
                    class GVAR(rank) {
                        displayName = CSTRING(Attributes_rank);
                        tooltip = CSTRING(Attributes_rank_Tooltip);
                        property = QGVAR(rank);
                        control = QGVAR(rankSelect);
                        expression = "if (_value != '') then {_this setVariable ['%s', _value, true];};";
                        defaultValue = "''";
                        typeName = "STRING";
                        condition = "objectControllable";
                    };
                    class GVAR(rankName) {
                        displayName = CSTRING(Attributes_rankName);
                        tooltip = CSTRING(Attributes_rankName_Tooltip);
                        property = QGVAR(rankName);
                        control = "Edit";
                        expression = "if (_value != '') then {_this setVariable ['%s', _value, true];};";
                        defaultValue = "''";
                        typeName = "STRING";
                        condition = "objectControllable";
                    };
                    class GVAR(rankIcon) {
                        displayName = CSTRING(Attributes_rankIcon);
                        tooltip = CSTRING(Attributes_rankIcon_Tooltip);
                        property = QGVAR(rankIcon);
                        control = "Edit";
                        expression = "if (_value != '') then {_this setVariable ['%s', _value, true];};";
                        defaultValue = "''";
                        typeName = "STRING";
                        condition = "objectControllable";
                    };
                    class GVAR(specialIcon) {
                        displayName = CSTRING(Attributes_specialIcon);
                        tooltip = CSTRING(Attributes_specialIcon_Tooltip);
                        property = QGVAR(specialIcon);
                        control = "Edit";
                        expression = "if (_value != '') then {_this setVariable ['%s', _value, true];};";
                        defaultValue = "''";
                        typeName = "STRING";
                        condition = "objectControllable";
                    };
                };
            };
        };
    };
};
