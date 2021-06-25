class GVAR(deleteMarker): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(deleteMarker_displayName);
    icon = QPATHTOF(modules\deleteMarker\data\icon.paa);
    category = QGVAR(markers);
    function = QFUNC(deleteMarker_module);
    GVAR(validator) = QFUNC(deleteMarker_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
        #include "\z\a3cs\addons\modules\includes\moduleActivationAttributes.hpp"

        #define MODULE_DELETEMARKER
        #include "\z\a3cs\addons\modules\includes\moduleDeleteMarkerAttributes.hpp"

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(deleteMarker_shortDescription);
    };
};
