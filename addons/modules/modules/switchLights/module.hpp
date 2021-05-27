class GVAR(switchLights): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(switchLights_displayName);
    icon = QPATHTOF(modules\switchLights\data\icon.paa);
    category = QGVAR(effects);
    function = QFUNC(switchLights_module);
    functionPriority = 5;
    canSetArea = 1;
    canSetAreaShape = 1;

    class AttributeValues {
        size3[] = {200, 200, -1};
    };

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(segments): GVAR(dynamicCheckbox) {
            displayName = CSTRING(switchLights_Attributes_segments);
            tooltip = CSTRING(switchLights_Attributes_segments_tooltip);
            property = QGVAR(segments);
            defaultValue = "false";
        };

        class GVAR(segmentSize): GVAR(dynamicEdit) {
            displayName = CSTRING(switchLights_Attributes_segmentSize);
            tooltip = CSTRING(switchLights_Attributes_segmentSize_tooltip);
            property = QGVAR(segmentSize);
            defaultValue = "1";
            typeName = "NUMBER";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(segments)) isEqualTo true);
        };

        class GVAR(segmentDir): GVAR(dynamicSlider) {
            displayName = CSTRING(switchLights_Attributes_segmentDir);
            tooltip = CSTRING(switchLights_Attributes_segmentDir_tooltip);
            property = QGVAR(hitAngle);
            defaultValue = "0";
            typeName = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(segments)) isEqualTo true);
            GVAR(range[]) = {0, 359};
            GVAR(valueUnit) = "";
        };

        class GVAR(segmentDelay): GVAR(dynamicEdit) {
            displayName = CSTRING(switchLights_Attributes_segmentDelay);
            tooltip = CSTRING(switchLights_Attributes_segmentDelay_tooltip);
            property = QGVAR(segmentDelay);
            defaultValue = "1";
            typeName = "NUMBER";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(segments)) isEqualTo true);
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(switchLights_shortDescription);
        //schema = QPATHTOF(data\schema_placeholder.paa);
        isDisposable = 0;
        deactivationDisablesEffect = 1;
    };
};
