class ACE_Medical_Treatment_Actions {
    class BasicBandage {};
    class FieldDressing: BasicBandage {};

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
        callbackSuccess = QFUNC(onSurgicalKitSuccess);
    };

    class Morphine;
    class A3CS_painkillers: Morphine {
        displayName = CSTRING(Painkillers_DisplayName);
        displayNameProgress = CSTRING(Painkillers_Progress);
        allowedSelections[] = {"head"};
        items[] = {"A3CS_painkillers"};
        icon = QPATHTOF(data\painkillers_icon_ca.paa);
        condition = "";
        callbackSuccess = QUOTE(call ACEFUNC(medical_treatment,medication));
    };
};
