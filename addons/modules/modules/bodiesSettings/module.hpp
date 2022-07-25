class GVAR(bodiesSettings): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(bodiesSettings_displayName);
    //icon = "";
    category = QGVAR(effects);
    function = QFUNC(bodiesSettings_module);
    functionPriority = 5;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(bodiesSettings_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(systemEnabled): GVAR(dynamicCheckbox) {
            displayName = CSTRING(bodiesSettings_Attributes_systemEnabled);
            tooltip = CSTRING(bodiesSettings_Attributes_systemEnabled_tooltip);
            property = QGVAR(systemEnabled);
            defaultValue = "true";
            GVAR(observeValue) = 0;
            ATTRIBUTE_LOCAL;
        };

        class GVAR(bodiesLimit): GVAR(dynamicEdit) {
            displayName = CSTRING(bodiesSettings_Attributes_bodiesLimit);
            tooltip = CSTRING(bodiesSettings_Attributes_bodiesLimit_Tooltip);
            property = QGVAR(bodiesLimit);
            defaultValue = "100";
            validate = "NUMBER";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(bodiesSettings_shortDescription);
    };
};
