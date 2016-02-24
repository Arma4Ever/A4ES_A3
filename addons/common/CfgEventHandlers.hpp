class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};
class Extended_PostInit_EventHandlers {
    class ADDON {
        serverInit = QUOTE(call COMPILE_FILE(XEH_post_initServer));
        clientInit = QUOTE(call COMPILE_FILE(XEH_post_initClient));
    };
};
class Extended_Init_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE(call COMPILE_FILE(XEH_initMan));
        };
    };
};
class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(call COMPILE_FILE(XEH_respawnMan));
        };
    };
};
class Extended_Killed_EventHandlers {
    class CAManBase {
        class ADDON {
            killed = QUOTE(call FUNC(handleKilled));
        };
    };
};
