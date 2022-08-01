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

    class GVAR(JASSM_cluster_Launcher): weapon_AGM_65Launcher {
        author = "Dani (TCVM) / SzwedzikPL";
        displayname = CSTRING(JASSM_cluster);
        magazines[] = {
            QGVAR(JASSM_cluster_magazine_x1),
            QGVAR(JASSM_cluster_pylonmissile_x1),
            QGVAR(JASSM_cluster_pylonRack_1Rnd),
            QGVAR(JASSM_cluster_PylonRack_x1)
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
    class GVAR(JASSM_cluster_Launcher_Plane): Missile_AGM_02_Plane_CAS_01_F {
        author = "Dani (TCVM) / SzwedzikPL";
        displayname = CSTRING(JASSM_cluster);
        magazines[] = {
            QGVAR(JASSM_cluster_magazine_x1),
            QGVAR(JASSM_cluster_pylonmissile_x1),
            QGVAR(JASSM_cluster_pylonRack_1Rnd),
            QGVAR(JASSM_cluster_PylonRack_x1)
        };
        weaponLockDelay = 0.1;
        weaponLockSystem = 0;
        ace_laser_canSelect = 1;
        ace_laser_showHud = 1;
    };

    class GVAR(AGM84_Launcher): weapon_AGM_65Launcher {
        author = "Dani (TCVM) / Krzyciu";
        displayname = CSTRING(AGM84);
        magazines[] = {
            QGVAR(AGM84_magazine_x1),
            QGVAR(AGM84_pylonmissile_x1),
            QGVAR(AGM84_PylonRack_x1),
            QGVAR(AGM84_pylonRack_1Rnd)
        };
        weaponLockDelay = 0.5;
        weaponLockSystem = 0;
        ace_laser_canSelect = 1;
        ace_laser_showHud = 1;
    };

    class GVAR(AGM84_Launcher_Plane): Missile_AGM_02_Plane_CAS_01_F {
        author = "Dani (TCVM) / Krzyciu";
        displayname = CSTRING(AGM84);
        magazines[] = {
            QGVAR(AGM84_magazine_x1),
            QGVAR(AGM84_pylonmissile_x1),
            QGVAR(AGM84_PylonRack_x1),
            QGVAR(AGM84_pylonRack_1Rnd)
        };
        weaponLockDelay = 0.5;
        weaponLockSystem = 0;
        ace_laser_canSelect = 1;
        ace_laser_showHud = 1;
    };

    class weapon_AGM_KH25Launcher: MissileLauncher {};
    class GVAR(C802AK_Launcher): weapon_AGM_KH25Launcher {
        author = "Dani (TCVM) / Krzyciu";
        displayname = CSTRING(C802AK);
        magazines[] = {
            QGVAR(C802AK_magazine_x1),
            QGVAR(C802AK_pylonmissile_x1),
            QGVAR(C802AK_PylonRack_x1)
        };
        weaponLockDelay = 0.5;
        weaponLockSystem = 0;
        ace_laser_canSelect = 1;
        ace_laser_showHud = 1;
    };
};
