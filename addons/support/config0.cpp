#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3cs_common",
            "CBA_Extended_EventHandlers"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class cfgMagazines {
  class PylonMissile_1Rnd_Mk82_F;
  class itc_hp_harpoon_itc_ammo_jassm : PylonMissile_1Rnd_Mk82_F {
      ammo = "itc_ammo_jassm";
      displayName = "[TEST] AGM-158 JASSM";
      displayNameShort = "JASSM";
      pylonWeapon = "itc_air_weapon_jassm";
      mass = 675;
      hardpoints[] = {"itc_hp_harpoon"};
  };
};

class CfgWeapons {
  class Missile_AGM_02_Plane_CAS_01_F;
  class itc_air_weapon_jassm : Missile_AGM_02_Plane_CAS_01_F {
    displayName = "[TEST] AGM-158 JASSM";
    magazines[] = {"itc_hp_harpoon_itc_ammo_jassm"};
    modes[] = {"Direct"};
  };
};

class cfgAmmo {
  class ammo_Missile_Cruise_01;
  class itc_ammo_jassm : ammo_Missile_Cruise_01 {
    displayName = "[TEST] AGM-158 JASSM";
    manualControl = 1;
    maxControlRange = 100000;

    model = "\a3\weapons_f_sams\Ammo\Bomb_06_F_fly";
    proxyShape = "\a3\weapons_f_sams\Ammo\Bomb_06_F";
    seekers[] = {"gps"};
    autoSeekTarget = 0;
    laserLock = 0;
    weaponType = "missile";
    flightProfiles[] = {"Direct"};
    timeToLive = 800;
    muzzleEffect = "";
    initTime = 2;
    explosionAngle = 60;
    hit = 6000;
    indirectHit = 2000;
    indirectHitRange = 30;
    class Direct {
      ascendHeight = 150.0;
      descendDistance = 200.0;
      minDistance = 150.0;
      ascendAngle = 70.0;
    };
    class Components {};
  };
  class itc_ammo_jassm_helper : itc_ammo_jassm {
    timeToLive = 0.1;
    ace_frag_force = 1;
  };
};
