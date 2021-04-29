class CfgFactionClasses {
    class GVAR(base) {
        displayName = "A3CS";
        priority = 10;
        side = 7;
    };
    class GVAR(AI): GVAR(base) {
        displayName = "A3CS AI";
    };
    class GVAR(effects): GVAR(base) {
        displayName = "A3CS Efekty";
    };
    class GVAR(map): GVAR(base) {
        displayName = "A3CS Mapa";
    };
    class GVAR(radio): GVAR(base) {
        displayName = "A3CS Radia";
    };
    class GVAR(zeus): GVAR(base) {
        displayName = "A3CS Zeus";
    };
    class GVAR(ambient): GVAR(base) {
        displayName = "A3CS Ambient";
    };
};
