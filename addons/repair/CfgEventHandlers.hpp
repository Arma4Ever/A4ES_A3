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
    class Car {
        class ace_repair {
            init = QUOTE(_this call DFUNC(addRepairActions));
        };
    };
    class Tank {
        class ace_repair {
            init = QUOTE(_this call DFUNC(addRepairActions));
        };
    };
    class Motorcycle {
        class ace_repair {
            init = QUOTE(_this call DFUNC(addRepairActions));
        };
    };
    class Helicopter {
        class ace_repair {
            init = QUOTE(_this call DFUNC(addRepairActions));
            exclude[] = {"ace_fastroping_helper", "ACE_friesBase"};
        };
    };
    class Plane {
        class ace_repair {
            init = QUOTE(_this call DFUNC(addRepairActions));
        };
    };
    class Ship_F {
        class ace_repair {
            init = QUOTE(_this call DFUNC(addRepairActions));
        };
    };
};
