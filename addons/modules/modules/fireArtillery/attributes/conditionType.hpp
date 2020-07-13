class GVAR(fireArtillery_conditionType): GVAR(dynamicToolbox) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 3;
            strings[] = {
                "Limit czasu",
                "Ilosc strzalow",
                "Warunek logiczny"
            };
            tooltips[] = {"", "", ""};
            GVAR(descriptions[]) = {
                "Ostrzal zostanie zakoczony po uplynieciu wyznaczonego czasu",
                "Ostrzal zostanie zakonczony po podanej ilosci strzalow (lub salw jesli tryb salw jest wlaczony)",
                "Ostrzal zostanie zakoczony w momencie gdy podany warunek logiczny zwroci nieprawde (false)"
            };
            values[] = {0, 1, 2};
        };
        class GVAR(description): GVAR(description) {};
    };
};
