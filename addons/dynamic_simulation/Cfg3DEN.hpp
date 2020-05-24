class ctrlStatic;
class ctrlCheckboxBaseline;

class Cfg3DEN {
    class Attributes {
        class Checkbox;
        class GVAR(enableDynamicSimulation): Checkbox {
            w = "0";
            h = "0";
		};
    };

    class Group {
        class AttributeCategories {
            class State {
                class Attributes {
                    class dynamicSimulation {
                        control = QGVAR(enableDynamicSimulation);
                    };
                    class GVAR(disable) {
                        property = QGVAR(disable);
						control = "Checkbox";
                        displayName = CSTRING(Disable);
						tooltip = CSTRING(Disable_Tooltip);
						expression = QUOTE(_this call FUNC(update3DENAttribute));
						defaultValue = "false";
                        typeName = "BOOL";
						wikiType = "[[Bool]]";
                    };
                };
            };
        };
    };
};
