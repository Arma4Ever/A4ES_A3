class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class StateSpecial {
                class Attributes {
                    class GVAR(addCuratorEditableObject) {
                        displayName = CSTRING(addCuratorEditableObject);
            			tooltip = CSTRING(addCuratorEditableObject_Tooltip);
            			property = QGVAR(addCuratorEditableObject);
            			control = "Checkbox";
            			expression = QUOTE(if (_value) then {_this call FUNC(addCuratorEditable3DENObject)};);
            			defaultValue = "false";
            			condition = "(1 - objectBrain) * (1 - objectVehicle)";
                    };
                };
            };
        };
    };
};
