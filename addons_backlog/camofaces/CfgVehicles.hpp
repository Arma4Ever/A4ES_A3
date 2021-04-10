class CfgVehicles {
	class Man;
	class CAManBase: Man {
		delete AGM_SelfActions;
		class ACE_SelfActions {
			delete jgkp_camofaces;
		};
	};

    class NATO_Box_Base;
	class Box_Camofaces: NATO_Box_Base {
		scope = 0;
        scopeCurator = 0;
	};
};
