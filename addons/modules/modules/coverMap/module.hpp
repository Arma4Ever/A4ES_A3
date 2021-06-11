class GVAR(coverMap): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(coverMap_displayName);
    icon = QPATHTOF(modules\coverMap\data\icon.paa);
    category = QGVAR(map);
    function = QFUNC(coverMap_module);
    functionPriority = 5;
    canSetArea = 1;
    class AttributeValues {
        size3[] = {200, 200, -1};
        isRectangle = 1;
    };

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(coverOpacity): GVAR(dynamicSliderPercent) {
            displayName = CSTRING(coverMap_Attributes_coverOpacity);
            tooltip = CSTRING(coverMap_Attributes_coverOpacity);
            property = QGVAR(coverOpacity);
            defaultValue = "1";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(coverColor): GVAR(dynamicCombo) {
            displayName = CSTRING(coverMap_Attributes_coverColor);
            tooltip = CSTRING(coverMap_Attributes_coverColor_Tooltip);
            property = QGVAR(coverColor);
            typeName = "NUMBER";
            defaultValue = "0";
            ATTRIBUTE_LOCAL;
            class values {
                class black {
                    name = CSTRING(coverMap_Attributes_coverColor_black);
                    value = 0;
                    default = 1;
                };
                class white {
                    name = CSTRING(coverMap_Attributes_coverColor_white);
                    value = 1;
                };
            };
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(coverMap_shortDescription);
        description = CSTRING(coverMap_description);
        //schema = QPATHTOF(data\schema_placeholder.paa);
        isDisposable = 0;
        deactivationDisablesEffect = 1;
    };
};
