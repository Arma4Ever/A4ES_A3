class GVAR(module_makeLoadable): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_MakeLoadable_DisplayName);
    category = "a3cs_modules_objects";
    function = QUOTE(DFUNC(module_makeLoadable));

    class Attributes: AttributesBase {
        class loadable: CheckboxNumber {
            displayName = CSTRING(Module_MakeLoadable_Loadable_DisplayName);
            tooltip = CSTRING(Module_MakeLoadable_Loadable_Description);
            property = QGVAR(module_makeLoadable_loadable);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class cargoSize: Edit {
            displayName = CSTRING(Module_MakeLoadable_CargoSize_DisplayName);
            tooltip = CSTRING(Module_MakeLoadable_CargoSize_Description);
            property = QGVAR(module_makeLoadable_cargoSize);
            typeName = "NUMBER";
            defaultValue = "1";
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_MakeLoadable_Description);
    };
};
