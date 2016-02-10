class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class Control {
                class Attributes {
                    class GVAR(characterDesc) {
                        value = 0;
                        control = "EditMulti5";
                        displayName = CSTRING(ObjectAttribute_Control_CharacterDesc_DisplayName);
                        tooltip = CSTRING(ObjectAttribute_Control_CharacterDesc_Description);
                        property = QGVAR(characterDesc);
                        defaultValue = "''";
                        expression = "_this setVariable ['%s',_value];";
                        typeName = "STRING";
                        condition = "objectBrain";
                        wikiType = "[[String]]";
                    };
                };
            };
            class GVAR(cacheSettings) {
                displayName = CSTRING(ObjectAttribute_CacheSettings_DisplayName);
                collapsed = 1;
                class Attributes {
                    class GVAR(cacheUnit) {
                        value = 0;
                        control = "Combo";
                        displayName = CSTRING(ObjectAttribute_CacheSettings_CacheUnit_DisplayName);
                        tooltip = CSTRING(ObjectAttribute_CacheSettings_CacheUnit_Description);
                        property = QGVAR(cacheUnit);
                        expression = "_this setVariable ['%s',_value];";
                        typeName = "STRING";
                        condition = "objectBrain";
                        wikiType = "[[String]]";
                        defaultValue = 0;
                        class values {
                            class always {name = CSTRING(ObjectAttribute_CacheSettings_CacheUnit_Yes_DisplayName); value = "always"; default = 1;};
                            class noifleader {name = CSTRING(ObjectAttribute_CacheSettings_CacheUnit_NoLeader_DisplayName); value = "noifleader"; default = 0;};
                            class never {name = CSTRING(ObjectAttribute_CacheSettings_CacheUnit_No_DisplayName); value = "never"; default = 0;};
                        };
                    };
                };
            };
        };
    };
};
