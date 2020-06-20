class Cfg3DEN {
    class Mission {
        class Scenario {
            class AttributeCategories {
                class Misc {
                    class Attributes {
                        class GVAR(disableSystem) {
							property = QGVAR(disableSystem);
							control = "Checkbox";
							displayName = CSTRING(DisableSystem);
							tooltip = CSTRING(DisableSystem_Tooltip);
                            typeName = "BOOL";
                            defaultValue = "false";
						};
                    };
                };
            };
        };
	};
};
