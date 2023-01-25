
/****

WIP: SzwedzikPL

****/

#define A4ES_MANUAL_AMMO_CFG manualControl = 1; \
maxControlRange = 20000; \
missileManualControlCone = 360; \
missileKeepLockedCone = 360; \
missileLockCone = 360; \
missileLockMaxDistance = 20000; \
missileLockMinDistance = 1; \
missileLockMaxSpeed = 1000; \
trackLead = 1; \
trackOversteer = 1; \
cmImmunity = 1; \
airLock = 1; \
timeToLive = 300

class CfgAmmo {
    class ammo_Bomb_LaserGuidedBase;
    class Bo_GBU12_LGB: ammo_Bomb_LaserGuidedBase {};
    class GVAR(manual_Bo_GBU12_LGB): Bo_GBU12_LGB {
        A4ES_MANUAL_AMMO_CFG;
    };
    
ammo_Missile_KH58

    Bomb_03_F
    Bomb_04_F
    ammo_Bomb_SDB


    Missile_AGM_01_F
    ammo_Missile_Cruise_01
    ammo_Missile_Cruise_01_Cluster


    M_Titan_AA
    M_Zephyr
    M_Air_AA
    Missile_AA_04_F
    Missile_AA_03_F
    ammo_Missile_rim116
    ammo_Missile_rim162
    ammo_Missile_AMRAAM_C
    ammo_Missile_AMRAAM_D
    ammo_Missile_BIM9X
    ammo_Missile_AA_R77
    ammo_Missile_AA_R73
    ammo_Missile_mim145
    ammo_Missile_s750
    ammo_Missile_HARM


    Missile_AGM_01_F
    Missile_AGM_02_F
    M_Scalpel_AT
    M_PG_AT
    M_Titan_AT
    M_Titan_AP
    M_Air_AT
    M_Jian_AT
    M_Vorona_HE
    M_Vorona_HEAT
    M_125mm_cannon_ATGM
    M_120mm_cannon_ATGM


};

private _ammo = "getNumber (_x >> 'missileKeepLockedCone') > 0" configClasses (configFile >> "CfgAmmo");
{

    diag_log (configName _x);
} forEach _ammo;

private _missile = createVehicle ["Missile_AGM_01_F", getPos spwn, [], 0, "CAN_COLLIDE"];
_missile setDir (getDir spwn);
t2 setVehicleTiPars [1,1,1];
_missile spawn {sleep 0.1;_this setMissileTarget t2;};

getPos spwn
getDir spwn

setMissile
