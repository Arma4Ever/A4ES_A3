class Cfg3DEN {
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
                        class GVAR(disableSystem) {
							property = QGVAR(disableSystem);
							control = "Checkbox";
							displayName = CSTRING(Attributes_disableSystem);
							tooltip = CSTRING(Attributes_disableSystem_Tooltip);
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
            class ace_attributes {
                class Attributes {
                    class GVAR(enableACEDamage) {
                        displayName = CSTRING(Attributes_enableACEDamage);
                        tooltip = CSTRING(Attributes_enableACEDamage_Tooltip);
                        property = QUOTE(enableACEDamage);
                        control = "Checkbox";
                        expression = "if (_value) then {_this setVariable ['%s', _value, true];};";
                        defaultValue = "false";
                        condition = "objectBrain";
                        typeName = "BOOL";
                    };
                };
            };
        };
    };
};
