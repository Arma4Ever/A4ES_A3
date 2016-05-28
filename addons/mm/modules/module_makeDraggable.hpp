class GVAR(module_makeDraggable): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_MakeDraggable_DisplayName);
    category = "a3cs_modules_objects";
    function = QUOTE(DFUNC(module_makeDraggable));

    class Attributes: AttributesBase {
        class draggable: CheckboxNumber {
            displayName = CSTRING(Module_MakeDraggable_Draggable_DisplayName);
            tooltip = CSTRING(Module_MakeDraggable_Draggable_Description);
            property = QGVAR(module_makeDraggable_draggable);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class dragOffset: Edit {
            displayName = CSTRING(Module_MakeDraggable_DragOffset_DisplayName);
            tooltip = CSTRING(Module_MakeDraggable_DragOffset_Description);
            property = QGVAR(module_makeDraggable_dragOffset);
            defaultValue = "'[0,1,0]'";
        };
        class dragDir: Edit {
            displayName = CSTRING(Module_MakeDraggable_DragDir_DisplayName);
            tooltip = CSTRING(Module_MakeDraggable_DragDir_Description);
            property = QGVAR(module_makeDraggable_dragDir);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_MakeDraggable_Description);
    };
};
