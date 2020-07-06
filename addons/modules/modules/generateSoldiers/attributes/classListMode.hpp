
class GVAR(generateSoldiers_classListMode): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                CSTRING(generateSoldiers_Attributes_classListMode_random),
                CSTRING(generateSoldiers_Attributes_classListMode_strict)
            };
            tooltips[] = {"", ""};
            GVAR(descriptions[]) = {
                CSTRING(generateSoldiers_Attributes_classListMode_random_Desc),
                CSTRING(generateSoldiers_Attributes_classListMode_strict_Desc)
            };
            values[] = {0, 1};
        };
        class GVAR(description): GVAR(description) {};
    };
};
