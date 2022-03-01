
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
	class GVAR(dressingSet) {
		class ADDON {
            serverInit = QUOTE((_this select 0) enableDynamicSimulation true);
		};
	};
};

class Extended_Init_EventHandlers {
    class GVAR(dressingSet) {
        class ADDON {
            init = QUOTE(_this call ace_dragging_fnc_initObject);
        };
    };
};
