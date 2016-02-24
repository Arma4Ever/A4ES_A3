class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_Init_EventHandlers {
    class GVAR(fieldhospital) {
        class GVAR(enable_fieldhospital) {
            init = "(_this select 0) setvariable ['ace_medical_isMedicalFacility', true]";
        };
    };
};
