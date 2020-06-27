class CfgFactionClasses {
    class GVAR(base) {
        displayName = "A3CS";
        priority = 10;
        side = 7;
    };
    class GVAR(test): GVAR(base) {
        displayName = "A3CS Test modules";
    };
    class GVAR(AI): GVAR(base) {
        displayName = "A3CS AI";
    };
};
