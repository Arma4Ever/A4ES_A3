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
        class GVAR(baseIconClass): Combo {
            class Controls: Controls {
                class Title: Title {};
                class Value: Value {
                    class Items {
                        class Auto {
                            text = CSTRING(iconClasses_auto);
                            data = "";
                            tooltip = CSTRING(iconClasses_auto_Tooltip);

                        };
                    };
                    class ItemsConfig {
                        path[] = {QGVAR(iconClasses)};
                        propertyText = "name";
                        propertyPicture = "icon";
                    };
                };
            };
        };
    };

	class Object {
        class AttributeCategories {
            class State {
                class Attributes {
                    class GVAR(baseIconClass) {
                        displayName = CSTRING(Attributes_baseIconClass);
                        tooltip = CSTRING(Attributes_baseIconClass_Tooltip);
                        control = QGVAR(baseIconClass);
                        property = QGVAR(baseIconClass);
                        expression = "if !(_value isEqualTo '') then {_this setVariable ['%s', _value, true];};";
                        typeName = "STRING";
                        condition = "objectControllable";
                        defaultValue = "''";
                    };
                };
            };
        };
    };
};
