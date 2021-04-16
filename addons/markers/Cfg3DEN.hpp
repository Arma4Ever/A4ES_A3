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
                        class GVAR(disableUniqueMaps) {
							property = QGVAR(disableUniqueMaps);
							control = "Checkbox";
							displayName = CSTRING(Attributes_disableUniqueMaps);
							tooltip = CSTRING(Attributes_disableUniqueMaps_Tooltip);
                            typeName = "BOOL";
                            defaultValue = "false";
						};
                    };
                };
            };
        };
	};
};
