class CfgFactionClasses {
    class GVAR(base) {
        displayName = "A4ES";
        priority = 10;
        side = 7;
    };
    class GVAR(AI): GVAR(base) {
        displayName = "A4ES AI";
    };
    class GVAR(3DENComp): GVAR(base) {
        displayName = "A4ES Kompozycje edytora";
    };
    class GVAR(actions): GVAR(base) {
        displayName = "A4ES Akcje";
    };
    class GVAR(tasks): GVAR(base) {
        displayName = "A4ES Zadania";
    };
    class GVAR(logicFlags): GVAR(base) {
        displayName = "A4ES Flagi logiczne";
    };
    class GVAR(effects): GVAR(base) {
        displayName = "A4ES Efekty";
    };
    class GVAR(map): GVAR(base) {
        displayName = "A4ES Mapa";
    };
    class GVAR(markers): GVAR(base) {
        displayName = "A4ES Markery";
    };
    class GVAR(events): GVAR(base) {
        displayName = CSTRING(FactionClasses_events_displayName);
    };
    class GVAR(radio): GVAR(base) {
        displayName = "A4ES Radia";
    };
    class GVAR(curator): GVAR(base) {
        displayName = "A4ES Zeus";
    };
    class GVAR(ambient): GVAR(base) {
        displayName = "A4ES Ambient";
    };
    class GVAR(fortify): GVAR(base) {
        displayName = "A4ES Fortyfikacje";
    };
    class GVAR(dialogues): GVAR(base) {
        displayName = "A4ES Dialogi";
    };
};
