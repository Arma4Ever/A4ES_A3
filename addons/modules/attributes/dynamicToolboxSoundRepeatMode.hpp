
class GVAR(dynamicToolboxSoundRepeatMode): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 3;
            strings[] = {
                CSTRING(dynamicToolboxSoundRepeatMode_count),
                CSTRING(dynamicToolboxSoundRepeatMode_logicFlags),
                CSTRING(dynamicToolboxSoundRepeatMode_condition)
            };
            tooltips[] = {"", "", ""};
            GVAR(descriptions[]) = {
                CSTRING(dynamicToolboxSoundRepeatMode_count_desc),
                CSTRING(dynamicToolboxSoundRepeatMode_logicFlags_desc),
                CSTRING(dynamicToolboxSoundRepeatMode_condition_desc)
            };
            values[] = {0, 1, 2};
        };
        class GVAR(description): GVAR(description) {};
    };
};
