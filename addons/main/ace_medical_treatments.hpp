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

class ACE_Medical_Advanced {
    class Treatment {
        class Bandaging {
            class FieldDressing {
                // How effect is the bandage for treating one wounds type injury
                effectiveness = 1;
                // What is the chance and delays (in seconds) of the treated default injury reopening
                reopeningChance = 0.1;
                reopeningMinDelay = 120;
                reopeningMaxDelay = 200;
                class Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class AbrasionMinor: Abrasion {};
                class AbrasionMedium: Abrasion {};
                class AbrasionLarge: Abrasion {};
                class Avulsions: Abrasion {
                    effectiveness = 0.3;
                    reopeningChance = 0.25; //0.5
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 200;
                };
                class AvulsionsMinor: Avulsions {};
                class AvulsionsMedium: Avulsions {};
                class AvulsionsLarge: Avulsions {};
                class Contusion: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {};
                class CrushWound: Abrasion {
                    effectiveness = 0.6;
                    reopeningChance = 0.1; //0.2
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 200;
                };
                class CrushWoundMinor: CrushWound {};
                class CrushWoundMedium: CrushWound {};
                class CrushWoundLarge: CrushWound {};
                class Cut: Abrasion {
                    effectiveness = 0.4;
                    reopeningChance = 0.25; //0.5
                    reopeningMinDelay = 220;
                    reopeningMaxDelay = 260;
                };
                class CutMinor: Cut {};
                class CutMedium: Cut {};
                class CutLarge: Cut {};

                class Laceration: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0.15; //0.3
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 260;
                };
                class LacerationMinor: Laceration {};
                class LacerationMedium: Laceration {};
                class LacerationLarge: Laceration {};

                class velocityWound: Abrasion {
                    effectiveness = 0.3;
                    reopeningChance = 0.4; //0.8
                    reopeningMinDelay = 20;
                    reopeningMaxDelay = 300;
                };
                class velocityWoundMinor: velocityWound {};
                class velocityWoundMedium: velocityWound {};
                class velocityWoundLarge: velocityWound {};
                class punctureWound: Abrasion {
                    effectiveness = 0.5;
                    reopeningChance = 0.4; //0.8
                    reopeningMinDelay = 20;
                    reopeningMaxDelay = 300;
                };
                class punctureWoundMinor: punctureWound {};
                class punctureWoundMedium: punctureWound {};
                class punctureWoundLarge: punctureWound {};
            };
            class PackingBandage: fieldDressing {
                class Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class AbrasionMinor: Abrasion {};
                class AbrasionMedium: Abrasion {};
                class AbrasionLarge: Abrasion {};
                class Avulsions: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.15; //0.3
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 200;
                };
                class AvulsionsMinor: Avulsions {};
                class AvulsionsMedium: Avulsions {};
                class AvulsionsLarge: Avulsions {};
                class Contusion: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {};
                class CrushWound: Abrasion {
                    effectiveness = 0.6;
                    reopeningChance = 0.1; //0.2
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 200;
                };
                class CrushWoundMinor: CrushWound {};
                class CrushWoundMedium: CrushWound {};
                class CrushWoundLarge: CrushWound {};
                class Cut: Abrasion {
                    effectiveness = 0.2;
                    reopeningChance = 0.3; //0.6
                    reopeningMinDelay = 30;
                    reopeningMaxDelay = 260;
                };
                class CutMinor: Cut {};
                class CutMedium: Cut {};
                class CutLarge: Cut {};
                class Laceration: Abrasion {
                    effectiveness = 0.3;
                    reopeningChance = 0.15; //0.3
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 260;
                };
                class LacerationMinor: Laceration {};
                class LacerationMedium: Laceration {};
                class LacerationLarge: Laceration {};
                class velocityWound: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.25; //0.5
                    reopeningMinDelay = 20;
                    reopeningMaxDelay = 300;
                };
                class velocityWoundMinor: velocityWound {};
                class velocityWoundMedium: velocityWound {};
                class velocityWoundLarge: velocityWound {};
                class punctureWound: Abrasion {
                    effectiveness = 0.3;
                    reopeningChance = 0.25; //0.5
                    reopeningMinDelay = 20;
                    reopeningMaxDelay = 300;
                };
                class punctureWoundMinor: punctureWound {};
                class punctureWoundMedium: punctureWound {};
                class punctureWoundLarge: punctureWound {};
            };
            class ElasticBandage: fieldDressing {
                class Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class AbrasionMinor: Abrasion {};
                class AbrasionMedium: Abrasion {};
                class AbrasionLarge: Abrasion {};
                class Avulsions: Abrasion {
                    effectiveness = 0.3;
                    reopeningChance = 0.2; //0.4
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 200;
                };
                class AvulsionsMinor: Avulsions {};
                class AvulsionsMedium: Avulsions {};
                class AvulsionsLarge: Avulsions {};
                class Contusion: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {};
                class CrushWound: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class CrushWoundMinor: CrushWound {};
                class CrushWoundMedium: CrushWound {};
                class CrushWoundLarge: CrushWound {};
                class Cut: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.1; //0.2
                    reopeningMinDelay = 10;
                    reopeningMaxDelay = 400;
                };
                class CutMinor: Cut {};
                class CutMedium: Cut {};
                class CutLarge: Cut {};
                class Laceration: Abrasion {
                    effectiveness = 1;
                    reopeningChance = 0.15; //0.3
                    reopeningMinDelay = 120;
                    reopeningMaxDelay = 260;
                };
                class LacerationMinor: Laceration {};
                class LacerationMedium: Laceration {};
                class LacerationLarge: Laceration {};
                class velocityWound: Abrasion {
                    effectiveness = 0.5;
                    reopeningChance = 0.25; // 0.5
                    reopeningMinDelay = 20;
                    reopeningMaxDelay = 300;
                };
                class velocityWoundMinor: velocityWound {};
                class velocityWoundMedium: velocityWound {};
                class velocityWoundLarge: velocityWound {};
                class punctureWound: Abrasion {
                    effectiveness = 0.85;
                    reopeningChance = 0.25; // 0.5
                    reopeningMinDelay = 20;
                    reopeningMaxDelay = 300;
                };
                class punctureWoundMinor: punctureWound {};
                class punctureWoundMedium: punctureWound {};
                class punctureWoundLarge: punctureWound {};
            };
            class QuikClot: fieldDressing {
                class Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class AbrasionMinor: Abrasion {};
                class AbrasionMedium: Abrasion {};
                class AbrasionLarge: Abrasion {};
                class Avulsions: Abrasion {
                    effectiveness = 0.2;
                    reopeningChance = 0.1; //0.1
                    reopeningMinDelay = 300;
                    reopeningMaxDelay = 350;
                };
                class AvulsionsMinor: Avulsions {};
                class AvulsionsMedium: Avulsions {};
                class AvulsionsLarge: Avulsions {};
                class Contusion: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {};
                class CrushWound: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class CrushWoundMinor: CrushWound {};
                class CrushWoundMedium: CrushWound {};
                class CrushWoundLarge: CrushWound {};
                class Cut: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0.1; // 0.2
                    reopeningMinDelay = 100;
                    reopeningMaxDelay = 400;
                };
                class CutMinor: Cut {};
                class CutMedium: Cut {};
                class CutLarge: Cut {};
                class Laceration: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0;
                    reopeningMinDelay = 0;
                    reopeningMaxDelay = 0;
                };
                class LacerationMinor: Laceration {};
                class LacerationMedium: Laceration {};
                class LacerationLarge: Laceration {};
                class velocityWound: Abrasion {
                    effectiveness = 0.7;
                    reopeningChance = 0.1; // 0.1
                    reopeningMinDelay = 200;
                    reopeningMaxDelay = 300;
                };
                class velocityWoundMinor: velocityWound {};
                class velocityWoundMedium: velocityWound {};
                class velocityWoundLarge: velocityWound {};
                class punctureWound: Abrasion {
                    effectiveness = 0.5;
                    reopeningChance = 0.1; //0.1
                    reopeningMinDelay = 200;
                    reopeningMaxDelay = 300;
                };
                class punctureWoundMinor: punctureWound {};
                class punctureWoundMedium: punctureWound {};
                class punctureWoundLarge: punctureWound {};
            };
        };
    };
};
