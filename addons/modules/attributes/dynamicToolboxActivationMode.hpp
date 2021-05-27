
class GVAR(dynamicToolboxActivationMode): GVAR(dynamicToolboxPicture) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 3;
            strings[] = {
                "\a3\3den\data\displays\display3den\panelright\modegroups_ca.paa",
                "\a3\3den\data\displays\display3den\entitymenu\findconfig_ca.paa",
                "\a3\3den\data\displays\display3den\panelright\modetriggers_ca.paa"
            };
            tooltips[] = {
                CSTRING(dynamicToolboxActivationMode_value_nearestPlayer),
                CSTRING(dynamicToolboxActivationMode_value_condition),
                CSTRING(dynamicToolboxActivationMode_value_trigger)
            };
            GVAR(descriptions[]) = {
                CSTRING(dynamicToolboxActivationMode_value_nearestPlayer_Desc),
                CSTRING(dynamicToolboxActivationMode_value_condition_Desc),
                CSTRING(dynamicToolboxActivationMode_value_trigger_Desc)
            };
            values[] = {0, 1, 2};
        };
        class GVAR(description): GVAR(description) {};
    };
};

class GVAR(dynamicToolboxActivationModeNoProxmity): GVAR(dynamicToolboxPicture) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                "\a3\3den\data\displays\display3den\entitymenu\findconfig_ca.paa",
                "\a3\3den\data\displays\display3den\panelright\modetriggers_ca.paa"
            };
            tooltips[] = {
                CSTRING(dynamicToolboxActivationMode_value_condition),
                CSTRING(dynamicToolboxActivationMode_value_trigger)
            };
            GVAR(descriptions[]) = {
                CSTRING(dynamicToolboxActivationMode_value_condition_Desc),
                CSTRING(dynamicToolboxActivationMode_value_trigger_Desc)
            };
            values[] = {1, 2};
        };
        class GVAR(description): GVAR(description) {};
    };
};

class GVAR(dynamicToolboxActivationModeMissionStart): GVAR(dynamicToolboxPicture) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 4;
            strings[] = {
                "\a3\3den\data\displays\display3den\entitymenu\playfromhere_ca.paa",
                "\a3\3den\data\displays\display3den\panelright\modegroups_ca.paa",
                "\a3\3den\data\displays\display3den\entitymenu\findconfig_ca.paa",
                "\a3\3den\data\displays\display3den\panelright\modetriggers_ca.paa"
            };
            tooltips[] = {
                CSTRING(dynamicToolboxActivationMode_value_missionStart),
                CSTRING(dynamicToolboxActivationMode_value_nearestPlayer),
                CSTRING(dynamicToolboxActivationMode_value_condition),
                CSTRING(dynamicToolboxActivationMode_value_trigger)
            };
            GVAR(descriptions[]) = {
                CSTRING(dynamicToolboxActivationMode_value_missionStart_Desc),
                CSTRING(dynamicToolboxActivationMode_value_nearestPlayer_Desc),
                CSTRING(dynamicToolboxActivationMode_value_condition_Desc),
                CSTRING(dynamicToolboxActivationMode_value_trigger_Desc)
            };
            values[] = {-1, 0, 1, 2};
        };
        class GVAR(description): GVAR(description) {};
    };
};
