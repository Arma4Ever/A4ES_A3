class GVAR(addCuratorModule): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(addCuratorModule_displayName);
    icon = QPATHTOF(modules\addCuratorModule\data\icon.paa);
    category = QGVAR(zeus);
    function = QFUNC(addCuratorModule_module);
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(addCuratorModule_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(category): GVAR(dynamicEdit) {
            displayName = CSTRING(addCuratorModule_Attributes_category);
            tooltip = CSTRING(addCuratorModule_Attributes_category_Tooltip);
            property = QGVAR(category);
        };

        class GVAR(name): GVAR(dynamicEdit) {
            displayName = CSTRING(addCuratorModule_Attributes_name);
            tooltip = CSTRING(addCuratorModule_Attributes_name_Tooltip);
            property = QGVAR(name);
        };

        class GVAR(icon): GVAR(dynamicEdit) {
            displayName = CSTRING(addCuratorModule_Attributes_icon);
            tooltip = CSTRING(addCuratorModule_Attributes_icon_Tooltip);
            property = QGVAR(icon);
            defaultValue = "'\a3\modules_f\data\portraitmodule_ca.paa'";
        };

        class GVAR(function): GVAR(dynamicEdit) {
            displayName = CSTRING(addCuratorModule_Attributes_function);
            tooltip = CSTRING(addCuratorModule_Attributes_function_Tooltip);
            GVAR(description) = CSTRING(addCuratorModule_Attributes_function_Description);
            property = QGVAR(function);
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(addCuratorModule_shortDescription);
        description = "";
        //schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
