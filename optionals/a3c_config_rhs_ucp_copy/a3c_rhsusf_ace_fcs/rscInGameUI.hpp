class RscMapControl;
class RscInGameUI
{
	class RscUnitInfo;
	class RHS_RscWeaponM1_FCS: RscUnitInfo
	{
		idd = 300;
		onLoad = "['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay');";
        controls[] = {"CA_Distance","ACE_CA_Distance"};
        class CA_Distance;
        class ACE_CA_Distance: CA_Distance {
            idc = 1713151;
            text = "----";
        };
        class ACE_Rangehelper: RscMapControl {
            onDraw = "((ctrlParent (_this select 0)) displayCtrl 1713151) ctrlShow (cameraView == 'GUNNER');";
            w = 0;
            h = 0;
        };
	};
};