class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(checkGear) {
                    displayName = CSTRING(checkGear_displayName);
                    condition = QUOTE(_this call FUNC(canCheckGear));
                    statement = QUOTE(_this call FUNC(checkGear));
                    distance = 4;
                    exceptions[] = {};
                    showDisabled = 0;
                };
            };
        };
    };
};
