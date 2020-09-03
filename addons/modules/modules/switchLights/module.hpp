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
            displayName = "Segmenty";
            tooltip = "Segmenty";
            property = QGVAR(segments);
            defaultValue = "false";
        };

        class GVAR(segmentSize): GVAR(dynamicEdit) {
            displayName = "Ilosc lamp na segment";
            tooltip = "Na ile lamp maja sie dzielic segmenty";
            property = QGVAR(segmentSize);
            defaultValue = "1";
            typeName = "NUMBER";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(segments)) isEqualTo true);
        };

        class GVAR(segmentDir): GVAR(dynamicSlider) {
            displayName = "Kierunek wylaczania";
            tooltip = "W ktora strone maja byc wylaczane lampy";
            property = QGVAR(hitAngle);
            defaultValue = "0";
            typeName = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(segments)) isEqualTo true);
            GVAR(range[]) = {0, 359};
            GVAR(valueUnit) = "";
        };

        class GVAR(segmentDelay): GVAR(dynamicEdit) {
            displayName = "Opoznienie miedzy segmentami";
            tooltip = "Czas w sekundach jaki ma uplaynac miedzy wylaczeniem kazdego segmentu";
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
        description = CSTRING(switchLights_description);
        //schema = QPATHTOF(data\schema_placeholder.paa);
        isDisposable = 0;
        deactivationDisablesEffect = 1;
    };
};
