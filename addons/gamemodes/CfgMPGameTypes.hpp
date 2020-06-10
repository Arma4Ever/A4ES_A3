class CfgMPGameTypes {
    class GVAR(Coop) {
        id = 200;
		name = "Coop";
		shortcut = "Coop";
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
        name = "Coop + Respawn";
		shortcut = "CoopRespawn";
        description = "";
		picture = "";

        class GVAR(rules) {
            general[] = {
                "Gracze vs AI",
                "Respawn po śmierci",
                "Może zawierać sloty zeusa"
            };
            limitations[] = {};
            warnings[] = {};
        };
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
