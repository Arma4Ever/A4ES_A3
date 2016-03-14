class GVAR(module_setTaskState): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_SetTaskState_DisplayName);
    category = "a3cs_modules_tasks";
    function = QUOTE(DFUNC(module_setTaskState));

    class Attributes: AttributesBase {
        class taskID: Edit {
            displayName = CSTRING(Module_SetTaskState_TaskID_DisplayName);
            tooltip = CSTRING(Module_SetTaskState_TaskID_Description);
            property = QGVAR(module_setTaskState_taskID);
            defaultValue = "''";
        };
        class taskState: Combo {
            displayName = CSTRING(Module_SetTaskState_TaskState_DisplayName);
            tooltip = CSTRING(Module_SetTaskState_TaskState_Description);
            property = QGVAR(module_setTaskState_taskState);
            defaultValue = "'succeeded'";
            class values {
                //class created {name = CSTRING(Module_SetTaskState_TaskState_Created_DisplayName); value = "created"; default = 1;};
                class assigned {name = CSTRING(Module_SetTaskState_TaskState_Assigned_DisplayName); value = "assigned"; default = 0;};
                class succeeded {name = CSTRING(Module_SetTaskState_TaskState_Succeeded_DisplayName); value = "succeeded"; default = 1;};
                class failed {name = CSTRING(Module_SetTaskState_TaskState_Failed_DisplayName); value = "failed"; default = 0;};
                class canceled {name = CSTRING(Module_SetTaskState_TaskState_Canceled_DisplayName); value = "canceled"; default = 0;};
            };
        };
        class showNotification: CheckboxNumber {
            displayName = CSTRING(Module_SetTaskState_ShowNotification_DisplayName);
            tooltip = CSTRING(Module_SetTaskState_ShowNotification_Description);
            property = QGVAR(module_setTaskState_showNotification);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_SetTaskState_Description);
    };
};
