class GVAR(module_breathFog): A3C_Module {
    scope = 1; //tmp
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_BreathFog_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_breathFog));
    isTriggerActivated = 0;

    class Attributes: AttributesBase {
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_BreathFog_Description);
    };
};
