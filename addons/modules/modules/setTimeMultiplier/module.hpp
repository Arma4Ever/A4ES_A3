class GVAR(setTimeMultiplier): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(setTimeMultiplier_displayName);
    icon = "\a3\modules_f_curator\data\portraittimeacceleration_ca.paa";
    category = QGVAR(effects);
    function = QFUNC(setTimeMultiplier_module);
    functionPriority = 2;
    GVAR(validator) = QFUNC(setTimeMultiplier_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
        #define MODULE_ACTIVATOR_CONTROL QGVAR(dynamicToolboxActivationModeMissionStart)
        #define MODULE_ACTIVATOR_DEFAULT_VALUE QUOTE(-1)
        #include "\z\a4es\addons\modules\includes\moduleActivationAttributes.hpp"

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(setTimeMultiplier_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };

        class GVAR(timeMultiplier): GVAR(dynamicSlider) {
            displayName = CSTRING(setTimeMultiplier_Attributes_timeMultiplier);
            tooltip = CSTRING(setTimeMultiplier_Attributes_timeMultiplier_Tooltip);
            GVAR(description) = CSTRING(setTimeMultiplier_Attributes_timeMultiplier_desc);
            property = QGVAR(timeMultiplier);
            defaultValue = "1";
            typeName = "NUMBER";
            GVAR(range[]) = {0, 120};
            GVAR(valueUnit) = "x";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(setTimeMultiplier_shortDescription);
    };
};
