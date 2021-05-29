class GVAR(setLogicFlagValue): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(setLogicFlagValue_displayName);
    icon = QPATHTOF(modules\setLogicFlagValue\data\icon.paa);
    category = QGVAR(logicFlags);
    function = QFUNC(setLogicFlagValue_module);
    functionPriority = 1;
    isTriggerActivated = 1;
    GVAR(validator) = QFUNC(setLogicFlagValue_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
        #define MODULE_ACTIVATOR_CONTROL QGVAR(dynamicToolboxActivationModeNoProxmity)
        #define MODULE_ACTIVATOR_DEFAULT_VALUE QUOTE(1)
        #include "\z\a3cs\addons\modules\includes\moduleActivationAttributes.hpp"

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(setLogicFlagValue_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };


        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(setLogicFlagValue_shortDescription);
    };
};
