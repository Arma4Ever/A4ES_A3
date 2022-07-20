
class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_InitPost_EventHandlers {
    class LandVehicle {
        class GVAR(initVehicle) {
            serverInit = QUOTE(_this call FUNC(initVehicle));
        };
    };
    class a3cs_mobileArtilleryRadar {
        class GVAR(initRadarObject) {
            serverInit = QUOTE(_this call FUNC(initRadarObject));
        };
    };
};
