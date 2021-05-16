class CfgWeapons {
    class NVGoggles;
    class GVAR(NVGoggles): NVGoggles {
        scopeArsenal = 2;
        DLC = "";
        model = "\a3\weapons_f\dummynvg.p3d";
        displayName = CSTRING(NVGoggles_displayName);
        descriptionShort = CSTRING(NVGoggles_description);
        picture = QPATHTOF(data\nvg_ca.paa);
		class ItemInfo {
			type = 616;
			uniformModel = "\a3\weapons_f\dummynvg.p3d";
			modelOff = "\a3\weapons_f\dummynvg.p3d";
			mass = 0;
		};
        class WeaponSlotsInfo {
            mass = 0;
        };
	};
};
