class cfgMagazines {
    class CA_Magazine;
    class VehicleMagazine;
    class rhs_mag_30Rnd_556x45_M855A1_Stanag;
    class rhs_mag_30Rnd_556x45_M200_Stanag;

    class rhsusf_100Rnd_556x45_soft_pouch: rhs_mag_30Rnd_556x45_M855A1_Stanag {
        ace_isbelt = 1;
    };
    class rhsusf_100Rnd_556x45_M200_soft_pouch: rhs_mag_30Rnd_556x45_M200_Stanag {
        ace_isbelt = 1;
    };
    class rhsusf_200Rnd_556x45_soft_pouch: rhsusf_100Rnd_556x45_soft_pouch {
        ace_isbelt = 1;
    };
    class rhsusf_100Rnd_762x51: CA_Magazine {
        ace_isbelt = 1;
    };
    class rhsusf_100Rnd_762x51_m80a1epr: rhsusf_100Rnd_762x51 {
        ace_isbelt = 1;
    };
    class rhsusf_100Rnd_762x51_m993: rhsusf_100Rnd_762x51 {
        ace_isbelt = 1;
    };
    class rhs_mag_100rnd_127x99_mag: VehicleMagazine {
        ace_isbelt = 1;
    };
    class RHS_48Rnd_40mm_MK19: VehicleMagazine {
        ace_isbelt = 1;
    };

    class CA_LauncherMagazine;
    class rhs_m136_mag: CA_LauncherMagazine
    {
        scope = 1;
        scopeArsenal = 1;
        displayName = "M136 HEAT";
        descriptionShort = "";
        picture = "\z\ace\addons\common\UI\blank_CO.paa";
        weaponPoolAvailable = 0;
        mass = 0;
    };
    class rhs_m136_mag_fired: rhs_m136_mag
    {
        count = 0;
    };
    class rhs_m136_hedp_mag: rhs_m136_mag
    {
        scope = 1;
        scopeArsenal = 1;
        displayName = "M136 HEDP";
        descriptionShort = "";
        picture = "\z\ace\addons\common\UI\blank_CO.paa";
        ammo = "rhs_ammo_M136_hedp_rocket";
        weaponPoolAvailable = 0;
        mass = 0;
    };
    class rhs_m136_hedp_mag_fired: rhs_m136_hedp_mag
    {
        count = 0;
    };
    class rhs_m136_hp_mag: rhs_m136_mag
    {
        scope = 1;
        scopeArsenal = 1;
        displayName = "M136 HP";
        descriptionShort = "";
        picture = "\z\ace\addons\common\UI\blank_CO.paa";
        ammo = "rhs_ammo_M136_hp_rocket";
        weaponPoolAvailable = 0;
        mass = 0;
    };
    class rhs_m136_hp_mag_fired: rhs_m136_hp_mag
    {
        count = 0;
    };
};