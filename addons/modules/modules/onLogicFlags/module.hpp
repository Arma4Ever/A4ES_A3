class GVAR(onLogicFlags): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(onLogicFlags_displayName);
    icon = QPATHTOF(modules\onLogicFlags\data\icon.paa);
    category = QGVAR(events);
    function = QFUNC(onLogicFlags_module);
    functionPriority = 2;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(onLogicFlags_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(onLogicFlags_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };

        class GVAR(activationFlags): GVAR(dynamicLogicFlagCond) {
            displayName = CSTRING(Attributes_activationFlags);
            tooltip = CSTRING(Attributes_activationFlags_Tooltip);
            property = QGVAR(activationFlags);
            defaultValue = "'[]'";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(activationDelay): GVAR(dynamicCheckbox) {
            displayName = CSTRING(Attributes_activationDelay);
            tooltip = CSTRING(Attributes_activationDelay_tooltip);
            property = QGVAR(activationDelay);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(activationDelayTime): GVAR(dynamicEdit) {
            displayName = CSTRING(Attributes_activationDelayTime);
            tooltip = CSTRING(Attributes_activationDelayTime_Tooltip);
            property = QGVAR(activationDelayTime);
            defaultValue = "'0'";
            typeName = "NUMBER";
            validate = "number";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(activationDelay)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        #include "\z\a3cs\addons\modules\includes\moduleChangeTaskStateAttributes.hpp"
        #include "\z\a3cs\addons\modules\includes\modulePlaySoundAttributes.hpp"
        #include "\z\a3cs\addons\modules\includes\moduleSetLogicFlagValueAttributes.hpp"

        class GVAR(scriptHandlerSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(Attributes_scriptHandlerSettingsSubCategory);
            property = QGVAR(scriptHandlerSettingsSubCategory);
        };

        class GVAR(addScriptHandler): GVAR(dynamicCheckbox) {
            displayName = CSTRING(Attributes_addScriptHandler);
            tooltip = CSTRING(Attributes_addScriptHandler_tooltip);
            property = QGVAR(addScriptHandler);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(scriptHandler): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(Attributes_scriptHandler);
            tooltip = CSTRING(Attributes_scriptHandler_tooltip);
            GVAR(description) = CSTRING(onLogicFlags_Attributes_scriptHandler_desc);
            property = QGVAR(scriptHandler);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addScriptHandler)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(onLogicFlags_shortDescription);
    };
};
