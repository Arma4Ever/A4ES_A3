class CfgVehicles {
    class B_Carryall_Base;
    class GVAR(invisibleBackpack): B_Carryall_Base {
		scope = 2;
		displayName = CSTRING(InvisibleBackpack);
		picture = "";
        model = "\A3\weapons_f\dummyvest";
		hiddenSelectionsTextures[] = {""};
        maximumLoad = 800;
	};

    class Bag_Base;
    class ace_gunbag: Bag_Base {
        maximumLoad = 360;
    };
    class ace_gunbag_Tan: ace_gunbag {
        maximumLoad = 360;
    };
};
