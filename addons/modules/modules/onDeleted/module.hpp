class GVAR(onDeleted): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(onDeleted_displayName);
    icon = QPATHTOF(modules\onDeleted\data\icon.paa);
    category = QGVAR(events);
    function = QFUNC(onDeleted_module);
    functionPriority = 1;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(onDeleted_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        #include "\z\a3cs\addons\modules\includes\moduleChangeTaskStateAttributes.hpp"

        class GVAR(scriptHandlerSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(Attributes_scriptHandlerSettingsSubCategory);
            property = QGVAR(scriptHandlerSettingsSubCategory);
        };

        class GVAR(addScriptHandler): GVAR(dynamicCheckbox) {
            displayName = CSTRING(Attributes_addScriptHandler);
            tooltip = CSTRING(Attributes_addScriptHandler_tooltip);
            property = QGVAR(addScriptHandler);
        };

        class GVAR(scriptHandler): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(Attributes_scriptHandler);
            tooltip = CSTRING(Attributes_scriptHandler_tooltip);
            GVAR(description) = CSTRING(onDeleted_Attributes_scriptHandler_desc);
            property = QGVAR(scriptHandler);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addScriptHandler)) isEqualTo true);
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(onDeleted_shortDescription);
        canSyncWith[] = {"<anyUnit>", "<anyVehicle>", "<anyObject>"};
        syncRequired = 1;
    };
};
