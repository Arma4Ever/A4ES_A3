class GVAR(createLogicFlag): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(createLogicFlag_displayName);
    icon = QPATHTOF(modules\createLogicFlag\data\icon.paa);
    category = QGVAR(logicFlags);
    function = QFUNC(createLogicFlag_module);
    functionPriority = 1;
    isTriggerActivated = 1;
    GVAR(validator) = QFUNC(createLogicFlag_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(createLogicFlag_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };

        // Read only task ID, auto generated in validator
        class GVAR(id): GVAR(dynamicEdit) {
            displayName = CSTRING(createLogicFlag_Attributes_id);
            tooltip = CSTRING(createLogicFlag_Attributes_id_tooltip);
            property = QGVAR(id);
            defaultValue = "''";
            unique = 1;
            GVAR(description) = CSTRING(createLogicFlag_Attributes_id_desc);
            GVAR(disabled) = 1;
        };

        class GVAR(title): GVAR(dynamicEdit) {
            displayName = CSTRING(createTask_Attributes_title);
            tooltip = CSTRING(createTask_Attributes_title_tooltip);
            property = QGVAR(title);
            GVAR(observeValue) = 1;
        };

        class GVAR(initialValue): GVAR(dynamicCombo) {
            displayName = CSTRING(createTask_Attributes_initialValue);
            tooltip = CSTRING(createTask_Attributes_initialValue_tooltip);
            property = QGVAR(initialValue);
            typeName = "STRING";
            defaultValue = "'false'";
            class values {
                class valueTrue {
                    name = CSTRING(generateSoldiers_Attributes_behaviour_patrol);
                    tooltip = CSTRING(generateSoldiers_Attributes_behaviour_patrol_Tooltip);
                    value = 0;
                    default = 1;
                };
                class valueFalse {
                    name = CSTRING(generateSoldiers_Attributes_behaviour_camp);
                    tooltip = CSTRING(generateSoldiers_Attributes_behaviour_camp_Tooltip);
                    value = 1;
                };
            };
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(createTask_shortDescription);
        //schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
