class GVAR(module_snowEffect): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_SnowEffect_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_snowEffect));
    isTriggerActivated = 0;

    class Attributes: AttributesBase {
        class type: Combo {
            displayName = CSTRING(Module_SnowEffect_Type_DisplayName);
            tooltip = CSTRING(Module_SnowEffect_Type_Description);
            property = QGVAR(module_snowEffect_type);
            defaultValue = "'0'";
            class values {
                class flurry {name = CSTRING(Module_SnowEffect_Type_Flurry_DisplayName); value = "0"; default = 1;};
                class lightStorm {name = CSTRING(Module_SnowEffect_Type_LightStorm_DisplayName); value = "1"; default = 0;};
                class mediumStorm {name = CSTRING(Module_SnowEffect_Type_MediumStorm_DisplayName); value = "2"; default = 0;};
            };
        };

        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_SnowEffect_Description);
    };
};
