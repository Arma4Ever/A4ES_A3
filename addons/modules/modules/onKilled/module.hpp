class GVAR(onKilled): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(onKilled_displayName);
    icon = QPATHTOF(modules\onKilled\data\icon.paa);
    category = QGVAR(events);
    function = QFUNC(onKilled_module);
    // 30 because ModuleEditTerrainObject has 25 - objectsList
    functionPriority = 30;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(onKilled_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(objectsList): GVAR(dynamicEdit) {
            displayName = CSTRING(onKilled_Attributes_objectsList);
            tooltip = CSTRING(onKilled_Attributes_objectsList_tooltip);
            property = QGVAR(objectsList);
            GVAR(observeValue) = 1;
            GVAR(description) = CSTRING(onKilled_Attributes_objectsList_desc);
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
            GVAR(description) = CSTRING(onKilled_Attributes_scriptHandler_desc);
            property = QGVAR(scriptHandler);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addScriptHandler)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(onKilled_shortDescription);
        canSyncWith[] = {"<anyUnit>", "<anyVehicle>", "<anyObject>"};
        syncRequired = 1;
    };
};
