class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ace_microdagr_simpleGpsOn {
                    displayName = CSTRING(Actions_SimpleGpsOn_DisplayName);
                    condition = QUOTE([0] call ace_microdagr_fnc_simpleGps);
                    statement = QUOTE([1] call ace_microdagr_fnc_simpleGps);
                    showDisabled = 0;
                    priority = 0.3;
                    icon = PATHTOF(data\icon_simpleGPS.paa);
                    exceptions[] = {"notOnMap", "isNotInside"};
                };
                class ace_microdagr_simpleGpsOff {
                    displayName = CSTRING(Actions_SimpleGpsOff_DisplayName);
                    condition = QUOTE([2] call ace_microdagr_fnc_simpleGps);
                    statement = QUOTE([3] call ace_microdagr_fnc_simpleGps);
                    showDisabled = 0;
                    priority = 0.3;
                    icon = PATHTOF(data\icon_simpleGPS.paa);
                    exceptions[] = {"notOnMap", "isNotInside"};
                };
            };
        };
    };
};
