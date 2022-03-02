class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class StateSpecial {
                class Attributes {
                    class GVAR(isCurator) {
                        displayName = CSTRING(Attribute_isCurator);
            			tooltip = CSTRING(Attribute_isCurator_Tooltip);
            			property = QGVAR(isCurator);
            			control = "Checkbox";
            			expression = QUOTE(if (_value) then {_this setVariable [ARR_3(QQGVAR(isCurator),true,true)]};);
            			defaultValue = "false";
            			condition = "objectControllable";
                    };
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
