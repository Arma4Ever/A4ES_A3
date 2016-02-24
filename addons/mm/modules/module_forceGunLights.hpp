class GVAR(module_forceGunLights): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_ForceGunLights_DisplayName);
    category = "a3cs_modules_ai";
    function = QUOTE(DFUNC(module_forceGunLights));

    class Attributes: AttributesBase {
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_ForceGunLights_Description);
    };
};
