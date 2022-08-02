class CfgAmmo {
    class ammo_Missile_Cruise_01;
    class GVAR(JASSM): ammo_Missile_Cruise_01 {
        author = "Dani (TCVM) / SzwedzikPL";
        model = "\a3\weapons_f_sams\Ammo\Bomb_06_F_fly";
        proxyShape = "\a3\weapons_f_sams\Ammo\Bomb_06_F";
        maneuvrability = 0;
        initTime = 3;
        timeToLive = 600;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 20;
            yawRate = 20;

            canVanillaLock = 0;

            defaultSeekerType = "GPS";
            seekerTypes[] = {"GPS"};

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = {"LOBL"};

            defaultNavigationType = "LINE";
            navigationTypes[] = {"LINE"};

            lineGainP = 50;
            lineGainD = 0;

            seekLastTargetPos = 0;
            seekerAngle = 180;
            seekerAccuracy = 1;

            seekerMinRange = 5;
            seekerMaxRange = 50000;

            defaultAttackProfile = "JDAM";
            attackProfiles[] = {"JDAM"};
        };
    };
    class GVAR(JASSM_cluster): GVAR(JASSM) {
        class ace_missileguidance: ace_missileguidance {};

        triggerDistance = 250;
		triggerSpeedCoef[] = {0.5,1};
		submunitionConeAngle = 19;
		submunitionConeType[] = {"randomcenter", 50};
		submunitionAmmo[] = {"Mo_cluster_AP", 0.93, "Mo_cluster_AP_UXO_deploy", 0.07};
	};

    class GVAR(AGM84): ammo_Missile_Cruise_01 {
        author = "Dani (TCVM) / Krzyciu";
        model = "a3\weapons_f_destroyer\Ammo\Missile_Cruise_01_Fly_F.p3d";
        proxyShape = "a3\weapons_f_destroyer\Ammo\Missile_Cruise_01_F.p3d";
        initTime = 1;
        timeToLive = 500;
        cameraViewAvailable = 1;
        maxSpeed = 400;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 30;
            yawRate = 30;

            canVanillaLock = 1;

            defaultSeekerType = "DopplerRadar";
            seekerTypes[] = { "DopplerRadar" };
            lockableTypes[] = {"Ship"};

            maxTerrainCheck = 16000;

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = { "LOAL", "LOBL" };

            defaultNavigationType = "ZeroEffortMiss";
            navigationTypes[] = { "ZeroEffortMiss" };

            seekLastTargetPos = 0;
            seekerAngle = 180;
            seekerAccuracy = 1;

            seekerMinRange = 20;
            seekerMaxRange = 16000;

            defaultAttackProfile = "JDAM";
            attackProfiles[] = {"JDAM"};
        };
    };

    class GVAR(C802AK): ammo_Missile_Cruise_01 {
        author = "Dani (TCVM) / Krzyciu";
        model = "a3\weapons_f_destroyer\Ammo\Missile_Cruise_01_Fly_F.p3d";
        proxyShape = "a3\weapons_f_destroyer\Ammo\Missile_Cruise_01_F.p3d";
        initTime = 1;
        timeToLive = 500;
        cameraViewAvailable = 1;
        maxSpeed = 500;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 30;
            yawRate = 30;

            canVanillaLock = 1;

            defaultSeekerType = "DopplerRadar";
            seekerTypes[] = { "DopplerRadar" };
            lockableTypes[] = {"Ship"};

            maxTerrainCheck = 16000;

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = { "LOAL", "LOBL" };

            defaultNavigationType = "AugmentedProportionalNavigation";
            navigationTypes[] = { "AugmentedProportionalNavigation" };

            seekLastTargetPos = 0;
            seekerAngle = 180;
            seekerAccuracy = 1;

            seekerMinRange = 20;
            seekerMaxRange = 14000;

            defaultAttackProfile = "JDAM";
            attackProfiles[] = {"JDAM"};
        };
    };

    class GVAR(ATACMS): ammo_Missile_Cruise_01 {
        author = "Dani (TCVM) / SzwedzikPL";
        maneuvrability = 0;
        timeToLive = 600;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 20;
            yawRate = 20;

            canVanillaLock = 0;

            defaultSeekerType = "GPS";
            seekerTypes[] = {"GPS"};

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = {"LOBL"};

            defaultNavigationType = "LINE";
            navigationTypes[] = {"LINE"};

            lineGainP = 50;
            lineGainD = 0;

            seekLastTargetPos = 0;
            seekerAngle = 180;
            seekerAccuracy = 1;

            seekerMinRange = 5;
            seekerMaxRange = 50000;

            defaultAttackProfile = "ATACMS";
            attackProfiles[] = {"ATACMS"};
        };
    };
    class GVAR(ATACMS_cluster): GVAR(ATACMS) {
        class ace_missileguidance: ace_missileguidance {};

        triggerDistance = 250;
		triggerSpeedCoef[] = {0.5,1};
		submunitionConeAngle = 19;
		submunitionConeType[] = {"randomcenter", 50};
		submunitionAmmo[] = {"Mo_cluster_AP", 0.93, "Mo_cluster_AP_UXO_deploy", 0.07};
	};
};
