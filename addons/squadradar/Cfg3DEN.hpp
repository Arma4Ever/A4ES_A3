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

    class Mission {
        class Scenario {
            class AttributeCategories {
                class Misc {
                    class Attributes {
                        class GVAR(subCategory) {
							data = "AttributeSystemSubcategory";
							control = "SubCategory";
                            displayName = CSTRING(AttributeCategory);
							description = "";
						};
                        class GVAR(disableSquadRadar) {
							property = QGVAR(disableSquadRadar);
							control = "Checkbox";
							displayName = CSTRING(Attributes_disableSquadRadar);
							tooltip = CSTRING(Attributes_disableSquadRadar_Tooltip);
                            typeName = "BOOL";
                            defaultValue = "false";
						};
                        class GVAR(showHelpIconToEveryone) {
							property = QGVAR(showHelpIconToEveryone);
							control = "Checkbox";
							displayName = CSTRING(Attributes_showHelpIconToEveryone);
							tooltip = CSTRING(Attributes_showHelpIconToEveryone_Tooltip);
                            typeName = "BOOL";
                            defaultValue = "false";
						};
                        class GVAR(disableHelpIconFOVCheck) {
							property = QGVAR(disableHelpIconFOVCheck);
							control = "Checkbox";
							displayName = CSTRING(Attributes_disableHelpIconFOVCheck);
							tooltip = CSTRING(Attributes_disableHelpIconFOVCheck_Tooltip);
                            typeName = "BOOL";
                            defaultValue = "false";
						};
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
                        expression = "if (_value isNotEqualTo '') then {_this setVariable ['%s', _value, true];};";
                        typeName = "STRING";
                        condition = "objectControllable";
                        defaultValue = "''";
                    };
                };
            };
        };
    };
};
