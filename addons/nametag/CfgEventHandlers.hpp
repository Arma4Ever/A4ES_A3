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
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
    };
};
class Extended_DisplayLoad_EventHandlers {
    class RscDisplayInterrupt {
        ADDON = QUOTE([ARR_2('RscDisplayInterrupt', _this)] call COMPILE_FILE(XEH_displayLoad));
    };
    class RscDisplayMPInterrupt {
        ADDON = QUOTE([ARR_2('RscDisplayMPInterrupt', _this)] call COMPILE_FILE(XEH_displayLoad));
    };
    class RscDisplayMovieInterrupt {
        ADDON = QUOTE([ARR_2('RscDisplayMovieInterrupt', _this)] call COMPILE_FILE(XEH_displayLoad));
    };
    class RscDisplayEGSpectator {
        ADDON = QUOTE([ARR_2('RscDisplayEGSpectator', _this)] call COMPILE_FILE(XEH_displayLoad));
    };
};
class Extended_DisplayUnload_EventHandlers {
    class RscDisplayInterrupt {
        ADDON = QUOTE([ARR_2('RscDisplayInterrupt', _this)] call COMPILE_FILE(XEH_displayUnload));
    };
    class RscDisplayMPInterrupt {
        ADDON = QUOTE([ARR_2('RscDisplayMPInterrupt', _this)] call COMPILE_FILE(XEH_displayUnload));
    };
    class RscDisplayMovieInterrupt {
        ADDON = QUOTE([ARR_2('RscDisplayMovieInterrupt', _this)] call COMPILE_FILE(XEH_displayUnload));
    };
    class RscDisplayEGSpectator {
        ADDON = QUOTE([ARR_2('RscDisplayEGSpectator', _this)] call COMPILE_FILE(XEH_displayUnload));
    };
};
