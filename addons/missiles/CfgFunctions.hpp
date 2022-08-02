class CfgFunctions {
    class ace_missileguidance {
        tag = "ace_missileguidance";
        class ace_missileguidance {
            class gps_setupVehicle {
                file = QPATHTOF(functions\fnc_ace_gps_setupVehicle.sqf);
            };
            class shouldFilterRadarHit {
                file = QPATHTOF(functions\fnc_ace_shouldFilterRadarHit.sqf);
            };
        };
    };
};
