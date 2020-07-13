class GVAR(fireArtillery_targetPosMode): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 2;
            strings[] = {
                "Losowa w obszarze",
                "Dokladna pozycja modulu",
            };
            tooltips[] = {"", ""};
            GVAR(descriptions[]) = {
                "Wystrzelone pociski beda uderzac w posowe pozycje w obszarze modulu",
                "Wystrzelone pociski beda uderzac w dokladna pozycje modulu (przydatne jesli chcesz trafic konkretne miejsce)",
            };
            values[] = {0, 1};
        };
        class GVAR(description): GVAR(description) {};
    };
};
