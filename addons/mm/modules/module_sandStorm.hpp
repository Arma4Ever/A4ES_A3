class GVAR(module_sandStorm): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_SandStorm_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_sandStorm));
    isTriggerActivated = 0;

    class Attributes: AttributesBase {
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_SandStorm_Description);
    };
};
