
class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };

    ACE_MEDICAL_OVERRIDE(medical_gui,XEH_preStart);
    ACE_MEDICAL_OVERRIDE(medical_statemachine,XEH_preStart);
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };

    ACE_MEDICAL_CHECK(medical,XEH_preInit);
    ACE_MEDICAL_CHECK(medical_ai,XEH_preInit);
    ACE_MEDICAL_CHECK(medical_blood,XEH_preInit);
    ACE_MEDICAL_CHECK(medical_damage,XEH_preInit);
    ACE_MEDICAL_CHECK(medical_engine,XEH_preInit);
    ACE_MEDICAL_CHECK(medical_feedback,XEH_preInit);
    ACE_MEDICAL_OVERRIDE(medical_gui,XEH_preInit);
    ACE_MEDICAL_OVERRIDE(medical_statemachine,XEH_preInit);
    ACE_MEDICAL_CHECK(medical_status,XEH_preInit);
    ACE_MEDICAL_CHECK(medical_treatment,XEH_preInit);
    ACE_MEDICAL_CHECK(medical_vitals,XEH_preInit);
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };

    ACE_MEDICAL_CHECK(medical,XEH_postInit);
    ACE_MEDICAL_CHECK(medical_ai,XEH_postInit);
    ACE_MEDICAL_CHECK(medical_blood,XEH_postInit);
    ACE_MEDICAL_OVERRIDE(medical_engine,XEH_postInit);
    ACE_MEDICAL_CHECK(medical_feedback,XEH_postInit);
    ACE_MEDICAL_CHECK(medical_gui,XEH_postInit);
    ACE_MEDICAL_CHECK(medical_status,XEH_postInit);
    ACE_MEDICAL_CHECK(medical_treatment,XEH_postInit);
    ACE_MEDICAL_CHECK(medical_vitals,XEH_postInit);
};
