class CfgVehicles {
	class StaticWeapon;
    class Hate_BallThingCamera: StaticWeapon {
        scope = 1;
        scopeCurator = 1;
        scopeArsenal = 1;

        uavCameraGunnerPos = "look";
		uavCameraGunnerDir = "look";
	};
    class GVAR(B_RemoteCamera): Hate_BallThingCamera {
        displayName = CSTRING(RemoteCamera_displayName);
        scope = 2;
        scopeCurator = 2;
        scopeArsenal = 2;
        side = 1;
        faction = "BLU_F";
		crew = "B_UAV_AI";
    };
    class GVAR(O_RemoteCamera): GVAR(B_RemoteCamera) {
        side = 0;
        faction = "OPF_F";
		crew = "O_UAV_AI";
    };
    class GVAR(I_RemoteCamera): GVAR(B_RemoteCamera) {
        side = 2;
        faction = "IND_F";
		crew = "I_UAV_AI";
    };
    class GVAR(C_RemoteCamera): GVAR(B_RemoteCamera) {
        side = 3;
        faction = "CIV_F";
		crew = "C_UAV_AI_F";
    };
};
