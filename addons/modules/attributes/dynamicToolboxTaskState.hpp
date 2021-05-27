
class GVAR(dynamicToolboxTaskState): GVAR(dynamicToolboxPicture) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 5;
            strings[] = {
                "\a3\3DEN\Data\Attributes\TaskStates\created_ca.paa",
                "\a3\3DEN\Data\Attributes\TaskStates\assigned_ca.paa",
                "\a3\3DEN\Data\Attributes\TaskStates\succeeded_ca.paa",
                "\a3\3DEN\Data\Attributes\TaskStates\failed_ca.paa",
                "\a3\3DEN\Data\Attributes\TaskStates\canceled_ca.paa"
            };
            tooltips[] = {
                "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Created_0",
                "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Assigned_0",
                "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Succeeded_0",
                "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Failed_0",
                "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Canceled_0"
            };
            values[] = {0, 1, 2, 3, 4};
        };
        class GVAR(description): GVAR(description) {};
    };
};
