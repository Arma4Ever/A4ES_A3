
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
    class Display3DENEditAttributes {
        ADDON = QUOTE(_this call FUNC(display3DENEditAttributes_onLoad));
    };
    class Display3DEN {
        ADDON = QUOTE(_this call (uiNamespace getVariable 'FUNC(display3DEN_onLoad)'));
    };
};
