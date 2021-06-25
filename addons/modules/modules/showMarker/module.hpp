class GVAR(showMarker): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(showMarker_displayName);
    icon = QPATHTOF(modules\showMarker\data\icon.paa);
    category = QGVAR(markers);
    function = QFUNC(showMarker_module);
    GVAR(validator) = QFUNC(showMarker_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
        #include "\z\a3cs\addons\modules\includes\moduleActivationAttributes.hpp"

        #define MODULE_SHOWMARKER
        #include "\z\a3cs\addons\modules\includes\moduleShowMarkerAttributes.hpp"

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(showMarker_shortDescription);
    };
};
