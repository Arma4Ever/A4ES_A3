class CfgMPGameTypes {
    class GVAR(Coop) {
        id = 200;
		name = CSTRING(Coop_name);
		shortcut = CSTRING(Coop_shortcut);
        description = "";
		picture = "";

        class GVAR(rules) {
            general[] = {
                "Gracze vs AI",
                "Jeden gracz - jedno życie",
                "Może zawierać sloty zeusa"
            };
            limitations[] = {};
            warnings[] = {};
        };
    };
    class GVAR(CoopRespawn) {
        id = 199;
        name = "";
		shortcut = "";
		description = "";
		picture = "";
    };
    class GVAR(TvT) {
        id = 198;
        name = "";
		shortcut = "";
		description = "";
		picture = "";
    };
    class GVAR(TvTRespawn) {
        id = 197;
        name = "";
		shortcut = "";
		description = "";
		picture = "";
    };
    class GVAR(Custom) {
        id = 100;
        name = "";
		shortcut = "";
		description = "";
		picture = "";
    };
};
