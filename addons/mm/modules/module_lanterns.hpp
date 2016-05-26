class GVAR(module_lanterns): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_Lanterns_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_lanterns));
    canSetArea = 1;
    class AttributeValues {
        size3[] = {50,50,-1};
    };

    class Attributes: AttributesBase {
        class mode: Combo {
            displayName = CSTRING(Module_Lanterns_Mode_DisplayName);
            tooltip = CSTRING(Module_Lanterns_Mode_Description);
            property = QGVAR(module_lanterns_mode);
            defaultValue = "'on'";
            class values {
                class on {name = CSTRING(Module_Lanterns_Mode_On_DisplayName); value = "on"; default = 1;};
                class off {name = CSTRING(Module_Lanterns_Mode_Off_DisplayName); value = "off"; default = 0;};
            };
        };

        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_Lanterns_Description);
    };
};
