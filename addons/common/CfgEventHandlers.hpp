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
        serverInit = QUOTE(call COMPILE_FILE(XEH_postInitServer));
        clientInit = QUOTE(call COMPILE_FILE(XEH_postInitClient));
    };
};
class Extended_Init_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE(_this call DFUNC(handleInit));
        };
    };
};
class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(_this call DFUNC(handleRespawn));
        };
    };
};
class Extended_Killed_EventHandlers {
    class CAManBase {
        class ADDON {
            killed = QUOTE(_this call DFUNC(handleKilled));
        };
    };
};

class Extended_DisplayLoad_EventHandlers {
    // fix for preInit = 1 functions not being executed when entering 3den from main menu
    class Display3DEN {
        cba_xeh = "[] call CBA_fnc_preInit;";
    };
    class RscDisplayInterrupt {
        cba_xeh_3denFix = "";
    };
};
