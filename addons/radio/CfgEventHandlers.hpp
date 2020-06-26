
class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    delete Radio_Animations_PreInitHandler;

    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    delete Radio_Animations_PostInitHandler;

    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};
