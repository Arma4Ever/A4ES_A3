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
                        class GVAR(enableArtComputer) {
                            property = QGVAR(enableArtComputer);
                            control = "Checkbox";
                            displayName = CSTRING(Attributes_enableArtComputer);
                            tooltip = CSTRING(Attributes_enableArtComputer_Tooltip);
                            typeName = "BOOL";
                            defaultValue = "false";
                        };
                    };
                };
            };
        };
    };
};
