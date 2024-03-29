class CfgFactionClasses {
    class GVAR(base) {
        displayName = "A4ES";
        priority = 10;
        side = 7;
    };
    class GVAR(AI): GVAR(base) {
        displayName = CSTRING(FactionClasses_AI_displayName);
    };
    class GVAR(3DENComp): GVAR(base) {
        displayName = CSTRING(FactionClasses_3DENComp_displayName);
    };
    class GVAR(actions): GVAR(base) {
        displayName = CSTRING(FactionClasses_actions_displayName);
    };
    class GVAR(tasks): GVAR(base) {
        displayName = CSTRING(FactionClasses_tasks_displayName);
    };
    class GVAR(logicFlags): GVAR(base) {
        displayName = CSTRING(FactionClasses_logicFlags_displayName);
    };
    class GVAR(effects): GVAR(base) {
        displayName = CSTRING(FactionClasses_effects_displayName);
    };
    class GVAR(map): GVAR(base) {
        displayName = CSTRING(FactionClasses_map_displayName);
    };
    class GVAR(markers): GVAR(base) {
        displayName = CSTRING(FactionClasses_markers_displayName);
    };
    class GVAR(events): GVAR(base) {
        displayName = CSTRING(FactionClasses_events_displayName);
    };
    class GVAR(radio): GVAR(base) {
        displayName = CSTRING(FactionClasses_radio_displayName);
    };
    class GVAR(curator): GVAR(base) {
        displayName = CSTRING(FactionClasses_curator_displayName);
    };
    class GVAR(ambient): GVAR(base) {
        displayName = CSTRING(FactionClasses_ambient_displayName);
    };
    class GVAR(fortify): GVAR(base) {
        displayName = CSTRING(FactionClasses_fortify_displayName);
    };
    class GVAR(dialogues): GVAR(base) {
        displayName = CSTRING(FactionClasses_dialogues_displayName);
    };
    class GVAR(supplies): GVAR(base) {
        displayName = CSTRING(FactionClasses_supplies_displayName);
    };
};
