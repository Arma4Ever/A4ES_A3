
class GVAR(genSoldiers_classListMode): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                "Random",
                "Strict"
            };
            tooltips[] = {
                "Opis random",
                "Opis strict"
            };
            values[] = {0, 1};
        };
        class GVAR(description): GVAR(description) {};
    };
};
