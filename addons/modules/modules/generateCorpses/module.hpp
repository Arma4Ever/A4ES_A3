class GVAR(generateCorpse): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(generateCorpse_displayName);
    //icon = QPATHTOF(modules\generateCorpse\data\icon.paa);
    category = QGVAR(AI);
    function = QFUNC(generateCorpse_module);
    GVAR(validator) = QFUNC(generateCorpse_validate);
    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};



        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(generateCorpse_shortDescription);
        schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
