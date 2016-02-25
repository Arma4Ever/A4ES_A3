class Extended_PreStart_EventHandlers {
    class ace_microdagr {
        init = QUOTE(call COMPILE_FILE(XEH_ace_preStart));
    };
};
class Extended_PreInit_EventHandlers {
    class ace_microdagr {
        init = QUOTE(call COMPILE_FILE(XEH_ace_preInit));
    };
};
class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
    };
};
