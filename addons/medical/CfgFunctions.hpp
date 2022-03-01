class CfgFunctions {
    class ace_medical_treatment {
        tag = "ace_medical_treatment";
        class ace_medical_treatment {
            class getBandageTime {
                file = QPATHTOF(functions\fnc_ace_getBandageTime.sqf);
            };
            class getHealTime {
                file = QPATHTOF(functions\fnc_ace_getHealTime.sqf);
            };
            class getStitchTime {
                file = QPATHTOF(functions\fnc_ace_getStitchTime.sqf);
            };

            class cprLocal {
                file = QPATHTOF(functions\fnc_ace_cprLocal.sqf);
            };
            class checkPulseLocal {
                file = QPATHTOF(functions\fnc_ace_checkPulseLocal.sqf);
            };
            class checkBloodPressureLocal {
                file = QPATHTOF(functions\fnc_ace_checkBloodPressureLocal.sqf);
            };
            class ivBag {
                file = QPATHTOF(functions\fnc_ace_ivBag.sqf);
            };
            class medication {
                file = QPATHTOF(functions\fnc_ace_medication.sqf);
            };
            class splint {
                file = QPATHTOF(functions\fnc_ace_splint.sqf);
            };
            class tourniquet {
                file = QPATHTOF(functions\fnc_ace_tourniquet.sqf);
            };
            class tourniquetRemove {
                file = QPATHTOF(functions\fnc_ace_tourniquetRemove.sqf);
            };
            class bandage {
                file = QPATHTOF(functions\fnc_ace_bandage.sqf);
            };
            class fullHeal {
                file = QPATHTOF(functions\fnc_ace_fullHeal.sqf);
            };
        };
    };
};
