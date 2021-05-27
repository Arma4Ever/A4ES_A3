class GVAR(radioJammer): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(radioJammer_displayName);
    icon = QPATHTOF(modules\radioJammer\data\icon.paa);
    category = QGVAR(radio);
    function = QFUNC(radioJammer_module);
    GVAR(validator) = QFUNC(radioJammer_validate);
    canSetArea = 1;
    canSetAreaShape = 1;
    class AttributeValues {
        size3[] = {25, 25, -1};
        isRectangle = 0;
    };

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(sendingMultiplicator): GVAR(dynamicSliderPercent) {
            displayName = CSTRING(radioJammer_Attributes_sendingMultiplicator);
            tooltip = CSTRING(radioJammer_Attributes_sendingMultiplicator_Tooltip);
            property = QGVAR(sendingMultiplicator);
            defaultValue = "0.25";
        };

        class GVAR(receivingMultiplicator): GVAR(dynamicSliderPercent) {
            displayName = CSTRING(radioJammer_Attributes_receivingMultiplicator);
            tooltip = CSTRING(radioJammer_Attributes_receivingMultiplicator_Tooltip);
            property = QGVAR(receivingMultiplicator);
            GVAR(description) = CSTRING(radioJammer_Multiplicators_Desc);
            defaultValue = "0.25";
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(radioJammer_shortDescription);
        description = "";
    };
};
