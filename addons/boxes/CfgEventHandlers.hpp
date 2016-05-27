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
    class MetalCase_01_base_F {
        class ADDON {
            init = QUOTE(_this call ace_cargo_fnc_initObject;_this call ace_dragging_fnc_initObject);
        };
    };
    class PlasticCase_01_base_F {
        class ADDON {
            init = QUOTE(_this call ace_cargo_fnc_initObject;_this call ace_dragging_fnc_initObject);
        };
    };
};
class Extended_Put_EventHandlers {
    class CAManBase {
        GVAR(putHandler) = QUOTE(_this call DFUNC(onPut));
    };
};
