class cfgMagazines {
    class VehicleMagazine;
    class rhs_30Rnd_545x39_AK;

    class rhs_100Rnd_762x54mmR: rhs_30Rnd_545x39_AK {
        ace_isbelt = 1;
    };
    class rhs_100Rnd_762x54mmR_green: rhs_100Rnd_762x54mmR {
        ace_isbelt = 1;
    };
    class rhs_mag_127x108mm_50 : VehicleMagazine {
        ace_isbelt = 1;
    };
    class rhs_mag_127x108mm_150 : rhs_mag_127x108mm_50 {
        ace_isbelt = 0;
    };

    class FakeMagazine;
    class rhs_rpg26_mag: FakeMagazine
    {
        scope = 1;
        scopeArsenal = 1;
        displayName = "RPG-26";
        descriptionShort = "";
        picture = "\z\ace\addons\common\UI\blank_CO.paa";
        weaponPoolAvailable = 0;
        mass = 0;
    };
    class rhs_rpg26_mag_fired: rhs_rpg26_mag
    {
        count = 0;
    };
    class rhs_rshg2_mag: rhs_rpg26_mag
    {
        scope = 1;
        scopeArsenal = 1;
        displayName = "RShG-2";
        descriptionShort = "";
        picture = "\z\ace\addons\common\UI\blank_CO.paa";
        weaponPoolAvailable = 0;
        mass = 0;
    };
    class rhs_rshg2_mag_fired: rhs_rshg2_mag
    {
        count = 0;
    };
};