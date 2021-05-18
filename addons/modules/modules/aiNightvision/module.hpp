class GVAR(aiNightvision): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(aiNightvision_displayName);
    icon = "\a3\3den\data\displays\display3den\panelright\modegroups_ca.paa";
    category = QGVAR(AI);
    function = QFUNC(aiNightvision_module);
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(aiNightvision_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(className): GVAR(dynamicCombo) {
            displayName = CSTRING(aiNightvision_Attributes_className);
            tooltip = CSTRING(aiNightvision_Attributes_className_Tooltip);
            property = QGVAR(className);
            typeName = "STRING";
            defaultValue = QUOTE(QQEGVAR(ai,NVGoggles));
            GVAR(insertValues) = QFUNC(aiNightvision_className_insertValues);
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(aiNightvision_shortDescription);
        description = "";
    };
};
