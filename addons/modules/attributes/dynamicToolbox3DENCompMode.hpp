
class GVAR(dynamicToolbox3DENCompMode): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                CSTRING(dynamicToolbox3DENCompMode_edit),
                CSTRING(dynamicToolbox3DENCompMode_read)
            };
            tooltips[] = {
                CSTRING(dynamicToolbox3DENCompMode_edit_tooltip),
                CSTRING(dynamicToolbox3DENCompMode_read_tooltip)
            };
            GVAR(descriptions[]) = {
                CSTRING(dynamicToolbox3DENCompMode_edit_desc),
                CSTRING(dynamicToolbox3DENCompMode_read_desc)
            };
            values[] = {0, 1};
        };
        class GVAR(description): GVAR(description) {};
    };
};
