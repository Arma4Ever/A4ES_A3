class GVAR(curator): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(curator_displayName);
    icon = "\a3\Modules_F_Curator\Data\portraitCurator_ca.paa";
    category = QGVAR(curator);
    function = QFUNC(curator_module);
    functionPriority = 1;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(curator_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(curator_shortDescription);
        canSyncWith[] = {"<anyUnit>"};
        syncRequired = 1;
        //schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
