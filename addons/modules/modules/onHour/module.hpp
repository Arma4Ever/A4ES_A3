class GVAR(onHour): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(onHour_displayName);
    icon = "\a3\modules_f_curator\data\portraitskiptime_ca.paa";
    category = QGVAR(events);
    function = QFUNC(onHour_module);
    functionPriority = 5;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(onHour_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
        #define MODULE_ACTIVATOR_CONTROL QGVAR(dynamicToolboxActivationModeMissionStart)
        #define MODULE_ACTIVATOR_DEFAULT_VALUE QUOTE(-1)
        #include "\z\a3cs\addons\modules\includes\moduleActivationAttributes.hpp"

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(onHour_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };

        class GVAR(hour): GVAR(dynamicCombo) {
            displayName = CSTRING(onHour_Attributes_hour);
            tooltip = CSTRING(onHour_Attributes_hour_tooltip);
            property = QGVAR(hour);
            typeName = "NUMBER";
            defaultValue = "'0'";
            GVAR(insertValues) = QFUNC(onHour_hour_insertValues);
            ATTRIBUTE_LOCAL;

            class values {
                class hour_0 {
                    name = "00";
                    value = 0;
                    default = 1;
                };
            };
        };

        class GVAR(minute): GVAR(dynamicCombo) {
            displayName = CSTRING(onHour_Attributes_minute);
            tooltip = CSTRING(onHour_Attributes_minute_tooltip);
            property = QGVAR(minute);
            typeName = "NUMBER";
            defaultValue = "'0'";
            GVAR(insertValues) = QFUNC(onHour_minute_insertValues);
            ATTRIBUTE_LOCAL;

            class values {
                class hour_0 {
                    name = "00";
                    value = 0;
                    default = 1;
                };
            };
        };

        #include "\z\a3cs\addons\modules\includes\moduleChangeTaskStateAttributes.hpp"
        #include "\z\a3cs\addons\modules\includes\modulePlaySoundAttributes.hpp"
        #include "\z\a3cs\addons\modules\includes\moduleSetLogicFlagValueAttributes.hpp"
        #include "\z\a3cs\addons\modules\includes\moduleShowMessageAttributes.hpp"
        #include "\z\a3cs\addons\modules\includes\moduleShowMarkerAttributes.hpp"
        #include "\z\a3cs\addons\modules\includes\moduleDeleteMarkerAttributes.hpp"

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
            GVAR(description) = CSTRING(onHour_Attributes_scriptHandler_desc);
            property = QGVAR(scriptHandler);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addScriptHandler)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(onHour_shortDescription);
    };
};
