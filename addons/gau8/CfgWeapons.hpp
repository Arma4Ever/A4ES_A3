
class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class CfgWeapons {

    class CannonCore;
    class Gatling_30mm_Plane_CAS_01_F: CannonCore {
        displayName = "GAU-8";
        canLock = 2;
        dispersion = 0.0082;
        modes[] = {"autoLO", "close", "near", "short", "medium", "far"};
        autoFire = 0;
        burst = 10;
        class GunParticles {
            class Effect {
                effectName = "MachineGun3";
                positionName = "Gatling_barrels_end";
                directionName = "Gatling_barrels_start";
            };
        };
        class autoLO: Mode_FullAuto {
            displayName = "LO";
            displayNameShort = "LO";
            reloadTime = 0.012;
            dispersion = 0.0082;
            sounds[] = {"StandardSound"};
            class StandardSound {
                begin1[] = {"A3\Sounds_F_EPC\Weapons\gau_03_burst", 2.5118864, 1, 4500, { 25704,32159 }};
                soundBegin[] = {"begin1",1};
            };
            soundBurst = 1;
            soundContinuous = 1;
            autoFire = 1;
            burst = 10;
            flash = "gunfire";
            flashSize = 0.1;
            recoil = "Empty";
            aiDispersionCoefX = 10;
            aiDispersionCoefY = 10;
            ffMagnitude = 0.5;
            ffFrequency = 11;
            ffCount = 6;
            minRange = 1;
            minRangeProbab = 0.06;
            midRange = 2;
            midRangeProbab = 0.06;
            maxRange = 3;
            maxRangeProbab = 0.004;
            showToPlayer = 1;
            textureType = "fullAuto";
        };

        class close: autoLO {
            showToPlayer = 0;
            burst = 25;
            aiRateOfFire = 0.25;
            aiRateOfFireDistance = 400;
            minRange = 1;
            minRangeProbab = 0.35;
            midRange = 200;
            midRangeProbab = 0.88;
            maxRange = 400;
            maxRangeProbab = 0.3;
        };
        class near: close {
            showToPlayer = 0;
            burst = 20;
            aiRateOfFire = 0.25;
            aiRateOfFireDistance = 400;
            minRange = 1;
            minRangeProbab = 0.35;
            midRange = 150;
            midRangeProbab = 0.88;
            maxRange = 300;
            maxRangeProbab = 0.3;
        };
        class short: close {
            burst = 15;
            aiRateOfFire = 0.5;
            aiRateOfFireDistance = 600;
            minRange = 200;
            minRangeProbab = 0.3;
            midRange = 400;
            midRangeProbab = 0.88;
            maxRange = 600;
            maxRangeProbab = 0.3;
        };
        class medium: close {
            burst = 10;
            aiRateOfFire = 1;
            aiRateOfFireDistance = 900;
            minRange = 400;
            minRangeProbab = 0.3;
            midRange = 700;
            midRangeProbab = 0.78;
            maxRange = 900;
            maxRangeProbab = 0.2;
        };
        class far: close {
            burst = 5;
            aiRateOfFire = 1.5;
            aiRateOfFireDistance = 1500;
            minRange = 800;
            minRangeProbab = 0.2;
            midRange = 1000;
            midRangeProbab = 0.6;
            maxRange = 1500;
            maxRangeProbab = 0.1;
        };
    };
};
