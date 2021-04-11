class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class Control {
                class Attributes {
                    class GVAR(characterDesc) {
                        displayName = CSTRING(Attributes_characterDesc);
                        tooltip = CSTRING(Attributes_characterDesc_Tooltip);
                        control = "EditMulti5";
                        property = QGVAR(characterDesc);
                        expression = "if (_value isNotEqualTo '') then {_this setVariable ['%s', _value, true];};";
                        typeName = "STRING";
                        condition = "objectControllable";
                        defaultValue = "''";
                    };
                };
            };
        };
    };
};
