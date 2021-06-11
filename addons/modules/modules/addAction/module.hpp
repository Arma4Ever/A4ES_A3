class GVAR(addAction): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(addAction_displayName);
    icon = QPATHTOF(modules\addAction\data\icon.paa);
    category = QGVAR(actions);
    function = QFUNC(addAction_module);
    GVAR(validator) = QFUNC(addAction_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
        #define MODULE_ACTIVATOR_CONTROL QGVAR(dynamicToolboxActivationModeMissionStart)
        #define MODULE_ACTIVATOR_DEFAULT_VALUE QUOTE(-1)
        #include "\z\a3cs\addons\modules\includes\moduleActivationAttributes.hpp"

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(addAction_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };

        // Read only action ID, auto generated in validator
        class GVAR(id): GVAR(dynamicEdit) {
            displayName = CSTRING(addAction_Attributes_id);
            tooltip = CSTRING(addAction_Attributes_id_tooltip);
            property = QGVAR(id);
            defaultValue = "''";
            unique = 1;
            GVAR(description) = CSTRING(addAction_Attributes_id_desc);
            GVAR(disabled) = 1;
        };

        class GVAR(type): GVAR(dynamicToolboxActionType) {
            displayName = CSTRING(addAction_Attributes_type);
            tooltip = CSTRING(addAction_Attributes_type_tooltip);
            property = QGVAR(type);
            typeName = "NUMBER";
        };

        class GVAR(owner): GVAR(dynamicOwnerNoSyncToolbox) {
            displayName = CSTRING(addAction_Attributes_owner);
            tooltip = CSTRING(addAction_Attributes_owner_tooltip);
            property = QGVAR(owner);
            typeName = "NUMBER";
            defaultValue = "0";
        };

        class GVAR(title): GVAR(dynamicEdit) {
            displayName = CSTRING(addAction_Attributes_title);
            tooltip = CSTRING(addAction_Attributes_title_tooltip);
            property = QGVAR(title);
        };

        class GVAR(icon): GVAR(dynamicEdit) {
            displayName = CSTRING(addAction_Attributes_icon);
            tooltip = CSTRING(addAction_Attributes_icon_tooltip);
            property = QGVAR(icon);
        };

        class GVAR(conditionType): GVAR(dynamicToolboxActionConditionType) {
            displayName = CSTRING(addAction_Attributes_conditionType);
            tooltip = CSTRING(addAction_Attributes_conditionType_tooltip);
            property = QGVAR(condition);
            defaultValue = "1";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(conditionLogicFlags): GVAR(dynamicLogicFlagCond) {
            displayName = CSTRING(addAction_Attributes_conditionLogicFlags);
            tooltip = CSTRING(addAction_Attributes_conditionLogicFlags_tooltip);
            property = QGVAR(conditionLogicFlags);
            defaultValue = "'[]'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(conditionType)) isEqualTo 0);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(conditionScript): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(addAction_Attributes_conditionScript);
            tooltip = CSTRING(addAction_Attributes_conditionScript_tooltip);
            GVAR(description) = CSTRING(addAction_Attributes_conditionScript_desc);
            property = QGVAR(conditionScript);
            defaultValue = "'true'";
            typeName = "STRING";
            validate = "condition";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(conditionType)) isEqualTo 1);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(isDisposable): GVAR(dynamicCheckbox) {
            displayName = CSTRING(addAction_Attributes_isDisposable);
            tooltip = CSTRING(addAction_Attributes_isDisposable_tooltip);
            property = QGVAR(isDisposable);
            defaultValue = "true";
            GVAR(observeValue) = 0;
            ATTRIBUTE_LOCAL;
        };

        class GVAR(addScriptHandler): GVAR(dynamicCheckbox) {
            displayName = CSTRING(addAction_Attributes_addScriptHandler);
            tooltip = CSTRING(addAction_Attributes_addScriptHandler_tooltip);
            property = QGVAR(addScriptHandler);
            defaultValue = "false";
        };

        class GVAR(scriptHandler): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(addAction_Attributes_scriptHandler);
            tooltip = CSTRING(addAction_Attributes_scriptHandler_tooltip);
            GVAR(description) = CSTRING(addAction_Attributes_scriptHandler_desc);
            property = QGVAR(scriptHandler);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addScriptHandler)) isEqualTo true);
        };

        class GVAR(addServerScriptHandler): GVAR(dynamicCheckbox) {
            displayName = CSTRING(addAction_Attributes_addServerScriptHandler);
            tooltip = CSTRING(addAction_Attributes_addServerScriptHandler_tooltip);
            property = QGVAR(addServerScriptHandler);
            defaultValue = "false";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(serverScriptHandler): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(addAction_Attributes_serverScriptHandler);
            tooltip = CSTRING(addAction_Attributes_serverScriptHandler_tooltip);
            GVAR(description) = CSTRING(addAction_Attributes_serverScriptHandler_desc);
            property = QGVAR(serverScriptHandler);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addServerScriptHandler)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(progressSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(addAction_Attributes_progressSettingsSubCategory);
            property = QGVAR(progressSettingsSubCategory);
        };

        class GVAR(progress): GVAR(dynamicCheckbox) {
            displayName = CSTRING(addAction_Attributes_progress);
            tooltip = CSTRING(addAction_Attributes_progress_tooltip);
            property = QGVAR(progress);
            defaultValue = "false";
        };

        class GVAR(progressTitle): GVAR(dynamicEdit) {
            displayName = CSTRING(addAction_Attributes_progressTitle);
            tooltip = CSTRING(addAction_Attributes_progressTitle_tooltip);
            property = QGVAR(progressTitle);
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(progress)) isEqualTo true);
        };

        class GVAR(progressTime): GVAR(dynamicEdit) {
            displayName = CSTRING(addAction_Attributes_progressTime);
            tooltip = CSTRING(addAction_Attributes_progressTime_tooltip);
            property = QGVAR(progressTime);
            defaultValue = "5";
            typeName = "NUMBER";
            validate = "number";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(progress)) isEqualTo true);
        };

        class GVAR(addProgressFailedScriptHandler): GVAR(dynamicCheckbox) {
            displayName = CSTRING(addAction_Attributes_addProgressFailedScriptHandler);
            tooltip = CSTRING(addAction_Attributes_addProgressFailedScriptHandler_tooltip);
            property = QGVAR(addProgressFailedScriptHandler);
            defaultValue = "false";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(progress)) isEqualTo true);
        };

        class GVAR(progressFailedScriptHandler): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(addAction_Attributes_progressFailedScriptHandler);
            tooltip = CSTRING(addAction_Attributes_progressFailedScriptHandler_tooltip);
            GVAR(description) = CSTRING(addAction_Attributes_progressFailedScriptHandler_desc);
            property = QGVAR(progressFailedScriptHandler);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE( ((_this getVariable QQGVAR(progress)) isEqualTo true) && {(_this getVariable QQGVAR(addProgressFailedScriptHandler)) isEqualTo true});
        };

        class GVAR(activatorSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(addAction_Attributes_activatorSettingsSubCategory);
            property = QGVAR(activatorSettingsSubCategory);
        };

        #include "\z\a3cs\addons\modules\includes\moduleChangeTaskStateAttributes.hpp"
        #include "\z\a3cs\addons\modules\includes\modulePlaySoundAttributes.hpp"
        #include "\z\a3cs\addons\modules\includes\moduleSetLogicFlagValueAttributes.hpp"

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(addAction_shortDescription);
    };
};
