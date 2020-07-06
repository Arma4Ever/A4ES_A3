
class CfgMagazines {
    class 10Rnd_338_Mag;
    class XRnd_Laser_Mag: 10Rnd_338_Mag {
        scope = 1;
        scopeArsenal = 0;
        displayName = "Laser gun battery";
        descriptionShort = "Laser gun battery";
        ammo = "DMR_Laser_Ammo";
        tracersEvery = 1;
        type = 16;
        count = 10000;
        mass = 1;
        initSpeed = 310;
    };

    class Default;
	class CA_Magazine;
	class zetaborn_rifle_mag: CA_Magazine {
        scope = 1;
        scopeArsenal = 0;
	};
	class HandGrenade;
	class zetaborn_grenade_mag: HandGrenade {
        scope = 1;
        scopeArsenal = 0;
	};
	class CA_LauncherMagazine;
	class zetaborn_at_mag: CA_LauncherMagazine {
        scope = 1;
        scopeArsenal = 0;
	};
	class zetaborn_krak_mag: CA_LauncherMagazine {
        scope = 1;
        scopeArsenal = 0;
	};
};
