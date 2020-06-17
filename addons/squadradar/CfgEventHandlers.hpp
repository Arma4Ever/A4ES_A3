
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

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(_this call FUNC(handleRespawn));
        };
    };
};

class Extended_Killed_EventHandlers {
    class CAManBase {
        class ADDON {
            killed = QUOTE(_this call FUNC(handleKilled));
        };
    };
};

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayCamera {
        ADDON = QUOTE('RscDisplayCamera' call FUNC(displayLoad));
    };
    class RscDisplayAnimViewer {
        ADDON = QUOTE('RscDisplayAnimViewer' call FUNC(displayLoad));
    };
    class RscEstablishingShot {
        ADDON = QUOTE('RscEstablishingShot' call FUNC(displayLoad));
    };
    class RscDisplayArsenal {
        ADDON = QUOTE('RscDisplayArsenal' call FUNC(displayLoad));
    };
    class RscSpectator {
        ADDON = QUOTE('RscSpectator' call FUNC(displayLoad));
    };
    class RscDisplayEGSpectator {
        ADDON = QUOTE('RscDisplayEGSpectator' call FUNC(displayLoad));
    };
    class RscDisplayCurator {
        ADDON = QUOTE('RscDisplayCurator' call FUNC(displayLoad));
    };
    class ace_spectator_display {
        ADDON = QUOTE('ace_spectator_display' call FUNC(displayLoad));
    };
    class ace_arsenal_display {
        ADDON = QUOTE('ace_arsenal_display' call FUNC(displayLoad));
    };
};

class Extended_DisplayUnload_EventHandlers {
    class RscDisplayCamera {
        ADDON = QUOTE('RscDisplayCamera' call FUNC(displayUnload));
    };
    class RscDisplayAnimViewer {
        ADDON = QUOTE('RscDisplayAnimViewer' call FUNC(displayUnload));
    };
    class RscEstablishingShot {
        ADDON = QUOTE('RscEstablishingShot' call FUNC(displayUnload));
    };
    class RscDisplayArsenal {
        ADDON = QUOTE('RscDisplayArsenal' call FUNC(displayUnload));
    };
    class RscSpectator {
        ADDON = QUOTE('RscSpectator' call FUNC(displayUnload));
    };
    class RscDisplayEGSpectator {
        ADDON = QUOTE('RscDisplayEGSpectator' call FUNC(displayUnload));
    };
    class RscDisplayCurator {
        ADDON = QUOTE('RscDisplayCurator' call FUNC(displayUnload));
    };
    class ace_spectator_display {
        ADDON = QUOTE('ace_spectator_display' call FUNC(displayUnload));
    };
    class ace_arsenal_display {
        ADDON = QUOTE('ace_arsenal_display' call FUNC(displayUnload));
    };
};
