class GVAR(module_makeCarryable): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_MakeCarryable_DisplayName);
    category = "a3cs_modules_objects";
    function = QUOTE(DFUNC(module_makeCarryable));

    class Attributes: AttributesBase {
        class carryable: CheckboxNumber {
            displayName = CSTRING(Module_MakeCarryable_Carryable_DisplayName);
            tooltip = CSTRING(Module_MakeCarryable_Carryable_Description);
            property = QGVAR(module_makeCarryable_carryable);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class carryOffset: Edit {
            displayName = CSTRING(Module_MakeCarryable_CarryOffset_DisplayName);
            tooltip = CSTRING(Module_MakeCarryable_CarryOffset_Description);
            property = QGVAR(module_makeCarryable_carryOffset);
            defaultValue = "'[0,1,0]'";
        };
        class carryDir: Edit {
            displayName = CSTRING(Module_MakeCarryable_CarryDir_DisplayName);
            tooltip = CSTRING(Module_MakeCarryable_CarryDir_Description);
            property = QGVAR(module_makeCarryable_carryDir);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_MakeCarryable_Description);
    };
};
