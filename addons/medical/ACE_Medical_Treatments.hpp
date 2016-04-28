class ACE_Medical_Actions {
    class Advanced {
        class fieldDressing;
        class CheckDamage: fieldDressing {
            displayName = "Sprawdź obrażenia";//CSTRING(Actions_CheckPulse);
            displayNameProgress = "Sprawdzanie obrażeń";//CSTRING(Check_Pulse_Content);
            category = "examine";
            treatmentLocations[] = {"All"};
            requiredMedic = 0;
            treatmentTime = 2;
            items[] = {};
            callbackSuccess = QUOTE(DFUNC(actionCheckDamage));
            callbackFailure = "";
            callbackProgress = "";
            animationPatient = "";
            animationCaller = "";
            animationCallerProne = "";
            animationCallerSelfProne = "";
            itemConsumed = 0;
            litter[] = {};
        };
        class BloodIV: fieldDressing {
            allowSelfTreatment = 1;
        };
        class SurgicalKit: fieldDressing {
            treatmentTime = "(count ((_this select 1) getVariable ['ACE_Medical_bandagedWounds', []]) * 15)";
            allowedSelections[] = {"All"};
            allowSelfTreatment = 1;
        };
        class PersonalAidKit: fieldDressing {
            allowedSelections[] = {"All"};
            allowSelfTreatment = 1;
        };
    };
};
