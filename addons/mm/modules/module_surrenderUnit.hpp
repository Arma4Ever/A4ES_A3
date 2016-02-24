class GVAR(module_surrenderUnit): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_SurrenderUnit_DisplayName);
    category = "a3cs_modules_ai";
    function = QUOTE(DFUNC(module_surrenderUnit));

    class Attributes: AttributesBase {
        class action: Combo {
            displayName = CSTRING(Module_SurrenderUnit_Action_DisplayName);
            tooltip = CSTRING(Module_SurrenderUnit_Action_Description);
            property = QGVAR(module_surrenderUnit_action);
            defaultValue = "'surrender'";
            class values {
                class surrender {name = CSTRING(Module_SurrenderUnit_Action_Surrender_DisplayName); value = "surrender"; default = 1;};
                class stopsurrender {name = CSTRING(Module_SurrenderUnit_Action_StopSurrender_DisplayName); value = "stopsurrender"; default = 0;};
            };
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_SurrenderUnit_Description);
    };
};
