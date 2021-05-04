
class GVAR(ambientFlyby_mode): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                CSTRING(ambientFlyby_Attributes_mode_line),
                CSTRING(ambientFlyby_Attributes_mode_central)
            };
            tooltips[] = {"", ""};
            GVAR(descriptions[]) = {
                CSTRING(ambientFlyby_Attributes_mode_line_Desc),
                CSTRING(ambientFlyby_Attributes_mode_central_Desc)
            };
            values[] = {0, 1};
        };
        class GVAR(description): GVAR(description) {};
    };
};
