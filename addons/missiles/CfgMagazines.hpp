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
    class GVAR(JASSM_pylonmissile_x1): PylonMissile_Missile_AGM_02_x1 {
        ammo = QGVAR(JASSM);
        author = "Dani (TCVM) / SzwedzikPL";
        descriptionShort = CSTRING(JASSM_MAG_DESCR);
        displayName = CSTRING(JASSM_MAG_x1);
        displayNameShort = CSTRING(JASSM_MAG_short);
        pylonWeapon = QGVAR(JASSM_Launcher);
    };
    class GVAR(JASSM_pylonRack_1Rnd): PylonRack_1Rnd_Missile_AGM_02_F {
        ammo = QGVAR(JASSM);
        author = "Dani (TCVM) / SzwedzikPL";
        descriptionShort = CSTRING(JASSM_MAG_DESCR);
        displayName = CSTRING(JASSM_MAG_x1);
        displayNameShort = CSTRING(JASSM_MAG_short);
        pylonWeapon = QGVAR(JASSM_Launcher_Plane);
    };
    class GVAR(JASSM_PylonRack_x1): PylonRack_Missile_AGM_02_x1 {
        ammo = QGVAR(JASSM);
        author = "Dani (TCVM) / SzwedzikPL";
        descriptionShort = CSTRING(JASSM_MAG_DESCR);
        displayName = CSTRING(JASSM_MAG_x1);
        displayNameShort = CSTRING(JASSM_MAG_short);
        pylonWeapon = QGVAR(JASSM_Launcher);
    };
};
