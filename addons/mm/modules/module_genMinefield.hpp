class GVAR(module_genMinefield): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_GenMinefield_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_genMinefield));
    canSetArea = 1;
    class AttributeValues {
        size3[] = {50,50,-1};
    };

    class Attributes: AttributesBase {
        class classes: Edit {
            displayName = CSTRING(Module_GenMinefield_Classes_DisplayName);
            tooltip = CSTRING(Module_GenMinefield_Classes_Description);
            property = QGVAR(module_genMinefield_classes);
            defaultValue = "'[]'";
        };
        class mineCount: Edit {
            displayName = CSTRING(Module_GenMinefield_MineCount_DisplayName);
            tooltip = CSTRING(Module_GenMinefield_MineCount_Description);
            property = QGVAR(module_genMinefield_mineCount);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        position = 1;
        description = CSTRING(Module_GenMinefield_Description);
    };
};
