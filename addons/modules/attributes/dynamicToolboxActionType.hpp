
class GVAR(dynamicToolboxActionType): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                CSTRING(dynamicToolboxActionType_interaction),
                CSTRING(dynamicToolboxActionType_selfInteraction)
            };
            tooltips[] = {"", ""};
            GVAR(descriptions[]) = {
                CSTRING(dynamicToolboxActionType_interaction_desc),
                CSTRING(dynamicToolboxActionType_selfInteraction_desc)
            };
            values[] = {0, 1};
        };
        class GVAR(description): GVAR(description) {};
    };
};
