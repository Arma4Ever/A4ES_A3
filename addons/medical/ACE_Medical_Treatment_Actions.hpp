class ACE_Medical_Treatment_Actions {
    class CheckPulse;
    class BasicBandage {};
    class FieldDressing: BasicBandage {};

    class PersonalAidKit: BasicBandage {
        condition = QFUNC(canUsePAK);
    };

    class Splint: BasicBandage {
        treatmentTime = QFUNC(getTreatmentTimeSplint);
    };

    class BloodIV: BasicBandage {
        treatmentTime = QFUNC(getTreatmentTimeIV);
    };
    class BloodIV_500: BloodIV {};
    class BloodIV_250: BloodIV {};
    class PlasmaIV: BloodIV {};
    class PlasmaIV_500: PlasmaIV {};
    class PlasmaIV_250: PlasmaIV {};
    class SalineIV: BloodIV {};
    class SalineIV_500: SalineIV {};
    class SalineIV_250: SalineIV {};

    class SurgicalKit: FieldDressing {
        callbackStart = QFUNC(onSurgicalKitStart);
        callbackSuccess = QFUNC(onSurgicalKitSuccess);
        callbackProgress = QFUNC(onSurgicalKitProgress);
    };

    class Morphine;
    class A4ES_painkillers: Morphine {
        displayName = CSTRING(Painkillers_DisplayName);
        displayNameProgress = CSTRING(Painkillers_Progress);
        allowedSelections[] = {"head"};
        items[] = {"A4ES_painkillers"};
        icon = QPATHTOF(data\painkillers_icon_ca.paa);
        condition = "";
        callbackSuccess = QUOTE(call ACEFUNC(medical_treatment,medication));
    };

    class Diagnose: BasicBandage {};
    class A4ES_CheckMedications: Diagnose {
        displayName = CSTRING(CheckMedications_DisplayName);
        displayNameProgress = CSTRING(CheckMedications_Progress);
        allowedSelections[] = {"LeftArm", "RightArm"};
        treatmentTime = 3;
        medicRequired = 1;
        allowSelfTreatment = 1;
        condition = "true";
        callbackSuccess = QFUNC(checkMedications);
        animationMedicProne = "";
        animationMedicSelfProne = "";
    };

    class A4ES_checkNeurologicalInjuries: Diagnose {
        displayName = CSTRING(CheckNeurologicalInjuries_DisplayName);
        displayNameProgress = CSTRING(CheckNeurologicalInjuries_Progress);
        allowedSelections[] = {"Head"};
        treatmentTime = 6;
        medicRequired = 1;
        allowSelfTreatment = 1;
        condition = QUOTE(_patient getVariable [ARR_2(QQEGVAR(common,isPlayer),false)]);
        callbackSuccess = QFUNC(checkNeurologicalInjuries);
        animationMedicProne = "";
        animationMedicSelfProne = "";
    };

    class A4ES_CheckDogtag: CheckPulse {
        displayName = CSTRING(CheckDogtag_DisplayName);
        displayNameProgress = CSTRING(CheckDogtag_Progress);
        treatmentTime = 2;
        allowedSelections[] = {"Head"};
        allowSelfTreatment = 1;
        callbackSuccess = "[_medic, _patient] call ace_dogtags_fnc_checkDogtag";
        condition = "true";
        animationPatient = "";
        animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
        animationPatientUnconsciousExcludeOn[] = {"ainjppnemstpsnonwrfldnon"};
    };
    class A4ES_DrawBlood500: CheckPulse {
        displayName = CSTRING(DrawBlood500_DisplayName);
        displayNameProgress = CSTRING(DrawBlood_Progress);
        treatmentTime = 30;
        allowedSelections[] = {"LeftArm", "RightArm"};
        allowSelfTreatment = 1;
        category = "advanced";
        medicRequired = 0;
        consumeItem = 1;
        callbackStart = QUOTE([ARR_3(_medic,_patient,500)] call FUNC(drawBloodStart));
        callbackProgress = QUOTE([ARR_2(_this,500)] call FUNC(drawBloodProgress));
        callbackFailure = QUOTE([ARR_3(_medic,_patient,500)] call FUNC(drawBloodFailure));
        callbackSuccess = QUOTE([ARR_3(_medic,_patient,500)] call FUNC(drawBloodSuccess));
        condition = QUOTE([ARR_3(_medic, _patient,500)] call FUNC(canDrawBlood));
        items[] = {"A4ES_emptyBloodBag"};
        animationPatient = "";
        animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
        animationPatientUnconsciousExcludeOn[] = {"ainjppnemstpsnonwrfldnon"};
    };
    class A4ES_DrawBlood250: CheckPulse {
        displayName = CSTRING(DrawBlood250_DisplayName);
        displayNameProgress = CSTRING(DrawBlood_Progress);
        treatmentTime = 15;
        allowedSelections[] = {"LeftArm", "RightArm"};
        allowSelfTreatment = 1;
        category = "advanced";
        medicRequired = 0;
        consumeItem = 1;
        callbackStart = QUOTE([ARR_3(_medic,_patient,250)] call FUNC(drawBloodStart));
        callbackProgress = QUOTE([ARR_2(_this,250)] call FUNC(drawBloodProgress));
        callbackFailure = QUOTE([ARR_3(_medic,_patient,250)] call FUNC(drawBloodFailure));
        callbackSuccess = QUOTE([ARR_3(_medic,_patient,250)] call FUNC(drawBloodSuccess));
        condition = QUOTE([ARR_3(_medic, _patient,250)] call FUNC(canDrawBlood));
        items[] = {"A4ES_emptyBloodBag"};
        animationPatient = "";
        animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
        animationPatientUnconsciousExcludeOn[] = {"ainjppnemstpsnonwrfldnon"};
    };
};
