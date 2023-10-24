
class GVAR(suppliesSettings_mode): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                CSTRING(suppliesSettings_Attributes_spawnMarker),
                CSTRING(suppliesSettings_Attributes_spawnModulePos)
            };
            tooltips[] = {"", ""};
            GVAR(descriptions[]) = {
                CSTRING(suppliesSettings_Attributes_spawnMarker_Tooltip),
                CSTRING(suppliesSettings_Attributes_spawnModulePos_tooltip)
            };
            values[] = {0, 1};
        };
        class GVAR(description): GVAR(description) {};
    };
};