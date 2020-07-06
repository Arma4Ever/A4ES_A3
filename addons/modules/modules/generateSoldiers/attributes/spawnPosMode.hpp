
class GVAR(generateSoldiers_spawnPosMode): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                CSTRING(generateSoldiers_Attributes_spawnPosMode_random),
                CSTRING(generateSoldiers_Attributes_spawnPosMode_strict)
            };
            tooltips[] = {"", ""};
            GVAR(descriptions[]) = {
                CSTRING(generateSoldiers_Attributes_spawnPosMode_random_Desc),
                CSTRING(generateSoldiers_Attributes_spawnPosMode_strict_Desc)
            };
            values[] = {0, 1};
        };
        class GVAR(description): GVAR(description) {};
    };
};
