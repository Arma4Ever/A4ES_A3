class GVAR(module_cacheSettings): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_CacheSettings_DisplayName);
    category = "a3cs_modules_ai";
    function = QUOTE(DFUNC(module_cacheSettings));

    class Attributes: AttributesBase {
        class enable: CheckboxNumber {
            displayName = CSTRING(Module_CacheSettings_Enable_DisplayName);
            tooltip = CSTRING(Module_CacheSettings_Enable_Description);
            property = QGVAR(module_cacheSettings_enable);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class distanceLand: Edit {
            displayName = CSTRING(Module_CacheSettings_DistanceLand_DisplayName);
            tooltip = CSTRING(Module_CacheSettings_DistanceLand_Description);
            property = QGVAR(module_cacheSettings_distanceLand);
            typeName = "NUMBER";
            defaultValue = 2000;
        };
        class distanceHelicopter: Edit {
            displayName = CSTRING(Module_CacheSettings_DistanceHelicopter_DisplayName);
            tooltip = CSTRING(Module_CacheSettings_DistanceHelicopter_Description);
            property = QGVAR(module_cacheSettings_distanceHelicopter);
            typeName = "NUMBER";
            defaultValue = 3000;
        };
        class distancePlane: Edit {
            displayName = CSTRING(Module_CacheSettings_DistancePlane_DisplayName);
            tooltip = CSTRING(Module_CacheSettings_DistancePlane_Description);
            property = QGVAR(module_cacheSettings_distancePlane);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_CacheSettings_Description);
    };
};
