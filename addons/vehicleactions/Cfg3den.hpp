class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class State {
                class Attributes {
                    class GVAR(disallowTurnVehicle) {
                        value = 0;
                        control = "CheckboxNumber";
                        displayName = CSTRING(Eden_DisallowTurnVehicle_DisplayName);
                        tooltip = CSTRING(Eden_DisallowTurnVehicle_Description);
                        property = QGVAR(disallowTurnVehicle);
                        expression = "_this setVariable ['%s', _value, true];";
                        defaultValue = 0;
                        condition = "objectVehicle";
                    };
                };
            };
        };
    };
};
