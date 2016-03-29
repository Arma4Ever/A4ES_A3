class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class State {
                class Attributes {
                    delete Skill;
                    class GVAR(training) {
                        value = 0;
                        control = "Combo";
                        displayName = CSTRING(Eden_Training_DisplayName);
                        tooltip = CSTRING(Eden_Training_Description);
                        property = QGVAR(training);
                        expression = "_this setVariable ['%s', _value, true];";
                        typeName = "STRING";
                        wikiType = "[[String]]";
                        defaultValue = "'conscripts'";
                        condition = "objectBrain";
                        class values {
                            class militia {name = CSTRING(Module_GenSoldiers_Training_Militia_DisplayName); value = "militia"; default = 0;};
                            class guards {name = CSTRING(Module_GenSoldiers_Training_Guards_DisplayName); value = "guards"; default = 0;};
                            class conscripts {name = CSTRING(Module_GenSoldiers_Training_Conscripts_DisplayName); value = "conscripts"; default = 1;};
                            class professional {name = CSTRING(Module_GenSoldiers_Training_Professional_DisplayName); value = "professional"; default = 0;};
                            class elite {name = CSTRING(Module_GenSoldiers_Training_Elite_DisplayName); value = "elite"; default = 0;};
                        };
                    };
                };
            };
            class StateSpecial {
                class Attributes {
                    class GVAR(forceUpStance) {
                        property = QGVAR(forceUpStance);
                        control = "CheckboxNumber";
                        displayName = CSTRING(ObjectAttribute_StateSpecial_ForceUpStance_DisplayName);
                        tooltip = CSTRING(ObjectAttribute_StateSpecial_ForceUpStance_Description);
                        expression = "_this setVariable ['%s', _value, true];";
                        condition = "objectBrain";
                        defaultValue = 0;
                    };
                    class GVAR(forceMidStance) {
                        property = QGVAR(forceMidStance);
                        control = "CheckboxNumber";
                        displayName = CSTRING(ObjectAttribute_StateSpecial_ForceMidStance_DisplayName);
                        tooltip = CSTRING(ObjectAttribute_StateSpecial_ForceMidStance_Description);
                        expression = "_this setVariable ['%s', _value, true];";
                        condition = "objectBrain";
                        defaultValue = 0;
                    };
                    class GVAR(forceDownStance) {
                        property = QGVAR(forceDownStance);
                        control = "CheckboxNumber";
                        displayName = CSTRING(ObjectAttribute_StateSpecial_ForceDownStance_DisplayName);
                        tooltip = CSTRING(ObjectAttribute_StateSpecial_ForceDownStance_Description);
                        expression = "_this setVariable ['%s', _value, true];";
                        condition = "objectBrain";
                        defaultValue = 0;
                    };
                    class GVAR(forceFlashlightOn) {
                        property = QGVAR(forceFlashlightOn);
                        control = "CheckboxNumber";
                        displayName = CSTRING(ObjectAttribute_StateSpecial_ForceFlashlightOn_DisplayName);
                        tooltip = CSTRING(ObjectAttribute_StateSpecial_ForceFlashlightOn_Description);
                        expression = "_this setVariable ['%s', _value, true];";
                        condition = "objectBrain";
                        defaultValue = 0;
                    };
                };
            };
            class Control {
                class Attributes {
                    class GVAR(characterDesc) {
                        value = 0;
                        control = "EditMulti5";
                        displayName = CSTRING(ObjectAttribute_Control_CharacterDesc_DisplayName);
                        tooltip = CSTRING(ObjectAttribute_Control_CharacterDesc_Description);
                        property = QGVAR(characterDesc);
                        defaultValue = "''";
                        expression = "_this setVariable ['%s', _value, true];";
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
                        expression = "_this setVariable ['%s', _value, true];";
                        typeName = "STRING";
                        condition = "objectBrain";
                        wikiType = "[[String]]";
                        defaultValue = "'always'";
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
