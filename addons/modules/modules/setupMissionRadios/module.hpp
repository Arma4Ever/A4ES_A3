class GVAR(setupMissionRadios): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(setupMissionRadios_displayName);
    //icon = "";
    category = QGVAR(radio);
    function = QFUNC(setupMissionRadios_module);
    functionPriority = 1;

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // attrs

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(setupMissionRadios_shortDescription);
    };
};
