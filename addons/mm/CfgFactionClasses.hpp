class CfgFactionClasses {
    class a3cs_modules {
        displayName = "A3CS";
        priority = 10;
        side = 7;
    };
    class a3cs_modules_ai: a3cs_modules {
        displayName = CSTRING(FactionClass_AI);
    };
    class a3cs_modules_support: a3cs_modules {
        displayName = CSTRING(FactionClass_Support);
    };
    class a3cs_modules_interactions: a3cs_modules {
        displayName = CSTRING(FactionClass_Interactions);
    };
    class a3cs_modules_tasks: a3cs_modules {
        displayName = CSTRING(FactionClass_Tasks);
    };
    class a3cs_modules_effects: a3cs_modules {
        displayName = CSTRING(FactionClass_Effects);
    };
};
