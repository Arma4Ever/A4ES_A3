class GVAR(fortifySettings): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(fortifySettings_displayName);
    //icon = "";
    category = QGVAR(fortify);
    function = QFUNC(fortifySettings_module);
    functionPriority = 5;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(fortifySettings_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(side): GVAR(dynamicToolboxSideFull) {
            displayName = CSTRING(fortifySettings_Attributes_side);
            tooltip = CSTRING(fortifySettings_Attributes_side_Tooltip);
            property = QGVAR(side);
            defaultValue = "0";
            typeName = "NUMBER";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(budget): GVAR(dynamicEdit) {
            displayName = CSTRING(fortifySettings_Attributes_budget);
            tooltip = CSTRING(fortifySettings_Attributes_budget_Tooltip);
            property = QGVAR(budget);
            defaultValue = "-1";
            validate = "NUMBER";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(fortifySettings_shortDescription);
    };
};
