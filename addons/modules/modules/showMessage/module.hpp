class GVAR(showMessage): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(showMessage_displayName);
    icon = "\a3\3den\data\cfgwaypoints\talk_ca.paa";
    category = QGVAR(effects);
    function = QFUNC(showMessage_module);
    GVAR(validator) = QFUNC(showMessage_validate);
    canSetArea = 1;
    canSetAreaShape = 1;
    class AttributeValues {
        size3[] = {5, 5, -1};
        isRectangle = 0;
    };

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
        #include "\z\a4es\addons\modules\includes\moduleActivationAttributes.hpp"

        #define MODULE_SHOWMESSAGE
        #include "\z\a4es\addons\modules\includes\moduleShowMessageAttributes.hpp"

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(showMessage_shortDescription);
    };
};
