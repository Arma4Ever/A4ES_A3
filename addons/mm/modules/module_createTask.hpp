class GVAR(module_createTask): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_CreateTask_DisplayName);
    category = "a3cs_modules_tasks";
    function = QUOTE(DFUNC(module_createTask));

    class Attributes: AttributesBase {
        class taskID: Edit {
            displayName = CSTRING(Module_CreateTask_TaskID_DisplayName);
            tooltip = CSTRING(Module_CreateTask_TaskID_Description);
            property = QGVAR(module_createTask_taskID);
            defaultValue = "''";
        };
        class taskTitle: Edit {
            displayName = CSTRING(Module_CreateTask_TaskTitle_DisplayName);
            tooltip = CSTRING(Module_CreateTask_TaskTitle_Description);
            property = QGVAR(module_createTask_taskTitle);
            defaultValue = "''";
        };
        class taskDesc: EditMulti3 {
            displayName = CSTRING(Module_CreateTask_TaskDesc_DisplayName);
            tooltip = CSTRING(Module_CreateTask_TaskDesc_Description);
            property = QGVAR(module_createTask_taskDesc);
            defaultValue = "''";
        };
        class taskTarget: Edit {
            displayName = CSTRING(Module_CreateTask_TaskTarget_DisplayName);
            tooltip = CSTRING(Module_CreateTask_TaskTarget_Description);
            property = QGVAR(module_createTask_taskTarget);
            defaultValue = "'west'";
        };
        class showNotification: CheckboxNumber {
            displayName = CSTRING(Module_CreateTask_ShowNotification_DisplayName);
            tooltip = CSTRING(Module_CreateTask_ShowNotification_Description);
            property = QGVAR(module_createTask_showNotification);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_CreateTask_Description);
    };
};
