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
};
