class GVAR(registerArtilleryUnits): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(registerArtilleryUnits_displayName);
    icon = QPATHTOF(modules\registerArtilleryUnits\data\icon.paa);
    category = QGVAR(AI);
    function = QFUNC(registerArtilleryUnits_module);
    functionPriority = 1;
    GVAR(validator) = QFUNC(registerArtilleryUnits_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(registerArtilleryUnits_shortDescription);
        description = CSTRING(registerArtilleryUnits_description);
        canSyncWith[] = {"<anyUnit>"};
        syncRequired = 1;
        schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
