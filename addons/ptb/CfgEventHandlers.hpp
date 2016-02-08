class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};
class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
    };
};
class Extended_InitPost_EventHandlers {
    class ACE_IR_Strobe_Effect {
        class GVAR(thermalEffect) {
            init = QUOTE(call FUNC(initStrobe));
        };
    };
};
