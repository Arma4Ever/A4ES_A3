
class GVAR(genSoldiers_source): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                "Classlist",
                "Composition"
            };
            tooltips[] = {
                "Opis Classlist",
                "Opis Composition"
            };
            values[] = {0, 1};
        };
        class GVAR(description): GVAR(description) {};
    };
};
