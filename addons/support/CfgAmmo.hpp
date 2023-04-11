
#define A4ES_MANUAL_AMMO_CFG manualControl = 1; \
maxControlRange = 64000; \
missileManualControlCone = 360; \
missileKeepLockedCone = 360; \
missileLockCone = 360; \
missileLockMaxDistance = 64000; \
missileLockMinDistance = 1; \
missileLockMaxSpeed = 1000; \
trackLead = 1; \
trackOversteer = 1; \
cmImmunity = 1; \
airLock = 1; \
timeToLive = 600

#define A4ES_MANUAL_THRUST_TIME thrustTime = 600

class CfgAmmo {
    class MissileCore;
    class MissileBase: MissileCore {
        class Components;
    };

    class ammo_Missile_ShortRangeAABase: MissileBase {};
    class ammo_Missile_MediumRangeAABase: MissileBase {};
    class ammo_Missile_LongRangeAABase: MissileBase {};
    class ammo_Missile_AntiRadiationBase: MissileBase {};
    class ammo_Bomb_LaserGuidedBase;
    class ammo_Bomb_SmallDiameterBase: ammo_Bomb_LaserGuidedBase {};

    class M_PG_AT: MissileBase {};
    class M_Scalpel_AT: MissileBase {};
    class M_Titan_AA: MissileBase {};
    class M_Zephyr: M_Titan_AA {};
    class M_Titan_AT: MissileBase {};
    class M_Air_AA: MissileBase {};
    class Missile_AA_04_F: MissileBase {};
    class Missile_AA_03_F: Missile_AA_04_F {};
    class Missile_AGM_02_F: MissileBase {};
    class Missile_AGM_01_F: Missile_AGM_02_F {};
    class M_Mo_82mm_AT: MissileBase {};
    class M_Mo_120mm_AT: M_Mo_82mm_AT {};
    class Rocket_04_HE_F: MissileBase {};

    class GVAR(manual_M_PG_AT): M_PG_AT {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_M_Scalpel_AT): M_Scalpel_AT {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_M_Titan_AA): M_Titan_AA {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_M_Zephyr): M_Zephyr {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_M_Titan_AT): M_Titan_AT {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_M_Air_AA): M_Air_AA {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_Missile_AA_04_F): Missile_AA_04_F {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_Missile_AA_03_F): Missile_AA_03_F {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_Missile_AGM_02_F): Missile_AGM_02_F {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_Missile_AGM_01_F): Missile_AGM_01_F {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_M_Mo_82mm_AT): M_Mo_82mm_AT {
        A4ES_MANUAL_AMMO_CFG;
    };
    class GVAR(manual_M_Mo_120mm_AT): M_Mo_120mm_AT {
        A4ES_MANUAL_AMMO_CFG;
    };
    class GVAR(manual_Rocket_04_HE_F): Rocket_04_HE_F {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };

    class ammo_Missile_rim116: ammo_Missile_ShortRangeAABase {};
    class ammo_Missile_rim162: ammo_Missile_MediumRangeAABase {};
    class ammo_Missile_AMRAAM_C: ammo_Missile_MediumRangeAABase {};
    class ammo_Missile_AMRAAM_D: ammo_Missile_MediumRangeAABase {};
    class ammo_Missile_BIM9X: ammo_Missile_ShortRangeAABase {};
    class ammo_Missile_AA_R77: ammo_Missile_MediumRangeAABase {};
    class ammo_Missile_AA_R73: ammo_Missile_ShortRangeAABase {};

    class GVAR(manual_ammo_Missile_rim116): ammo_Missile_rim116 {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_ammo_Missile_rim162): ammo_Missile_rim162 {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_ammo_Missile_AMRAAM_C): ammo_Missile_AMRAAM_C {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_ammo_Missile_AMRAAM_D): ammo_Missile_AMRAAM_D {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_ammo_Missile_BIM9X): ammo_Missile_BIM9X {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_ammo_Missile_AA_R77): ammo_Missile_AA_R77 {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_ammo_Missile_AA_R73): ammo_Missile_AA_R73 {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };

    class Bo_GBU12_LGB: ammo_Bomb_LaserGuidedBase {};
    class Bomb_03_F: ammo_Bomb_LaserGuidedBase {};
    class ammo_Missile_mim145: ammo_Missile_LongRangeAABase {};
    class ammo_Missile_s750: ammo_Missile_mim145 {};
    class ammo_Missile_HARM: ammo_Missile_AntiRadiationBase {};
    class ammo_Bomb_SDB: ammo_Bomb_SmallDiameterBase {};
    class ammo_Missile_KH58: ammo_Missile_AntiRadiationBase {};

    class GVAR(manual_Bo_GBU12_LGB): Bo_GBU12_LGB {
        A4ES_MANUAL_AMMO_CFG;
    };
    class GVAR(manual_Bomb_03_F): Bomb_03_F {
        A4ES_MANUAL_AMMO_CFG;
    };
    class GVAR(manual_ammo_Missile_mim145): ammo_Missile_mim145 {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_ammo_Missile_s750): ammo_Missile_s750 {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_ammo_Missile_HARM): ammo_Missile_HARM {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
    class GVAR(manual_ammo_Bomb_SDB): ammo_Bomb_SDB {
        A4ES_MANUAL_AMMO_CFG;
    };
    class GVAR(manual_ammo_Missile_KH58): ammo_Missile_KH58 {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };

    // ammo_Missile_Cruise_01_Cluster
    class ammo_Missile_CruiseBase: MissileBase {
        hit = 12800; //6000
        indirectHit = 2800; //2000
        indirectHitRange = 25; //30
        timeToLive = 420; //205
        thrustTime = 415; // timeToLive - 5
        dangerRadiusHit = 2000; //2000
        suppressionRadiusHit = 200; //200
        missileLockMaxDistance = 64000; //32000
        explosionAngle = 85; //60
        explosionEffects = "A4ES_VLSExplosion";

        class Components: Components {
            class SensorsManagerComponent {
                class Components {
                    class DataLinkSensorComponent: SensorTemplateDataLink {
                        class AirTarget {
                            minRange = 64000;
                            maxRange = 64000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                        class GroundTarget {
                            minRange = 64000;
                            maxRange = 64000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                    };
                };
            };
        };
    };

    class ammo_Missile_Cruise_01: ammo_Missile_CruiseBase {};
    class ammo_Missile_Cruise_01_Cluster: ammo_Missile_Cruise_01 {};

    class GVAR(manual_ammo_Missile_Cruise_01): ammo_Missile_Cruise_01 {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };

    class GVAR(manual_ammo_Missile_Cruise_01_Cluster): ammo_Missile_Cruise_01_Cluster {
        A4ES_MANUAL_AMMO_CFG;
        A4ES_MANUAL_THRUST_TIME;
    };
};
