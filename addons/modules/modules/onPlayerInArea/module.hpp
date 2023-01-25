class GVAR(onPlayerInArea): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(onPlayerInArea_displayName);
    icon = QPATHTOF(modules\onPlayerInArea\data\icon.paa);
    category = QGVAR(events);
    function = QFUNC(onPlayerInArea_module);
    functionPriority = 2;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(onPlayerInArea_validate);
    canSetArea = 1;
    canSetAreaShape = 1;
    class AttributeValues {
        size3[] = {25, 25, -1};
        isRectangle = 0;
    };

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(onPlayerInArea_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };

        class GVAR(activationIgnoreHelicopters): GVAR(dynamicCheckbox) {
            displayName = CSTRING(Attributes_activationIgnoreHelicopters);
            tooltip = CSTRING(Attributes_activationIgnoreHelicopters_tooltip);
            property = QGVAR(activationIgnoreHelicopters);
            GVAR(observeValue) = 0;
            ATTRIBUTE_LOCAL;
        };

        class GVAR(activationIgnorePlanes): GVAR(dynamicCheckbox) {
            displayName = CSTRING(Attributes_activationIgnorePlanes);
            tooltip = CSTRING(Attributes_activationIgnorePlanes_tooltip);
            property = QGVAR(activationIgnorePlanes);
            GVAR(observeValue) = 0;
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

        #include "\z\a4es\addons\modules\includes\moduleChangeTaskStateAttributes.hpp"
        #include "\z\a4es\addons\modules\includes\modulePlaySoundAttributes.hpp"
        #include "\z\a4es\addons\modules\includes\moduleSetLogicFlagValueAttributes.hpp"
        #include "\z\a4es\addons\modules\includes\moduleShowMessageAttributes.hpp"
        #include "\z\a4es\addons\modules\includes\moduleShowMarkerAttributes.hpp"
        #include "\z\a4es\addons\modules\includes\moduleDeleteMarkerAttributes.hpp"

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
            GVAR(description) = CSTRING(onPlayerInArea_Attributes_scriptHandler_desc);
            property = QGVAR(scriptHandler);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addScriptHandler)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(onPlayerInArea_shortDescription);
    };
};
