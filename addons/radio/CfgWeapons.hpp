class CfgWeapons {
    class ItemCore;
    class ItemRadio: ItemCore {
        scopeCurator = 2;
        scopeArsenal = 2;
        scope = 2;
    };
    class ItemRadioAcreFlagged: ItemRadio {
        scopeCurator = 1;
        scope = 1;
        scopeArsenal = 0;
    };
};
