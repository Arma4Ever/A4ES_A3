class GVAR(ambientAnimals): GVAR(base) {
    scope = 2;
    author = "Krzyciu";
    displayName = CSTRING(ambientAnimals_displayName);
    icon = QPATHTOF(modules\ambientAnimals\data\icon.paa);
    category = QGVAR(ambient);
    function = QFUNC(ambientAnimals_module);
    canSetArea = 1;
    canSetAreaShape = 1;
    class AttributeValues {
        size3[] = {25, 25, -1};
        isRectangle = 0;
    };

        class Attributes: AttributesBase {
            class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
            class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

            class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
                displayName = CSTRING(ambientFlyby_Attributes_baseSettingsSubCategory);
                property = QGVAR(baseSettingsSubCategory);
            };
            class GVAR(classListMode): GVAR(dynamicCombo) {
                displayName = CSTRING(ambientFlyby_Attributes_classListMode);
                tooltip = CSTRING(ambientFlyby_Attributes_classListMode_Tooltip);
                property = QGVAR(classListMode);
                typeName = "NUMBER";
                defaultValue = "0";
                GVAR(observeValue) = 1;
                class values {
                    class random {
                        name = CSTRING(ambientFlyby_Attributes_classListMode_random);
                        tooltip = CSTRING(ambientFlyby_Attributes_classListMode_random_Desc)
                        value = 0;
                        default = 1;
                    };
                    class strict {
                        name = CSTRING(ambientFlyby_Attributes_classListMode_strict);
                        value = 1;
                        tooltip = CSTRING(ambientFlyby_Attributes_classListMode_strict_Desc)
                    };
                };
            };
            class GVAR(animalsCount): GVAR(dynamicSlider) {
                displayName = CSTRING(ambientFlyby_animalsCount);
                tooltip = CSTRING(ambientFlyby_animalsCount_Tooltip);
                property = QGVAR(animalsCount);
                defaultValue = "3";
                typeName = "NUMBER";
                GVAR(range[]) = {1, 20};
                GVAR(valueUnit) = "";
                GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(classListMode)) isEqualTo 0);
            };
            class GVAR(classList): Default {
                displayName = CSTRING(ambientFlyby_Attributes_classList);
                tooltip = CSTRING(ambientFlyby_Attributes_classList_Tooltip);
                control = QGVAR(dynamicClassSelect);
                property = QGVAR(classList);
                typeName = "STRING";
                defaultValue = '[]';
                GVAR(assetsTypes[]) = {"Plane"};
                GVAR(onValuesChanged) = QFUNC(dynamicClassSelect_updateUI);
            };

            class GVAR(moduleDescription): GVAR(moduleDescription) {};
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {
            shortDescription = CSTRING(ambientFlyby_shortDescription);
            description = CSTRING(ambientFlyby_description);
            positionInfo = CSTRING(ambientFlyby_positionInfo);
            //schema = QPATHTOF(data\schema_placeholder.paa);
        };
    };
