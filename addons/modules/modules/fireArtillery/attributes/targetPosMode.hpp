class GVAR(fireArtillery_targetPosMode): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                CSTRING(fireArtillery_targetPosMode_random),
                CSTRING(fireArtillery_targetPosMode_precise)
            };
            tooltips[] = {"", ""};
            GVAR(descriptions[]) = {
                CSTRING(fireArtillery_targetPosMode_random_desc),
                CSTRING(fireArtillery_targetPosMode_precise_desc)
            };
            values[] = {0, 1};
        };
        class GVAR(description): GVAR(description) {};
    };
};
