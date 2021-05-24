class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(hideBody) {
                    displayName = CSTRING(hideBody_displayName);
                    condition = QUOTE(_this call FUNC(canHideBody));
                    statement = QUOTE(_this call FUNC(hideBody));
                    distance = 4;
                    exceptions[] = {};
                    showDisabled = 0;
                };
            };
        };
    };
};
