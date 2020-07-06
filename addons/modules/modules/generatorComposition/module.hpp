class GVAR(generatorComposition): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(generatorComposition_displayName);
    icon = "\a3\3den\data\displays\display3den\panelright\modegroups_ca.paa";
    category = QGVAR(AI);
    function = QFUNC(generatorComposition_module);
    functionPriority = 1;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(generatorComposition_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(id): GVAR(dynamicEdit) {
            displayName = CSTRING(generatorComposition_Attributes_id);
            tooltip = CSTRING(generatorComposition_Attributes_id_tooltip);
            property = QGVAR(id);
            unique = 1;
        };

        class GVAR(deleteUnits): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generatorComposition_Attributes_deleteUnits);
            tooltip = CSTRING(generatorComposition_Attributes_deleteUnits_tooltip);
            property = QGVAR(deleteUnits);
            defaultValue = "true";
            GVAR(observeValue) = 0;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(generatorComposition_shortDescription);
        description = CSTRING(generatorComposition_description);
        canSyncWith[] = {"<anyUnit>"};
        syncRequired = 2;
        syncRequiredInfo = CSTRING(generatorComposition_syncRequiredInfo);
        schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
