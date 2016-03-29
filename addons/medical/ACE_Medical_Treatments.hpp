class ACE_Medical_Actions {
    class Advanced {
        class fieldDressing;
        class BloodIV: fieldDressing {
            allowSelfTreatment = 1;
        };
        class SurgicalKit: fieldDressing {
            allowedSelections[] = {"All"};
            allowSelfTreatment = 1;
        };
        class PersonalAidKit: fieldDressing {
            allowedSelections[] = {"All"};
            allowSelfTreatment = 1;
        };
    };
};
