class GVAR(module_doAnimation): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_DoAnimation_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_doAnimation));

    class Attributes: AttributesBase {
        class anim: Edit {
            displayName = CSTRING(Module_DoAnimation_Anim_DisplayName);
            tooltip = CSTRING(Module_DoAnimation_Anim_Description);
            property = QGVAR(module_doAnimation_anim);
            defaultValue = "''";
        };
        class loopAnim: CheckboxNumber {
            displayName = CSTRING(Module_DoAnimation_LoopAnim_DisplayName);
            tooltip = CSTRING(Module_DoAnimation_LoopAnim_Description);
            property = QGVAR(module_doAnimation_loopAnim);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class loopCondition: EditMulti3 {
            displayName = CSTRING(Module_DoAnimation_LoopCondition_DisplayName);
            tooltip = CSTRING(Module_DoAnimation_LoopCondition_Description);
            property = QGVAR(module_DoAnimation_loopCondition);
            validate = "condition";
            defaultValue = "'true'";
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_DoAnimation_Description);
    };
};
