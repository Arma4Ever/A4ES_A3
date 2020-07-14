class GVAR(nameRadioChannels): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(nameRadioChannels_displayName);
    //icon = "";
    category = QGVAR(radio);
    function = QFUNC(nameRadioChannels_module);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // attrs

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(nameRadioChannels_shortDescription);
    };
};
