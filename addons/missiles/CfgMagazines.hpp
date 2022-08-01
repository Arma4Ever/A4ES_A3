class CfgMagazines {
    class CA_Magazine;
    class VehicleMagazine: CA_Magazine {};

    class magazine_Missile_AGM_02_x1: VehicleMagazine {};
    class PylonMissile_Missile_AGM_02_x1: magazine_Missile_AGM_02_x1 {};

    class 6Rnd_Missile_AGM_02_F: VehicleMagazine {};
    class PylonRack_1Rnd_Missile_AGM_02_F: 6Rnd_Missile_AGM_02_F {};

    class PylonRack_Missile_AGM_02_x1: magazine_Missile_AGM_02_x1 {};


    class GVAR(JASSM_magazine_x1): magazine_Missile_AGM_02_x1 {
        ammo = QGVAR(JASSM);
        author = "Dani (TCVM) / SzwedzikPL";
        descriptionShort = CSTRING(JASSM_MAG_DESCR);
        displayName = CSTRING(JASSM_MAG_x1);
        displayNameShort = CSTRING(JASSM_MAG_short);
    };
    class GVAR(JASSM_cluster_magazine_x1): GVAR(JASSM_magazine_x1) {
        ammo = QGVAR(JASSM_cluster);
        descriptionShort = CSTRING(JASSM_CLUSTER_MAG_DESCR);
        displayName = CSTRING(JASSM_CLUSTER_MAG_x1);
        displayNameShort = CSTRING(JASSM_MAG_CLUSTER_short);
    };
    class GVAR(JASSM_pylonmissile_x1): PylonMissile_Missile_AGM_02_x1 {
        ammo = QGVAR(JASSM);
        author = "Dani (TCVM) / SzwedzikPL";
        descriptionShort = CSTRING(JASSM_MAG_DESCR);
        displayName = CSTRING(JASSM_MAG_x1);
        displayNameShort = CSTRING(JASSM_MAG_short);
        pylonWeapon = QGVAR(JASSM_Launcher);
    };
    class GVAR(JASSM_cluster_pylonmissile_x1): GVAR(JASSM_pylonmissile_x1) {
        ammo = QGVAR(JASSM_cluster);
        descriptionShort = CSTRING(JASSM_CLUSTER_MAG_DESCR);
        displayName = CSTRING(JASSM_CLUSTER_MAG_x1);
        displayNameShort = CSTRING(JASSM_CLUSTER_MAG_short);
        pylonWeapon = QGVAR(JASSM_cluster_Launcher);
    };
    class GVAR(JASSM_pylonRack_1Rnd): PylonRack_1Rnd_Missile_AGM_02_F {
        ammo = QGVAR(JASSM);
        author = "Dani (TCVM) / SzwedzikPL";
        descriptionShort = CSTRING(JASSM_MAG_DESCR);
        displayName = CSTRING(JASSM_MAG_x1);
        displayNameShort = CSTRING(JASSM_MAG_short);
        pylonWeapon = QGVAR(JASSM_Launcher_Plane);
    };
    class GVAR(JASSM_cluster_pylonRack_1Rnd): GVAR(JASSM_pylonRack_1Rnd) {
        ammo = QGVAR(JASSM_cluster);
        descriptionShort = CSTRING(JASSM_CLUSTER_MAG_DESCR);
        displayName = CSTRING(JASSM_CLUSTER_MAG_x1);
        displayNameShort = CSTRING(JASSM_CLUSTER_MAG_short);
        pylonWeapon = QGVAR(JASSM_cluster_Launcher_Plane);
    };
    class GVAR(JASSM_PylonRack_x1): PylonRack_Missile_AGM_02_x1 {
        ammo = QGVAR(JASSM);
        author = "Dani (TCVM) / SzwedzikPL";
        descriptionShort = CSTRING(JASSM_MAG_DESCR);
        displayName = CSTRING(JASSM_MAG_x1);
        displayNameShort = CSTRING(JASSM_MAG_short);
        pylonWeapon = QGVAR(JASSM_Launcher);
    };
    class GVAR(JASSM_cluster_PylonRack_x1): GVAR(JASSM_PylonRack_x1) {
        ammo = QGVAR(JASSM_cluster);
        descriptionShort = CSTRING(JASSM_CLUSTER_MAG_DESCR);
        displayName = CSTRING(JASSM_CLUSTER_MAG_x1);
        displayNameShort = CSTRING(JASSM_CLUSTER_MAG_short);
        pylonWeapon = QGVAR(JASSM_cluster_Launcher);
    };

    class GVAR(AGM84_magazine_x1): magazine_Missile_AGM_02_x1 {
        ammo = QGVAR(AGM84);
        author = "Krzyciu";
        descriptionShort = CSTRING(AGM84_MAG_DESCR);
        displayName = CSTRING(AGM84_MAG_x1);
        displayNameShort = CSTRING(AGM84_MAG_short);
    };
    class GVAR(AGM84_pylonmissile_x1): PylonMissile_Missile_AGM_02_x1 {
        ammo = QGVAR(AGM84);
        author = "Krzyciu";
        descriptionShort = CSTRING(AGM84_MAG_DESCR);
        displayName = CSTRING(AGM84_MAG_x1);
        displayNameShort = CSTRING(AGM84_MAG_short);
        pylonWeapon = QGVAR(AGM84_Launcher);
    };
    class GVAR(AGM84_pylonRack_1Rnd): PylonRack_1Rnd_Missile_AGM_02_F {
        ammo = QGVAR(AGM84);
        author = "Krzyciu";
        descriptionShort = CSTRING(AGM84_MAG_DESCR);
        displayName = CSTRING(AGM84_MAG_x1);
        displayNameShort = CSTRING(AGM84_MAG_short);
        pylonWeapon = QGVAR(AGM84_Launcher_Plane);
    };

    class GVAR(AGM84_PylonRack_x1): PylonRack_Missile_AGM_02_x1 {
        ammo = QGVAR(AGM84);
        author = "Krzyciu";
        descriptionShort = CSTRING(AGM84_MAG_DESCR);
        displayName = CSTRING(AGM84_MAG_x1);
        displayNameShort = CSTRING(AGM84_MAG_short);
        pylonWeapon = QGVAR(AGM84_Launcher);
    };

    class 4Rnd_Missile_AGM_01_F;
    class PylonRack_1Rnd_Missile_AGM_01_F: 4Rnd_Missile_AGM_01_F {};
    class magazine_Missile_AGM_KH25_x1: VehicleMagazine {};
    class PylonMissile_Missile_AGM_KH25_x1: magazine_Missile_AGM_KH25_x1 {};

    class GVAR(C802AK_magazine_x1): magazine_Missile_AGM_KH25_x1 {
        ammo = QGVAR(C802AK);
        author = "Krzyciu";
        descriptionShort = CSTRING(C802AK_MAG_DESCR);
        displayName = CSTRING(C802AK_MAG_x1);
        displayNameShort = CSTRING(C802AK_MAG_short);
        pylonWeapon = QGVAR(C802AK_Launcher);
    };
    class GVAR(C802AK_pylonmissile_x1): PylonMissile_Missile_AGM_KH25_x1 {
        ammo = QGVAR(C802AK);
        author = "Krzyciu";
        descriptionShort = CSTRING(C802AK_MAG_DESCR);
        displayName = CSTRING(C802AK_MAG_x1);
        displayNameShort = CSTRING(C802AK_MAG_short);
        pylonWeapon = QGVAR(C802AK_Launcher);
    };
    class GVAR(C802AK_PylonRack_x1): PylonRack_1Rnd_Missile_AGM_01_F {
        ammo = QGVAR(C802AK);
        author = "Krzyciu";
        descriptionShort = CSTRING(C802AK_MAG_DESCR);
        displayName = CSTRING(C802AK_MAG_x1);
        displayNameShort = CSTRING(C802AK_MAG_short);
        pylonWeapon = QGVAR(C802AK_Launcher);
    };
};
