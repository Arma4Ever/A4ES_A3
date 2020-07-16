
class GVAR(skillLevels) {
    ranges[] = {
        {0, "partisans"},
        {0.2, "partisanVeterans"},
        {0.3, "militia"},
        {0.4, "guards"},
        {0.5, "conscripts"},
        {0.6, "professionals"},
        {0.7, "professionalVeterans"},
        {0.8, "elite"},
        {0.9, "eliteVeterans"}
    };

    class partisans {
        name = CSTRING(skillLevel_partisans);
        description = CSTRING(skillLevel_partisans_description);
    };
    class partisanVeterans {
        name = CSTRING(skillLevel_partisanVeterans);
        description = CSTRING(skillLevel_partisanVeterans_description);
    };
    class militia {
        name = CSTRING(skillLevel_militia);
        description = CSTRING(skillLevel_militia_description);
    };
    class guards {
        name = CSTRING(skillLevel_guards);
        description = CSTRING(skillLevel_guards_description);
    };
    class conscripts {
        name = CSTRING(skillLevel_conscripts);
        description = CSTRING(skillLevel_conscripts_description);
    };
    class professionals {
        name = CSTRING(skillLevel_professionals);
        description = CSTRING(skillLevel_professionals_description);
    };
    class professionalVeterans {
        name = CSTRING(skillLevel_professionalVeterans);
        description = CSTRING(skillLevel_professionalVeterans_description);
    };
    class elite {
        name = CSTRING(skillLevel_elite);
        description = CSTRING(skillLevel_elite_description);
    };
    class eliteVeterans {
        name = CSTRING(skillLevel_eliteVeterans);
        description = CSTRING(skillLevel_eliteVeterans_description);
    };
};
