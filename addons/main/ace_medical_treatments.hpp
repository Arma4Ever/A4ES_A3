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
                effectiveness = 2; //1
                reopeningChance = 0.05; //0.1
                class Abrasion {
                    effectiveness = 6; //3
                    reopeningChance = 0; //0
                };
                class AbrasionMinor: Abrasion {
                    effectiveness = 10; //5
                    reopeningChance = 0;
                };
                class AbrasionMedium: Abrasion {
                    effectiveness = 6; //3
                    reopeningChance = 0.35; //0.7
                };
                class AbrasionLarge: Abrasion {
                    effectiveness = 4; //2
                    reopeningChance = 0.45; //0.9
                };
                class Avulsions: Abrasion {
                    effectiveness = 0.4; //0.2
                    reopeningChance = 0.4; //0.8
                };
                class AvulsionsMinor: Avulsions {
                    effectiveness = 0.8; //0.4
                    reopeningChance = 0.35; //0.75
                 };
                class AvulsionsMedium: Avulsions {
                    effectiveness = 0.6; //0.3
                    reopeningChance = 0.45; //0.85
                };
                class AvulsionsLarge: Avulsions {
                    effectiveness = 0.2; //0.1
                    reopeningChance = 0.45; //0.9
                };
                class Contusion: Abrasion {
                    effectiveness = 2; //1
                    reopeningChance = 0; //0
                };
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {};
                class CrushWound: Abrasion {
                    effectiveness = 2; //1
                    reopeningChance = 0.2; //0.4
                };
                class CrushWoundMinor: CrushWound {
                    effectiveness = 2; //1
                    reopeningChance = 0.2; //0.4
                };
                class CrushWoundMedium: CrushWound {
                    effectiveness = 0.8; //0.4
                    reopeningChance = 0.15; //0.3
                };
                class CrushWoundLarge: CrushWound {
                    effectiveness = 0.4; //0.2
                    reopeningChance = 0.1; //0.2
                };
                class Cut: Abrasion {
                    effectiveness = 6; //3
                    reopeningChance = 0.15; //0.3
                };
                class CutMinor: Cut {
                    effectiveness = 12; //6
                    reopeningChance = 0.05; //0.1
                };
                class CutMedium: Cut {
                    effectiveness = 6; //3
                    reopeningChance = 0.15; //0.3
                };
                class CutLarge: Cut {
                    effectiveness = 2; //1
                    reopeningChance = 0.3; //0.6
                };
                class Laceration: Abrasion {
                    effectiveness = 1.6; //0.8
                    reopeningChance = 0.15; //0.3
                };
                class LacerationMinor: Laceration {
                    effectiveness = 1.6; //0.8
                    reopeningChance = 0.15; //0.3
                };
                class LacerationMedium: Laceration {
                    effectiveness = 1; //0.5
                    reopeningChance = 0.25; //0.5
                };
                class LacerationLarge: Laceration {
                    effectiveness = 0.6; //0.3
                    reopeningChance = 0.35; //0.7
                };
                class velocityWound: Abrasion {
                    effectiveness = 1; //0.5
                    reopeningChance = 0.35; //0.7
                };
                class velocityWoundMinor: velocityWound {
                    effectiveness = 1.6; //0.8
                    reopeningChance = 0.2; //0.4
                };
                class velocityWoundMedium: velocityWound {
                    effectiveness = 1.2; //0.6
                    reopeningChance = 0.4; //0.8
                };
                class velocityWoundLarge: velocityWound {
                    effectiveness = 0.6; //0.3
                    reopeningChance = 0.45; //0.9
                };
                class punctureWound: Abrasion {
                    effectiveness = 1.2; //0.6
                    reopeningChance = 0.15; //0.3
                };
                class punctureWoundMinor: punctureWound {
                    effectiveness = 1.6; //0.8
                    reopeningChance = 0.25; //0.5
                };
                class punctureWoundMedium: punctureWound {
                    effectiveness = 1.2; //0.6
                    reopeningChance = 0.15; //0.3
                };
                class punctureWoundLarge: punctureWound {
                    effectiveness = 0.6; //0.3
                    reopeningChance = 0.4; //0.8
                };
            };
            class PackingBandage: fieldDressing {
                class Abrasion {
                    effectiveness = 0.2; //0.1
                    reopeningChance = 0.45; //0.9
                };
                class AbrasionMinor: Abrasion {
                    effectiveness = 0.2; //0.1
                    reopeningChance = 0.45; //0.9
                };
                class AbrasionMedium: Abrasion {
                    effectiveness = 0.2; //0.1
                    reopeningChance = 0.45; //0.9
                };
                class AbrasionLarge: Abrasion {
                    effectiveness = 2; //1
                    reopeningChance = 0.45; //0.9
                };
                class Avulsions: Abrasion {
                    effectiveness = 2; //1
                    reopeningChance = 0.15; //0.3
                };
                class AvulsionsMinor: Avulsions {
                    effectiveness = 2; //1
                    reopeningChance = 0.1; //0.2
                };
                class AvulsionsMedium: Avulsions {
                    effectiveness = 1.4; //0.7
                    reopeningChance = 0.2; //0.4
                };
                class AvulsionsLarge: Avulsions {
                    effectiveness = 1; //0.5
                    reopeningChance = 0.25; //0.5
                };
                class Contusion: Abrasion {
                    effectiveness = 2; //1
                    reopeningChance = 0; //0
                };
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {
                    effectiveness = 2; //1
                    reopeningChance = 0; //0
                };
                class CrushWound: Abrasion {
                    effectiveness = 1.2; //0.6
                    reopeningChance = 0.1; //0.2
                };
                class CrushWoundMinor: CrushWound {
                    effectiveness = 1.6; //0.8
                    reopeningChance = 0.2; //0.4
                };
                class CrushWoundMedium: CrushWound {
                    effectiveness = 1.2; //0.6
                    reopeningChance = 0.3; //0.6
                };
                class CrushWoundLarge: CrushWound {
                    effectiveness = 0.8; //0.4
                    reopeningChance = 0.4; //0.8
                };
                class Cut: Abrasion {
                    effectiveness = 0.4; //0.2
                    reopeningChance = 0.2; //0.4
                };
                class CutMinor: Cut {
                    effectiveness = 2; //1
                    reopeningChance = 0.0.5; //0.1
                };
                class CutMedium: Cut {
                    effectiveness = 1; //0.5
                    reopeningChance = 0.2; //0.4
                };
                class CutLarge: Cut {
                    effectiveness = 1.4; //0.7
                    reopeningChance = 0.3; //0.6
                };
                class Laceration: Abrasion {
                    effectiveness = 1; //0.5
                    reopeningChance = 0.25; //0.5
                };
                class LacerationMinor: Laceration {
                    effectiveness = 2; //1
                    reopeningChance = 0.05; //0.1
                };
                class LacerationMedium: Laceration {
                    effectiveness = 1.4; //0.7
                    reopeningChance = 0.15; //0.3
                };
                class LacerationLarge: Laceration {
                    effectiveness = 0.6; //0.3
                    reopeningChance = 0.25; //0.5
                };
                class velocityWound: Abrasion {
                    effectiveness = 2; //1
                    reopeningChance = 0.25; //0.5
                };
                class velocityWoundMinor: velocityWound {
                    effectiveness = 2; //1
                    reopeningChance = 0.35; //0.7
                };
                class velocityWoundMedium: velocityWound {
                    effectiveness = 1.2; //0.6
                    reopeningChance = 0.3; //0.6
                };
                class velocityWoundLarge: velocityWound {
                    effectiveness = 0.6; //0.3
                    reopeningChance = 0.25; //0.5
                };
                class punctureWound: Abrasion {
                    effectiveness = 0.2; //0.1
                    reopeningChance = 0.25; //0.5
                };
                class punctureWoundMinor: punctureWound {};
                class punctureWoundMedium: punctureWound {
                    effectiveness = 0.4; //0.2
                    reopeningChance = 0.25; //0.5
                };
                class punctureWoundLarge: punctureWound {
                    effectiveness = 0.6; //0.3
                    reopeningChance = 0.25; //0.5
                };
            };
            class ElasticBandage: fieldDressing {
                class Abrasion {
                    effectiveness = 4; //0.2
                    reopeningChance = 0; //0
                };
                class AbrasionMinor: Abrasion {};
                class AbrasionMedium: Abrasion {
                    effectiveness = 3; //0.15
                };
                class AbrasionLarge: Abrasion {
                    effectiveness = 2; //1
                    reopeningChance = 0; //0
                };
                class Avulsions: Abrasion {
                    effectiveness = 0.6; //0.3
                    reopeningChance = 0.2; //0.4
                };
                class AvulsionsMinor: Avulsions {
                    effectiveness = 1.8; //0.9
                    reopeningChance = 0.1; //0.2
                };
                class AvulsionsMedium: Avulsions {
                    effectiveness = 1.4; //0.7
                    reopeningChance = 0.2; //0.4
                };
                class AvulsionsLarge: Avulsions {
                    effectiveness = 0.6; //0.3
                    reopeningChance = 0.2; //0.4
                };
                class Contusion: Abrasion {
                    effectiveness = 2; //1
                    reopeningChance = 0; //0
                };
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {};

                class CrushWound: Abrasion {
                    effectiveness = 2; //1
                    reopeningChance = 0; //0
                };
                class CrushWoundMinor: CrushWound {};
                class CrushWoundMedium: CrushWound {};
                class CrushWoundLarge: CrushWound {
                    effectiveness = 2; //1
                    reopeningChance = 0; //0
                };
                class Cut: Abrasion {
                    effectiveness = 3; //1.5
                    reopeningChance = 0.1; //0.2
                };
                class CutMinor: Cut {};
                class CutMedium: Cut {
                    effectiveness = 2.4; //1.2
                    reopeningChance = 0.15; //0.3
                };
                class CutLarge: Cut {
                    effectiveness = 2; //1
                    reopeningChance = 0.25; //0.5
                };
                class Laceration: Abrasion {
                    effectiveness = 2; //1
                    reopeningChance = 0.15; //0.3
                };
                class LacerationMinor: Laceration {};
                class LacerationMedium: Laceration {
                    effectiveness = 1.5; //0.75
                };
                class LacerationLarge: Laceration {
                    effectiveness = 1; //0.5
                    reopeningChance = 0.15; //0.3
                };
                class velocityWound: Abrasion {
                    effectiveness = 1.4; //0.7
                    reopeningChance = 0.25; //0.5
                };
                class velocityWoundMinor: velocityWound {};
                class velocityWoundMedium: velocityWound {
                    effectiveness = 1; //0.5
                };
                class velocityWoundLarge: velocityWound {
                    effectiveness = 0.5; //0.25
                    reopeningChance = 0.35; //0.7
                };
                class punctureWound: Abrasion {
                    effectiveness = 1.8; //0.9
                    reopeningChance = 0.15; //0.3
                };
                class punctureWoundMinor: punctureWound {};
                class punctureWoundMedium: punctureWound {
                    effectiveness = 1.8; //0.9
                    reopeningChance = 0.25; //0.5
                };
                class punctureWoundLarge: punctureWound {
                    effectiveness = 1.7; //0.85
                    reopeningChance = 0.35; //0.7
                };
            };
            class QuikClot: fieldDressing {
                class Abrasion {
                    effectiveness = 1.4; //0.7
                    reopeningChance = 0; //0
                };
                class AbrasionMinor: Abrasion {};
                class AbrasionMedium: Abrasion {};
                class AbrasionLarge: Abrasion {
                    effectiveness = 1.4; //0.7
                    reopeningChance = 0; //0
                };
                class Avulsions: Abrasion {
                    effectiveness = 1.2; //0.6
                    reopeningChance = 0.05; //0.1
                };
                class AvulsionsMinor: Avulsions {};
                class AvulsionsMedium: Avulsions {
                    effectiveness = 0.8; //0.4
                };
                class AvulsionsLarge: Avulsions {
                    effectiveness = 0.4; //0.2
                    reopeningChance = 0.05; //0.1
                };
                class Contusion: Abrasion {
                    effectiveness = 1.4; //0.7
                    reopeningChance = 0; //0
                };
                class ContusionMinor: Contusion {};
                class ContusionMedium: Contusion {};
                class ContusionLarge: Contusion {
                    effectiveness = 1.4; //0.7
                    reopeningChance = 0; //0
                };
                class CrushWound: Abrasion {
                    effectiveness = 2; //1
                    reopeningChance = 0; //0
                };
                class CrushWoundMinor: CrushWound {};
                class CrushWoundMedium: CrushWound {
                    effectiveness = 1.8; //0.9
                    reopeningChance = 0.025; //0.05
                };
                class CrushWoundLarge: CrushWound {
                    effectiveness = 1.4; //0.7
                    reopeningChance = 0.05; //0.1
                };
                class Cut: Abrasion {
                    effectiveness = 1.4; //0.7
                    reopeningChance = 0; //0
                };
                class CutMinor: Cut {};
                class CutMedium: Cut {
                    effectiveness = 1.2; //0.6
                    reopeningChance = 0; //0
                };
                class CutLarge: Cut {
                    effectiveness = 1; //0.5
                    reopeningChance = 0.1; //0.2
                };
                class Laceration: Abrasion {
                    effectiveness = 1.4; //0.7
                    reopeningChance = 0; //0
                };
                class LacerationMinor: Laceration {};
                class LacerationMedium: Laceration {
                    effectiveness = 1.2; //0.6
                };
                class LacerationLarge: Laceration {
                    effectiveness = 1; //0.5
                    reopeningChance = 0; //0
                };
                class velocityWound: Abrasion {
                    effectiveness = 1.4; //0.7
                    reopeningChance = 0; //0
                };
                class velocityWoundMinor: velocityWound {};
                class velocityWoundMedium: velocityWound {
                    effectiveness = 1.2; //0.6
                };
                class velocityWoundLarge: velocityWound {
                    effectiveness = 1; //0.5
                    reopeningChance = 0.05; //0.1
                };
                class punctureWound: Abrasion {
                    effectiveness = 1; //0.5
                    reopeningChance = 0.025; //0.05
                };
                class punctureWoundMinor: punctureWound {};
                class punctureWoundMedium: punctureWound {
                    effectiveness = 0.8; //0.4
                    reopeningChance = 0.05; //0.1
                };
                class punctureWoundLarge: punctureWound {
                    effectiveness = 0.6; //0.3
                    reopeningChance = 0.075; //0.15
                };
            };
        };
    };
};
