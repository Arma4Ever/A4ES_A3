class ACE_Medical_Actions {
    class Advanced {
        class fieldDressing;
        class BloodIV: fieldDressing {
            allowSelfTreatment = 1;
        };
        class BloodIV_500: BloodIV {};
        class BloodIV_250: BloodIV {};
        class PlasmaIV: BloodIV {};
        class PlasmaIV_500: PlasmaIV {};
        class PlasmaIV_250: PlasmaIV {};
        class SalineIV: BloodIV {};
        class SalineIV_500: SalineIV {};
        class SalineIV_250: SalineIV {};
        class SurgicalKit: fieldDressing {
            allowedSelections[] = {"All"};
            allowSelfTreatment = 1;
        };
        class PersonalAidKit {
            allowedSelections[] = {"All"};
            allowSelfTreatment = 1;
        };
    };
};
