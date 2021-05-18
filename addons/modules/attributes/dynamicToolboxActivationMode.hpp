
class GVAR(dynamicToolboxActivationMode): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 3;
            strings[] = {
                CSTRING(dynamicToolboxActivationMode_value_nearestPlayer),
                CSTRING(dynamicToolboxActivationMode_value_condition),
                CSTRING(dynamicToolboxActivationMode_value_trigger)
            };
            tooltips[] = {"", "", ""};
            GVAR(descriptions[]) = {
                CSTRING(dynamicToolboxActivationMode_value_nearestPlayer_Desc),
                CSTRING(dynamicToolboxActivationMode_value_condition_Desc),
                CSTRING(dynamicToolboxActivationMode_value_trigger_Desc)
            };
            values[] = {0, 1, 2};
        };
        class GVAR(description): GVAR(description) {};
    };
};
