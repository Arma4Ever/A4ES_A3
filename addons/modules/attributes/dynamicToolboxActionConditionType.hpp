
class GVAR(dynamicToolboxActionConditionType): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                CSTRING(dynamicToolboxActionConditionType_logicFlags),
                CSTRING(dynamicToolboxActionConditionType_condition)
            };
            tooltips[] = {"", ""};
            GVAR(descriptions[]) = {
                CSTRING(dynamicToolboxActionConditionType_logicFlags_desc),
                CSTRING(dynamicToolboxActionConditionType_condition_desc)
            };
            values[] = {0, 1};
        };
        class GVAR(description): GVAR(description) {};
    };
};
