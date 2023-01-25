class GVAR(ambientFlyby): GVAR(base) {
    scope = 2;
    author = "Krzyciu, SzwedzikPL";
    displayName = CSTRING(ambientFlyby_displayName);
    icon = QPATHTOF(modules\ambientFlyby\data\icon.paa);
    category = QGVAR(ambient);
    function = QFUNC(ambientFlyby_module);
    class AttributeValues {
        size3[] = {25, 25, -1};
        isRectangle = 0;
    };

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
        #include "\z\a4es\addons\modules\includes\moduleActivationAttributes.hpp"

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(ambientFlyby_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };
        class GVAR(mode): Default {
            displayName = CSTRING(ambientFlyby_Attributes_mode);
            tooltip = CSTRING(ambientFlyby_Attributes_mode_Tooltip);
            control = QGVAR(ambientFlyby_mode);
            property = QGVAR(mode);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(observeValue) = 1;
            ATTRIBUTE_LOCAL;
        };
        class GVAR(classListMode): GVAR(dynamicCombo) {
            displayName = CSTRING(ambientFlyby_Attributes_classListMode);
            tooltip = CSTRING(ambientFlyby_Attributes_classListMode_Tooltip);
            property = QGVAR(classListMode);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(observeValue) = 1;
            ATTRIBUTE_LOCAL;
            class values {
                class random {
                    name = CSTRING(ambientFlyby_Attributes_classListMode_random);
                    tooltip = CSTRING(ambientFlyby_Attributes_classListMode_random_Desc);
                    value = 0;
                    default = 1;
                };
                class strict {
                    name = CSTRING(ambientFlyby_Attributes_classListMode_strict);
                    value = 1;
                    tooltip = CSTRING(ambientFlyby_Attributes_classListMode_strict_Desc);
                };
            };
        };
        class GVAR(planesCount): GVAR(dynamicSlider) {
            displayName = CSTRING(ambientFlyby_Attributes_planesCount);
            tooltip = CSTRING(ambientFlyby_Attributes_planesCount_Tooltip);
            property = QGVAR(planesCount);
            defaultValue = "1";
            typeName = "NUMBER";
            GVAR(range[]) = {1, 20};
            GVAR(valueUnit) = "";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(classListMode)) isEqualTo 0);
            ATTRIBUTE_LOCAL;
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
            ATTRIBUTE_LOCAL;
        };
        class GVAR(flightSpeed): GVAR(dynamicSlider) {
            displayName = CSTRING(ambientFlyby_Attributes_flightSpeed);
            tooltip = CSTRING(ambientFlyby_Attributes_flightSpeed_Tooltip);
            property = QGVAR(flightSpeed);
            defaultValue = "80";
            typeName = "NUMBER";
            GVAR(range[]) = {20, 300};
            GVAR(valueUnit) = "km/h";
            ATTRIBUTE_LOCAL;
        };
        class GVAR(flybyShape): GVAR(dynamicCombo) {
            displayName = CSTRING(ambientFlyby_Shape);
            tooltip = CSTRING(ambientFlyby_Shape_Tooltip);
            property = QGVAR(flybyShape);
            typeName = "NUMBER";
            defaultValue = "1";
            ATTRIBUTE_LOCAL;
            class values {
                class diamond {
                    name = CSTRING(ambientFlyby_Shape_Diamond);
                    value = 0;
                };
                class wedge {
                    name = CSTRING(ambientFlyby_Shape__Wedge);
                    value = 1;
                };
                class Echelon {
                    name = CSTRING(ambientFlyby_Shape_Echelon);
                    value = 2;
                };
            };
        };
        class GVAR(endPosAmb): GVAR(dynamicEdit) {
            displayName = CSTRING(ambientFlyby_Attributes_endMovePosition);
            tooltip = CSTRING(ambientFlyby_Attributes_endMovePosition_Tooltip);
            property = QGVAR(endPosAmb);
            defaultValue = "''";
            validate = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(mode)) isEqualTo 0);
            ATTRIBUTE_LOCAL;
        };
        class GVAR(flybyDirection): GVAR(dynamicCombo) {
            displayName = CSTRING(ambientFlyby_fromDirection);
            tooltip = CSTRING(ambientFlyby_fromDirection_Tooltip);
            property = QGVAR(fromDirection);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(observeValue) = 1;
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(mode)) isEqualTo 1);
            ATTRIBUTE_LOCAL;
            class values {
                class north {
                    name = CSTRING(ambientFlyby_Directions_N);
                    value = 0;
                    default = 1;
                };
                class northEast {
                    name = CSTRING(ambientFlyby_Directions_NE);
                    value = 1;
                };
                class east {
                    name = CSTRING(ambientFlyby_Directions_E);
                    value = 2;
                };
                class southEast {
                    name = CSTRING(ambientFlyby_Directions_SE);
                    value = 3;
                };
                class south {
                    name = CSTRING(ambientFlyby_Directions_S);
                    value = 4;
                };
                class southWest {
                    name = CSTRING(ambientFlyby_Directions_SW);
                    value = 5;
                };
                class West {
                    name = CSTRING(ambientFlyby_Directions_W);
                    value = 6;
                };
                class northWest {
                    name = CSTRING(ambientFlyby_Directions_NW);
                    value = 7;
                };
            };
        };
        class GVAR(distanceTo): GVAR(dynamicSlider) {
            displayName = CSTRING(ambientFlyby_Attributes_Distance);
            tooltip = CSTRING(ambientFlyby_Attributes_Distance_Tooltip);
            property = QGVAR(distanceTo);
            defaultValue = "2000";
            typeName = "NUMBER";
            GVAR(range[]) = {200, 20000};
            GVAR(valueUnit) = "m";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(mode)) isEqualTo 1);
            ATTRIBUTE_LOCAL;
        };
        class GVAR(height): GVAR(dynamicSlider) {
            displayName = CSTRING(ambientFlyby_Attributes_Height);
            tooltip = CSTRING(ambientFlyby_Attributes_Height_Tooltip);
            property = QGVAR(height);
            defaultValue = "50";
            typeName = "NUMBER";
            GVAR(range[]) = {50, 5000};
            GVAR(valueUnit) = "m";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(mode)) isEqualTo 1);
            ATTRIBUTE_LOCAL;
        };
        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(ambientFlyby_shortDescription);
        description = "";
        positionInfo = CSTRING(ambientFlyby_positionInfo);
        //schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
