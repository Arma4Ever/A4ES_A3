class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class A3CS_ShowDogtag {
                    displayName = CSTRING(Actions_CheckDogtag_DisplayName);
                    distance = 2;
                    priority = 2;
                    condition = QUOTE(!alive _target || _target getVariable [ARR_2('ACE_isUnconscious', false)]);
                    statement = QUOTE(_target call DFUNC(showDogtag));
                    exceptions[] = {};
                };
                class A3CS_HideBody {
                    displayName = CSTRING(Actions_HideBody_DisplayName);
                    distance = 2;
                    priority = 2;
                    condition = QUOTE(!alive _target);
                    statement = QUOTE(_target call DFUNC(hideBody));
                    exceptions[] = {};
                };
                class A3CS_OpenGear {
                    displayName = CSTRING(Actions_OpenGear_DisplayName);
                    distance = 2;
                    priority = 2;
                    condition = QUOTE(!alive _target);
                    statement = QUOTE(_target call DFUNC(openGear));
                    exceptions[] = {};
                };
            };
        };
    };
};
