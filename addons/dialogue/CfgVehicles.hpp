class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(talk) {
                    displayName = CSTRING(Actions_Talk_DisplayName);
                    condition = QUOTE(_this call FUNC(canTalk));
                    statement = QUOTE(_this call FUNC(talk));
                    exceptions[] = {};
                    showDisabled = 0;
                    icon = "\a3\ui_f\data\igui\cfg\simpletasks\types\talk_ca.paa";
                };
            };
        };
    };
};
