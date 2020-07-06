class CfgAmmo {
    class BulletBase;
    class DMR_Laser_Ammo: BulletBase {
        hit = 14;
        indirectHit = 0.1;
        indirectHitRange = 0.2;
        explosive = 0.4;
        caliber = 5;
        cartridge = "";
        cost = 1;
        model = "\A3\Weapons_f\Data\bullettracer\tracer_red.p3d";
        tracerScale = 1.5;
        tracerStartTime = 0;
        tracerEndTime = 10;
        nvgOnly = 0;
        typicalSpeed = 60;
        visibleFire = 3;
        audibleFire = 5;
        visibleFireTime = 4;
        dangerRadiusBulletClose = 16;
        dangerRadiusHit = 40;
        suppressionRadiusBulletClose = 10;
        suppressionRadiusHit = 14;
        soundHit1[] = {PATHTOF(data\lhit),1.9952624,1,120};
        soundHit2[] = {PATHTOF(data\lhit),1.9952624,1,120};
        soundHit3[] = {PATHTOF(data\lhit),1.9952624,1,120};
        soundHit4[] = {PATHTOF(data\lhit),1.9952624,1,120};
        soundHit5[] = {PATHTOF(data\lhit),1.9952624,1,120};
        soundHit6[] = {PATHTOF(data\lhit),1.9952624,1,120};
        multiSoundHit[] = {"soundHit1",0.2,"soundHit2",0.2,"soundHit3",0.2,"soundHit4",0.1,"soundHit5",0.15,"soundHit6",0.15};
        explosionSoundEffect = "DefaultExplosion";
        airLock = 0;
        CraterEffects = "ExploAmmoLaserCrater";
        explosionEffects = "LaserExploSmall";
        effectFly = "RedLaserEffect";
        airFriction = 0;
        muzzleEffect = "";
        deflecting = 0;
        initTime = 0;
        gravityFactor = 0;
        coefGravity = 0;
        supersonicCrackNear[] = {};
        supersonicCrackFar[] = {};
        class SuperSonicCrack {
            superSonicCrack[] = {};
            class A {
                range[] = {0,10};
                sound[] = {};
                frequency = "((speed factor [330, 930]) * 0.1) + 1.05";
            };
            class B {
                range[] = {10,30};
                sound[] = {};
                frequency = "((speed factor [330, 930]) * 0.1) + 1.05";
            };
            class C {
                range[] = {30,500};
                sound[] = {};
                frequency = "((speed factor [330, 930]) * 0.1) + 1.05";
            };
        };
    };
};
