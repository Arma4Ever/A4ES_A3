class CfgAmmo {
    class RocketCore;
    class RocketBase;
    class R_PG7_F: RocketBase {
        aiAmmoUsageFlags = "64 + 128 + 256 + 512";
        airLock = 1;
        allowAgainstInfantry = 1;
        cost = 20;
        effectsMissile = "missile3";
    };
    class M_SPG9_HEAT: RocketBase {
        aiAmmoUsageFlags = "64 + 128 + 512";
        allowAgainstInfantry = 1;
    };
    class R_PG32V_F: RocketBase {
        aiAmmoUsageFlags = "64 + 128 + 256 + 512";
        airLock = 1;
        allowAgainstInfantry = 1;
        cost = 20;
    };
    class R_TBG32V_F: R_PG32V_F {
        aiAmmoUsageFlags = "64 + 128 + 256 + 512";
        airLock = 1;
        allowAgainstInfantry = 1;
        cost = 20;
    };
    class R_MRAAWS_HEAT_F : RocketBase {
        aiAmmoUsageFlags = "64 + 128 + 512";
        allowAgainstInfantry = 1;
        cost = 40;
    };
    class R_MRAAWS_HEAT55_F: R_MRAAWS_HEAT_F {
        aiAmmoUsageFlags = "64 + 128 + 512";
        allowAgainstInfantry = 1;
        cost = 40;
    };
    class R_MRAAWS_HE_F: R_MRAAWS_HEAT_F {
        aiAmmoUsageFlags = "64 + 128 + 512";
        allowAgainstInfantry = 1;
        cost = 40;
    };
};
