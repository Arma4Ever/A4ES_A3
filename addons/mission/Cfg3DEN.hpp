class Cfg3DEN {
    class Mission {
        class Scenario {
            class AttributeCategories {
                class Misc {
                    class Attributes {
                        class GVAR(subCategory) {
                            data = "AttributeSystemSubcategory";
                            control = "SubCategory";
                            displayName = CSTRING(Attributes_Category_Markers);
                            description = "";
                        };
                        class GVAR(enableLocalMarkers) {
                            property = QGVAR(enableLocalMarkers);
                            control = "Checkbox";
                            displayName = CSTRING(Attributes_enableLocalMarkers);
                            tooltip = CSTRING(Attributes_enableLocalMarkers_Tooltip);
                            typeName = "BOOL";
                            defaultValue = "false";
                        };
                    };
                };
            };
        };
    };
};