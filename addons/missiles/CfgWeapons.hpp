class CfgWeapons {
    class LauncherCore;
    class RocketPods: LauncherCore {};
    class weapon_AGM_65Launcher: RocketPods {};

    class MissileLauncher: LauncherCore {};
    class Missile_AGM_02_Plane_CAS_01_F: MissileLauncher {};

    class GVAR(JASSM_Launcher): weapon_AGM_65Launcher {
        author = "Dani (TCVM) / SzwedzikPL";
        displayname = CSTRING(JASSM);
        magazines[] = {
            QGVAR(JASSM_magazine_x1),
            QGVAR(JASSM_pylonmissile_x1),
            QGVAR(JASSM_pylonRack_1Rnd),
            QGVAR(JASSM_PylonRack_x1)
        };
        weaponLockDelay = 0.1;
        weaponLockSystem = 0;

        ace_laser_canSelect = 1;
        ace_laser_showHud = 1;
    };

    class GVAR(JASSM_Launcher_Plane): Missile_AGM_02_Plane_CAS_01_F {
        author = "Dani (TCVM) / SzwedzikPL";
        displayname = CSTRING(JASSM);
        magazines[] = {
            QGVAR(JASSM_magazine_x1),
            QGVAR(JASSM_pylonmissile_x1),
            QGVAR(JASSM_pylonRack_1Rnd),
            QGVAR(JASSM_PylonRack_x1)
        };
        weaponLockDelay = 0.1;
        weaponLockSystem = 0;

        ace_laser_canSelect = 1;
        ace_laser_showHud = 1;
    };
};
