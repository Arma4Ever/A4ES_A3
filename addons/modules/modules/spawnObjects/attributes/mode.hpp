
class GVAR(spawnObjects_mode): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                "Edytuj",
                "Zapisz"
            };
            tooltips[] = {"", ""};
            GVAR(descriptions[]) = {
                "Edytuj",
                "Zapisz"
            };
            values[] = {0, 1};
        };
        class GVAR(description): GVAR(description) {};
    };
};
