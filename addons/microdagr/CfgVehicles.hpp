class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ace_microdagr_configure {
                    class GVAR(showMarkersOnMap) {
                        displayName = CSTRING(showMarkersOnMap);
                        condition = QUOTE((_player getVariable [ARR_2('ace_microdagr_receivePos',false)]) && {!ace_microdagr_showMicrodagrMarkersOnMap});
                        statement = QUOTE(ace_microdagr_showMicrodagrMarkersOnMap = true);
                        exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    };
                    class GVAR(hideMarkersOnMap) {
                        displayName = CSTRING(hideMarkersOnMap);
                        condition = QUOTE((_player getVariable [ARR_2('ace_microdagr_receivePos',false)]) && {ace_microdagr_showMicrodagrMarkersOnMap});
                        statement = QUOTE(ace_microdagr_showMicrodagrMarkersOnMap = false);
                        exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    };
                };

                class GVAR(simpleGPSOn) {
                    displayName = CSTRING(SimpleGPSOn);
                    condition = QUOTE(!(_player getVariable [ARR_2('ace_microdagr_broadcastPos',false)]) && {'A4ES_simpleGPS' in (_player call ACEFUNC(common,uniqueItems))});
                    statement = QUOTE([true] call FUNC(simpleGps));
                    icon = QPATHTOF(data\icon_simpleGPS.paa);
                    exceptions[] = {"notOnMap", "isNotInside"};
                };
                class GVAR(simpleGPSOff) {
                    displayName = CSTRING(SimpleGPSOff);
                    condition = QUOTE((_player getVariable [ARR_2('ace_microdagr_broadcastPos',false)]) && {'A4ES_simpleGPS' in (_player call ACEFUNC(common,uniqueItems))});
                    statement = QUOTE([false] call FUNC(simpleGps));
                    icon = QPATHTOF(data\icon_simpleGPS.paa);
                    exceptions[] = {"notOnMap", "isNotInside"};
                };
            };
        };
    };
};