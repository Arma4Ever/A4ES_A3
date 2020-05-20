
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

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayInterrupt {
        ADDON = QUOTE('RscDisplayInterrupt' call FUNC(displayLoad));
    };
    class RscDisplayMPInterrupt {
        ADDON = QUOTE('RscDisplayMPInterrupt' call FUNC(displayLoad));
    };
    class RscDisplayMovieInterrupt {
        ADDON = QUOTE('RscDisplayMovieInterrupt' call FUNC(displayLoad));
    };
    class RscDisplayEGSpectator {
        ADDON = QUOTE('RscDisplayEGSpectator' call FUNC(displayLoad));
    };
    class RscDisplayCurator {
        ADDON = QUOTE('RscDisplayCurator' call FUNC(displayLoad));
    };
};

class Extended_DisplayUnload_EventHandlers {
    class RscDisplayInterrupt {
        ADDON = QUOTE('RscDisplayInterrupt' call FUNC(displayUnload));
    };
    class RscDisplayMPInterrupt {
        ADDON = QUOTE('RscDisplayMPInterrupt' call FUNC(displayUnload));
    };
    class RscDisplayMovieInterrupt {
        ADDON = QUOTE('RscDisplayMovieInterrupt' call FUNC(displayUnload));
    };
    class RscDisplayEGSpectator {
        ADDON = QUOTE('RscDisplayEGSpectator' call FUNC(displayUnload));
    };
    class RscDisplayCurator {
        ADDON = QUOTE('RscDisplayCurator' call FUNC(displayUnload));
    };
};
