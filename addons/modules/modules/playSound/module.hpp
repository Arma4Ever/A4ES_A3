class GVAR(playSound): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(playSound_displayName);
    icon = "\a3\modules_f_curator\data\portraitsound_ca.paa";
    category = QGVAR(effects);
    function = QFUNC(playSound_module);
    functionPriority = 1;
    isTriggerActivated = 1;
    GVAR(validator) = QFUNC(playSound_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
        #define MODULE_ACTIVATOR_CONTROL QGVAR(dynamicToolboxActivationModeMissionStart)
        #define MODULE_ACTIVATOR_DEFAULT_VALUE QUOTE(-1)
        #include "\z\a3cs\addons\modules\includes\moduleActivationAttributes.hpp"

        #define MODULE_PLAYSOUND
        #include "\z\a3cs\addons\modules\includes\modulePlaySoundAttributes.hpp"

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(playSound_shortDescription);
    };
};
