
class GVAR(generateSoldiers_source): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                CSTRING(generateSoldiers_Attributes_source_classlist),
                CSTRING(generateSoldiers_Attributes_source_composition)
            };
            tooltips[] = {"", ""};
            GVAR(descriptions[]) = {
                CSTRING(generateSoldiers_Attributes_source_classlist_Desc),
                CSTRING(generateSoldiers_Attributes_source_composition_Desc)
            };
            values[] = {0, 1};
        };
        class GVAR(description): GVAR(description) {};
    };
};
