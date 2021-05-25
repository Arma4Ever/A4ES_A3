class GVAR(setTaskState): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(setTaskState_displayName);
    icon = "\a3\Modules_F\Data\iconTaskSetState_ca.paa";
    category = QGVAR(tasks);
    function = QFUNC(setTaskState_module);
    functionPriority = 1;
    isTriggerActivated = 1;
    GVAR(validator) = QFUNC(setTaskState_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
        #define MODULE_ACTIVATOR_CONTROL QGVAR(dynamicToolboxActivationModeNoProxmity)
        #define MODULE_ACTIVATOR_DEFAULT_VALUE QUOTE(1)
        #include "\z\a3cs\addons\modules\includes\moduleActivationAttributes.hpp"

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(setTaskState_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };

        class GVAR(task): GVAR(dynamicCombo) {
            displayName = CSTRING(setTaskState_Attributes_task);
            tooltip = CSTRING(setTaskState_Attributes_task_tooltip);
            property = QGVAR(task);
            typeName = "STRING";
            defaultValue = "''";
            GVAR(insertValues) = QFUNC(setTaskState_task_insertValues);
        };

        class GVAR(state): GVAR(dynamicToolboxTaskState) {
            displayName = CSTRING(setTaskState_Attributes_state);
            tooltip = CSTRING(setTaskState_Attributes_state_tooltip);
            property = QGVAR(state);
            defaultValue = "0";
        };

        class GVAR(showNotification): GVAR(dynamicCheckbox) {
            displayName = CSTRING(setTaskState_Attributes_showNotification);
            tooltip = CSTRING(setTaskState_Attributes_showNotification_tooltip);
            property = QGVAR(showNotification);
            GVAR(observeValue) = 0;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(setTaskState_shortDescription);
        //schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
