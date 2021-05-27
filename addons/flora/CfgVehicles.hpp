class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(cut) {
                    displayName = CSTRING(cut_displayName);
                    condition = QUOTE(_this call FUNC(canCutFlora));
                    statement = "";
                    exceptions[] = {};
                    showDisabled = 0;
                    class GVAR(cutGrass) {
                        displayName = CSTRING(cutGrass_displayName);
                        condition = QUOTE(_this call FUNC(canCutFlora));
                        statement = QUOTE(_this call FUNC(cutGrass));
                        exceptions[] = {};
                        showDisabled = 0;
                    };
                    class GVAR(cutFlora) {
                        displayName = CSTRING(cutFlora_displayName);
                        condition = QUOTE(_this call FUNC(canCutFlora));
                        statement = QUOTE(_this call FUNC(cutFlora));
                        exceptions[] = {};
                        showDisabled = 0;
                    };
                };
            };
        };
    };
};
