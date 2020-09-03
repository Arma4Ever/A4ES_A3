class GVAR(spawnObjects): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = "spawnObjects";
    icon = QPATHTOF(modules\generateSoldiers\data\icon.paa);
    category = QGVAR(AI);
    function = QFUNC(spawnObjects_module);
    GVAR(validator) = QFUNC(spawnObjects_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(mode): Default {
            displayName = "Tryb";
            tooltip = "Tryb";
            control = QGVAR(spawnObjects_mode);
            property = QGVAR(mode);
            typeName = "NUMBER";
            defaultValue = '0';
        };
        class GVAR(data): Default {
            control = QEGVAR(editor,hiddenEdit);
            property = QGVAR(data);
            typeName = "STRING";
            defaultValue = '[]';
        };
        class GVAR(settingsSubCategory): GVAR(moduleSubCategory) {
            displayName = "Ustawienia spawnu";
            property = QGVAR(settingsSubCategory);
        };

        // spawn params

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = "shortDescription";
        description = "description";
        //schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
