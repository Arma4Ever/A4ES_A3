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
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};
class Extended_Init_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE(call COMPILE_FILE(XEH_initMan));
        };
    };
};
class Extended_Killed_EventHandlers {
    class CAManBase {
        class ADDON {
            killed = QUOTE(call DFUNC(handleKilled));
        };
    };
};
class Extended_Local_EventHandlers {
    class CAManBase {
        class ADDON {
            local = QUOTE(call DFUNC(handleLocal));
        };
    };
};
