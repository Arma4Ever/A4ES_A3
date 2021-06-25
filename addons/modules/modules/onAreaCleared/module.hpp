class GVAR(onAreaCleared): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(onAreaCleared_displayName);
    icon = QPATHTOF(modules\onAreaCleared\data\icon.paa);
    category = QGVAR(events);
    function = QFUNC(onAreaCleared_module);
    functionPriority = 2;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(onAreaCleared_validate);
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
            displayName = CSTRING(onAreaCleared_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };

        class GVAR(side): GVAR(dynamicToolboxSideFull) {
            displayName = CSTRING(onAreaCleared_Attributes_side);
            tooltip = CSTRING(onAreaCleared_Attributes_side_Tooltip);
            property = QGVAR(side);
            defaultValue = "1";
            typeName = "NUMBER";
            ATTRIBUTE_LOCAL;
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
            GVAR(description) = CSTRING(onAreaCleared_Attributes_scriptHandler_desc);
            property = QGVAR(scriptHandler);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addScriptHandler)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(onAreaCleared_shortDescription);
        canSyncWith[] = {"<anyLogic>"};
        syncRequired = 3;
    };
};
