class cfgFunctions {
    class a3cs_respawn {
        tag = "a3cs_respawn";
        class Actions {
            class respawnOnPlayerKilled {
                file = PATHTOF(functions\fnc_respawnOnPlayerKilled.sqf);
            };
            class respawnOnPlayerRespawn {
                file = PATHTOF(functions\fnc_respawnOnPlayerRespawn.sqf);
            };
        };
    };
};
