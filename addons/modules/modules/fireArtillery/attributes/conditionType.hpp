class GVAR(fireArtillery_conditionType): GVAR(dynamicToolboxPicture) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 4;
            strings[] = {
                "\a3\ui_f\data\igui\cfg\mptable\total_ca.paa",
                "\a3\modules_f_curator\data\portraitcountdown_ca.paa",
                "\a3\3den\data\displays\display3den\panelright\submode_logic_logic_ca.paa",
                "\a3\3den\data\displays\display3den\entitymenu\findconfig_ca.paa"
            };
            tooltips[] = {
                CSTRING(fireArtillery_conditionType_count),
                CSTRING(fireArtillery_conditionType_time),
                CSTRING(fireArtillery_conditionType_logicFlags),
                CSTRING(fireArtillery_conditionType_condition)
            };
            GVAR(descriptions[]) = {
                CSTRING(fireArtillery_conditionType_count_desc),
                CSTRING(fireArtillery_conditionType_time_desc),
                CSTRING(fireArtillery_conditionType_logicFlags_desc),
                CSTRING(fireArtillery_conditionType_condition_desc)
            };
            values[] = {0, 1, 2, 3};
        };
        class GVAR(description): GVAR(description) {};
    };
};
