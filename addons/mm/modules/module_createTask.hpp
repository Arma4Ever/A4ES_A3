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
        class taskTarget: Combo {
            displayName = CSTRING(Module_CreateTask_TaskTarget_DisplayName);
            tooltip = CSTRING(Module_CreateTask_TaskTarget_Description);
            property = QGVAR(module_createTask_taskTarget);
            defaultValue = "'0'";
            class values {
                class allunits {name = CSTRING(Target_All); value = "0"; default = 1;};
                class syncedunits {name = CSTRING(Target_SyncedUnits); value = "synchronizedObjects _this"; default = 0;};
                class blufor {name = CSTRING(Side_Blufor); value = "west"; default = 0;};
                class opfor {name = CSTRING(Side_Opfor); value = "east"; default = 0;};
                class indep {name = CSTRING(Side_Indep); value = "independent"; default = 0;};
                class civ {name = CSTRING(Side_Civilian); value = "civilian"; default = 0;};
            };
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
        position = 1;
        description = CSTRING(Module_CreateTask_Description);
    };
};
