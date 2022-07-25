class CfgAmmo {
    class ammo_Missile_Cruise_01;
    class GVAR(JASSM) : ammo_Missile_Cruise_01 {
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
};
