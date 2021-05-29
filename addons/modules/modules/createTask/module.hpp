class GVAR(createTask): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(createTask_displayName);
    icon = "\a3\Modules_F\Data\iconTaskCreate_ca.paa";
    category = QGVAR(tasks);
    function = QFUNC(createTask_module);
    functionPriority = 1;
    isTriggerActivated = 1;
    GVAR(validator) = QFUNC(createTask_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
        #define MODULE_ACTIVATOR_CONTROL QGVAR(dynamicToolboxActivationModeMissionStart)
        #define MODULE_ACTIVATOR_DEFAULT_VALUE QUOTE(-1)
        #include "\z\a3cs\addons\modules\includes\moduleActivationAttributes.hpp"

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(createTask_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };

        // Read only task ID, auto generated in validator
        class GVAR(id): GVAR(dynamicEdit) {
            displayName = CSTRING(createTask_Attributes_id);
            tooltip = CSTRING(createTask_Attributes_id_tooltip);
            property = QGVAR(id);
            defaultValue = "''";
            unique = 1;
            GVAR(description) = CSTRING(createTask_Attributes_id_desc);
            GVAR(disabled) = 1;
        };

        class GVAR(owner): GVAR(dynamicOwnerToolbox) {
            displayName = CSTRING(createTask_Attributes_owner);
            tooltip = CSTRING(createTask_Attributes_owner_tooltip);
            property = QGVAR(owner);
            typeName = "NUMBER";
            defaultValue = "0";
        };

        class GVAR(parent): GVAR(dynamicCombo) {
            displayName = CSTRING(createTask_Attributes_parent);
            tooltip = CSTRING(createTask_Attributes_parent_tooltip);
            property = QGVAR(parent);
            typeName = "STRING";
            defaultValue = "''";
            GVAR(insertValues) = QFUNC(createTask_parent_insertValues);

            class values {
                class none {
                    name = CSTRING(createTask_Attributes_parent_none);
                    tooltip = CSTRING(createTask_Attributes_parent_none_tooltip);
                    value = "";
                    default = 1;
                };
            };
        };

        class GVAR(title): GVAR(dynamicEdit) {
            displayName = CSTRING(createTask_Attributes_title);
            tooltip = CSTRING(createTask_Attributes_title_tooltip);
            property = QGVAR(title);
            GVAR(observeValue) = 1;
        };

        class GVAR(description): GVAR(dynamicEditMulti5) {
            displayName = CSTRING(createTask_Attributes_description);
            tooltip = CSTRING(createTask_Attributes_description_tooltip);
            property = QGVAR(description);
        };

        class GVAR(type): GVAR(dynamicCombo) {
            displayName = CSTRING(createTask_Attributes_type);
            tooltip = CSTRING(createTask_Attributes_type_tooltip);
            property = QGVAR(type);
            typeName = "STRING";
            defaultValue = "'default'";
            GVAR(insertValues) = QFUNC(createTask_type_insertValues);
        };

        class GVAR(state): GVAR(dynamicToolboxTaskState) {
            displayName = CSTRING(createTask_Attributes_state);
            tooltip = CSTRING(createTask_Attributes_state_tooltip);
            property = QGVAR(state);
            defaultValue = "0";
        };

        class GVAR(showPos): GVAR(dynamicCheckbox) {
            displayName = CSTRING(createTask_Attributes_showPos);
            tooltip = CSTRING(createTask_Attributes_showPos_tooltip);
            property = QGVAR(showPos);
            defaultValue = "true";
            GVAR(observeValue) = 0;
        };

        class GVAR(showNotification): GVAR(dynamicCheckbox) {
            displayName = CSTRING(createTask_Attributes_showNotification);
            tooltip = CSTRING(createTask_Attributes_showNotification_tooltip);
            property = QGVAR(showNotification);
            defaultValue = "true";
            GVAR(observeValue) = 0;
            GVAR(description) = CSTRING(createTask_Attributes_showNotification_desc);
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(createTask_shortDescription);
        //schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
