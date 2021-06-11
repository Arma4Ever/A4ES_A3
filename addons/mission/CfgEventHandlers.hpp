
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

class Extended_Hit_EventHandlers {
    class Car {
        class ADDON {
            hit = QUOTE(_this call FUNC(handleVehicleHit));
        };
    };
    class Tank {
        class ADDON {
            hit = QUOTE(_this call FUNC(handleVehicleHit));
        };
    };
    class Helicopter {
        class ADDON {
            hit = QUOTE(_this call FUNC(handleVehicleHit));
        };
    };
    class Plane {
        class ADDON {
            hit = QUOTE(_this call FUNC(handleVehicleHit));
        };
    };
    class Ship {
        class ADDON {
            hit = QUOTE(_this call FUNC(handleVehicleHit));
        };
    };
    class StaticWeapon {
        class ADDON {
            hit = QUOTE(_this call FUNC(handleVehicleHit));
        };
    };
};
