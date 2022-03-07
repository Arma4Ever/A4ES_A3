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
                        class GVAR(enableSystem) {
							property = QGVAR(enableSystem);
							control = "Checkbox";
							displayName = CSTRING(Attributes_enableSystem);
							tooltip = CSTRING(Attributes_enableSystem_Tooltip);
                            typeName = "BOOL";
                            defaultValue = "false";
						};
                    };
                };
            };
        };
	};
};
