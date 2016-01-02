class GVAR(module_cacheSettings): A3C_Module {
    scope = 2;
    author = "Arma3Coop.pl";
    displayName = "Ustawienia cache";
    category = "a3cs_modules_settings";
    function = QUOTE(DFUNC(module_cacheSettings));
    isTriggerActivated = 0;

    class Arguments {
        class enabled {
            displayName = "$STR_A3CS_Cache_module_cacheSettings_enabled_displayName";
            description = "$STR_A3CS_Cache_module_cacheSettings_enabled_description";
            typeName = "BOOL";
            defaultValue = 1;
        };
        class distance {
            displayName = "$STR_A3CS_Cache_module_cacheSettings_distance_displayName";
            description = "$STR_A3CS_Cache_module_cacheSettings_distance_description";
            typeName = "NUMBER";
            defaultValue = 2000;
        };
    };
    class ModuleDescription: ModuleDescription {
        description = "";
        sync[] = {};
    };
};
