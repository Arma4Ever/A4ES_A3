
class CfgAmmo {
    class BulletBase;

    // also adjust tracer, "muh lightshow"; also adjust splash damage radius
    class Gatling_30mm_HE_Plane_CAS_01_F: BulletBase {
        hit = 80;
        indirectHit = 12;
        indirectHitRange = 3; //2;
        caliber = 1.4;
        deflecting = 3;
        fuseDistance = 3;
        tracerStartTime = 0.02;
        timeToLive = 40;
    };

    // GAU-8 Mix ammo (AP&HE)
    class ACE_GAU8_30mm_Mix_Plane_CAS_01_F: Gatling_30mm_HE_Plane_CAS_01_F {
        hit = 120;
        indirectHit = 80;
        indirectHitRange = 3.5;
        caliber = 4.16;
        airFriction = -0.00036;
        explosive = 0.35;
        typicalSpeed = 1036;
        //soundHit1[] = {PATHTOF(sounds\GAU8_Hit1),3.162278,1,2000};
        //multiSoundHit[] = {"soundHit1",1};
        explosionSoundEffect = "DefaultExplosion";
        explosionEffects = "Gau8ShellImpact";
        muzzleEffect = ""; //replaced with Fired EH couse this not support fncs from preinit
        craterEffects = "HEShellCrater";
        tracersEvery = 0;
    };

    // adjust damage and splash damage, closer to bluefor gatling with same caliber
    class Cannon_30mm_HE_Plane_CAS_02_F: Gatling_30mm_HE_Plane_CAS_01_F {
        hit = 70; //40;
        indirectHit = 11; //14;
        indirectHitRange = 3;
    };
};
