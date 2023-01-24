class GVAR(setUnitDialogue): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(setUnitDialogue_displayName);
    icon = QPATHTOF(modules\setUnitDialogue\data\icon.paa);
    category = QGVAR(dialogues);
    function = QFUNC(setUnitDialogue_module);
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(setUnitDialogue_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};



        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(setUnitDialogue_shortDescription);
        description = "";
    };
};
