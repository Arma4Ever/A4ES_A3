class GVAR(setSideDefaultDialogue): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(setSideDefaultDialogue_displayName);
    icon = QPATHTOF(modules\setSideDefaultDialogue\data\icon.paa);
    category = QGVAR(dialogues);
    function = QFUNC(setSideDefaultDialogue_module);
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(setSideDefaultDialogue_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};



        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(setSideDefaultDialogue_shortDescription);
        description = "";
    };
};
