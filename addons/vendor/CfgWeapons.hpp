class CfgWeapons {
    class srifle_DMR_02_F;
    class srifle_DMR_02_LaserGun_F: srifle_DMR_02_F {
        scope = 1;
        scopeCurator = 0;
        scopeArsenal = 0;
        author = "Bohemia Interactive";
        magazines[] = {"XRnd_Laser_Mag"};
        displayname = "Laser gun";
        descriptionShort = "Laser gun";
        soundBullet[] = {};
        modes[] = {"Single","close","short","medium","far"};
        selectionFireAnim = "zasleh";
        fireLightDuration = 0.05;
        fireLightIntensity = 0.2;
        fireLightDiffuse[] = {0.1,0,0.0025};
        fireLightAmbient[] = {0,0,0};
        inertia = 0.3;
        dexterity = 1.7;
        initSpeed = 400;
        cursor = "EmptyCursor";
		cursorAim = "mg";
        class LinkedItems {
            class LinkedItemsOptic {
                item = "";
                slot = "";
            };
        };
        class WeaponSlotsInfo {
            allowedSlots[] = {};
            mass = 180;
            class CowsSlot {
                displayName = "Optics Slot";
                iconPicture = "\A3\Weapons_F\Data\UI\attachment_top";
                iconPinpoint = "Bottom";
                iconPosition[] = {0.5,0.36};
                iconScale = 0.2;
                linkProxy = "\A3\data_f\proxies\weapon_slots\TOP";
                scope = 0;
                class compatibleItems {
                    optic_Nightstalker = 1;
                };
            };
        };
        class Single: Mode_SemiAuto {
            sounds[] = {"StandardSound"};
            class BaseSoundModeType {
                weaponSoundEffect = "DefaultDMRLaser";
                closure1[] = {};
                closure2[] = {};
                soundClosure[] = {};
            };
            class StandardSound: BaseSoundModeType {
                weaponSoundEffect = "DefaultDMRLaser";
                begin1[] = {PATHTOF(data\lshot),1.1220185,1,1100};
                soundBegin[] = {"begin1",1};
                closure1[] = {};
                soundClosure[] = {"closure1",0.5};
            };
            reloadTime = 0.3;
			dispersion = 0;
			soundContinuous = 0;
			soundBurst = 0;
			showToPlayer = 1;
			burst = 1;
			aiRateOfFire = 0.5;
			aiRateOfFireDistance = 50;
			minRange = 1;
			minRangeProbab = 0.01;
			midRange = 2;
			midRangeProbab = 0.01;
			maxRange = 3;
			maxRangeProbab = 0.01;
			textureType = "fullAuto";
        };
        class close: Single {
			showToPlayer = 0;
			burst = 15;
			aiRateOfFire = 0.25;
			aiRateOfFireDistance = 400;
			minRange = 0;
			minRangeProbab = 0.05;
			midRange = 200;
			midRangeProbab = 0.7;
			maxRange = 400;
			maxRangeProbab = 0.2;
		};
		class short: close {
			burst = 10;
			aiRateOfFire = 0.5;
			aiRateOfFireDistance = 500;
			minRange = 300;
			minRangeProbab = 0.2;
			midRange = 400;
			midRangeProbab = 0.7;
			maxRange = 500;
			maxRangeProbab = 0.2;
		};
		class medium: close {
			burst = 7;
			aiRateOfFire = 1;
			aiRateOfFireDistance = 900;
			minRange = 400;
			minRangeProbab = 0.2;
			midRange = 700;
			midRangeProbab = 0.7;
			maxRange = 900;
			maxRangeProbab = 0.2;
		};
		class far: close {
			burst = 4;
			aiRateOfFire = 1.5;
			aiRateOfFireDistance = 1500;
			minRange = 800;
			minRangeProbab = 0.2;
			midRange = 1000;
			midRangeProbab = 0.4;
			maxRange = 1500;
			maxRangeProbab = 0.01;
		};
    };
};
