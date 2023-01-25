class CfgMPGameTypes {
    class GVAR(Coop) {
        id = 200;
		name = CSTRING(Coop_name);
		shortcut = CSTRING(Coop_shortcut);
        description = "";
		picture = "";

        GVAR(description) = CSTRING(Coop_description);
        class GVAR(rules) {
            general[] = {
                CSTRING(Rules_PvE),
                CSTRING(Rules_OneLife),
                CSTRING(Rules_CanHaveZeus),
                CSTRING(Rules_CanBeOfficial),
            };
            limitations[] = {};
            warnings[] = {};
        };
    };
    class GVAR(CoopRespawn) {
        id = 199;
        name = CSTRING(CoopRespawn_name);
		shortcut = CSTRING(CoopRespawn_shortcut);
        description = "";
		picture = "";

        GVAR(description) = CSTRING(CoopRespawn_description);
        class GVAR(rules) {
            general[] = {
                CSTRING(Rules_PvE),
                CSTRING(Rules_CanHaveRespawn),
                CSTRING(Rules_CanHaveZeus),
            };
            limitations[] = {
                CSTRING(Limit_NotOfficial)
            };
            warnings[] = {
                CSTRING(Warning_InfoOnly)
            };
        };
    };
    class GVAR(TvT) {
        id = 198;
        name = CSTRING(TvT_name);
		shortcut = CSTRING(TvT_shortcut);
        description = "";
		picture = "";

        GVAR(description) = CSTRING(TvT_description);
        class GVAR(rules) {
            general[] = {
                CSTRING(Rules_TvT),
                CSTRING(Rules_OneLife),
                CSTRING(Rules_CanHaveExtraAI),
                CSTRING(Rules_CanHaveZeus),
                CSTRING(Rules_CanBeOfficial),
            };
            limitations[] = {};
            warnings[] = {};
        };
    };
    class GVAR(TvTRespawn) {
        id = 197;
        name = CSTRING(TvTRespawn_name);
		shortcut = CSTRING(TvTRespawn_shortcut);
        description = "";
		picture = "";

        GVAR(description) = CSTRING(TvTRespawn_description);
        class GVAR(rules) {
            general[] = {
                CSTRING(Rules_TvT),
                CSTRING(Rules_CanHaveRespawn),
                CSTRING(Rules_CanHaveExtraAI),
                CSTRING(Rules_CanHaveZeus)
            };
            limitations[] = {
                CSTRING(Limit_NotOfficial)
            };
            warnings[] = {
                CSTRING(Warning_InfoOnly)
            };
        };
    };
    class GVAR(Custom) {
        id = 100;
        name = CSTRING(Custom_name);
		shortcut = CSTRING(Custom_shortcut);
        description = "";
		picture = "";

        GVAR(description) = CSTRING(Custom_description);
        class GVAR(rules) {
            general[] = {};
            limitations[] = {
                CSTRING(Limit_NotOfficial)
            };
            warnings[] = {};
        };
    };
};
