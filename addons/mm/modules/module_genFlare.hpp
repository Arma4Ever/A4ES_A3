class GVAR(module_genFlare): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_GenFlare_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_genFlare));
    disposable = 0;
    icon = "\a3\Modules_F_Curator\Data\portraitFlare_ca.paa";

    class Attributes: AttributesBase {
        class color: Combo {
            displayName = CSTRING(Module_GenFlare_Color_DisplayName);
            tooltip = CSTRING(Module_GenFlare_Color_Description);
            property = QGVAR(module_genFlare_color);
            defaultValue = "'F_40mm_White'";
            class values {
                class white {name = CSTRING(Module_GenFlare_Color_White_DisplayName); value = "F_40mm_White"; default = 1;};
                class green {name = CSTRING(Module_GenFlare_Color_Green_DisplayName); value = "F_40mm_Green"; default = 0;};
                class red {name = CSTRING(Module_GenFlare_Color_Red_DisplayName); value = "F_40mm_Red"; default = 0;};
                class yellow {name = CSTRING(Module_GenFlare_Color_Yellow_DisplayName); value = "F_40mm_Yellow"; default = 0;};
            };
        };

        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        position = 1;
        description = CSTRING(Module_GenFlare_Description);
    };
};
