class CfgPatches
{
	class a3c_c_rhs_c_a2port_air
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_c_a2port_air", "RHS_A2_AirImport"};
		author[] = {"A3C"};
		authorUrl = "";
		versionDesc = "";
		version = "";
		text = "";
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgVehicles
{
	class Air;
	class Helicopter: Air
	{
		class Turrets;
		class HitPoints
		{
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
			class HitHull;
			class HitEngine;
			class HitAvionics;
		};
	};
	class Helicopter_Base_F: Helicopter
	{
		class Turrets: Turrets
		{
			class MainTurret;
		};
		class HitPoints: HitPoints
		{
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
			class HitMissiles;
			class HitHull;
			class HitFuel;
			class HitEngine;
			class HitAvionics;
			class HitVRotor;
			class HitHRotor;
		};
		class AnimationSources;
		class Eventhandlers;
		class ViewOptics;
		class CargoTurret;
		class RotorLibHelicopterProperties;
	};
	class Heli_Attack_02_base_F: Helicopter_Base_F
	{
		class RotorLibHelicopterProperties;
	};
	class Helicopter_Base_H: Helicopter_Base_F
	{
		class Turrets: Turrets
		{
			class CopilotTurret;
		};
		class AnimationSources;
		class Eventhandlers;
		class Viewoptics;
		class Reflectors
		{
			class Right;
		};
		class RotorLibHelicopterProperties;
	};
	class Heli_Transport_02_base_F: Helicopter_Base_H{};
	class Heli_Light_02_base_F: Helicopter_Base_H
	{
		class Turrets: Turrets
		{
			class CopilotTurret;
			class MainTurret;
		};
	};
	class Plane: Air
	{
		class HitPoints;
		class EventHandlers;
	};
	class Plane_Base_F: Plane
	{
		class AnimationSources;
		class HitPoints: HitPoints
		{
			class HitHull;
		};
	};
	class Plane_CAS_02_base_F;
	class O_Plane_CAS_02_F: Plane_CAS_02_base_F
	{
		class EventHandlers;
	};
	class UAV: Plane
	{
		class NewTurret;
		class ViewPilot;
		class ViewOptics;
		class AnimationSources;
	};
	class RHS_Mi24_base: Heli_Attack_02_base_F
	{
		vehicleClass = "a3c_rhs_vehclass_heli";
		displayName = "$STR_RHS_MI24P_Name";
		class UserActions
		{
			class openDoor
			{
				displayName = "Open Door";
				position = "";
				radius = 3;
				priority = 0.05;
				onlyForplayer = 1;
				condition = "this doorPhase 'Door_Cargo' < 0.5 AND alive this";
				statement = "this animateDoor ['Door_Cargo',1]";
			};
			class closeDoor: openDoor
			{
				displayName = "Close Door";
				condition = "this doorPhase 'Door_Cargo' > 0.5 AND alive this";
				statement = "this animateDoor ['Door_Cargo',0]";
			};
		};
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call compile preProcessFile '\rhsafrf\addons\rhs_c_a2port_air\scripts\rhs_air_init.sqf'";
			incomingMissile = "_this call SLX_XEH_EH_IncomingMissile;_this spawn rhs_fnc_rwr_mi24";
			fired = "_this call SLX_XEH_EH_Fired;_this call RHS_fnc_mi24_shake; _this call (uinamespace getvariable 'BIS_fnc_effectFired')";
			getIn = "_this call SLX_XEH_EH_GetIn;_this call rhs_fnc_mi24_doors";
			getOut = "_this call SLX_XEH_EH_GetOut;_this call rhs_fnc_mi24_doors";
		};
	};
	class RHS_Mi24V_Base: RHS_Mi24_base
	{
		displayName = "$STR_RHS_MI24V_Name";
	};
	class RHS_Mi24P_VVS_Base: RHS_Mi24_base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24P_vvs: RHS_Mi24P_VVS_Base
	{
		scope = 1;
	};
	class RHS_Mi24P_vvsc: RHS_Mi24P_vvs
	{
		scope = 2;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24P_CAS_VVS_Base: RHS_Mi24P_VVS_Base
	{
		displayName = "$STR_RHS_MI24P_CAS_Name";
		class EventHandlers: EventHandlers
		{
			fired = "_this call SLX_XEH_EH_Fired;_this call RHS_fnc_mi24p_shake; _this call (uinamespace getvariable 'BIS_fnc_effectFired')";
		};
	};
	class RHS_Mi24P_CAS_vvs: RHS_Mi24P_CAS_VVS_Base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24P_CAS_vvsc: RHS_Mi24P_CAS_vvs
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24P_CAS_vdv: RHS_Mi24P_CAS_VVS_Base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24P_AT_VVS_Base: RHS_Mi24P_VVS_Base
	{
		displayName = "$STR_RHS_MI24P_AT_Name";
		class EventHandlers: EventHandlers
		{
			fired = "_this call SLX_XEH_EH_Fired;_this call RHS_fnc_mi24p_shake; _this call (uinamespace getvariable 'BIS_fnc_effectFired')";
		};
	};
	class RHS_Mi24P_AT_vvs: RHS_Mi24P_AT_VVS_Base
	{
		scope = 1;
	};
	class RHS_Mi24P_AT_vvsc: RHS_Mi24P_AT_vvs
	{
		scope = 2;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24P_AT_vdv: RHS_Mi24P_AT_VVS_Base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24P_vdv: RHS_Mi24P_vvsc
	{
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24V_VVS_Base: RHS_Mi24V_base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24V_vvs: RHS_Mi24V_VVS_Base
	{
		scope = 1;
	};
	class RHS_Mi24V_vvsc: RHS_Mi24V_vvs
	{
		scope = 2;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24V_FAB_VVS_Base: RHS_Mi24V_VVS_Base
	{
		faction = "a3c_rhs_faction_russian";
		displayName = "$STR_RHS_MI24V_FAB_Name";
	};
	class RHS_Mi24V_FAB_vvs: RHS_Mi24V_FAB_VVS_Base
	{
		scope = 1;
	};
	class RHS_Mi24V_FAB_vvsc: RHS_Mi24V_fab_vvs
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24V_FAB_vdv: RHS_Mi24V_FAB_VVS_Base
	{
		scope = 2;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24V_UPK23_VVS_Base: RHS_Mi24V_VVS_Base
	{
		faction = "a3c_rhs_faction_russian";
		displayName = "$STR_RHS_MI24V_UPK_Name";
	};
	class RHS_Mi24V_UPK23_vvs: RHS_Mi24V_UPK23_VVS_Base
	{
		scope = 1;
	};
	class RHS_Mi24V_UPK23_vvsc: RHS_Mi24V_upk23_vvs
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24V_UPK23_vdv: RHS_Mi24V_UPK23_VVS_Base
	{
		scope = 2;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24V_AT_VVS_Base: RHS_Mi24V_VVS_Base
	{
		faction = "a3c_rhs_faction_russian";
		displayName = "$STR_RHS_MI24V_AT_Name";
	};
	class RHS_Mi24V_AT_vvs: RHS_Mi24V_AT_VVS_Base
	{
		scope = 1;
	};
	class RHS_Mi24V_AT_vvsc: RHS_Mi24V_AT_vvs
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24V_AT_vdv: RHS_Mi24V_AT_VVS_Base
	{
		scope = 2;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi24Vt_vvs: RHS_Mi24V_vvs
	{
		scope = 1;
		displayName = "$STR_RHS_MI24Vt_Name";
	};
	class RHS_Mi24V_vdv: RHS_Mi24V_vvsc
	{
		scope = 2;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8_base: Heli_Light_02_base_F
	{
		displayname = "$STR_RHS_MI8_Name";
		vehicleClass = "a3c_rhs_vehclass_heli";
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call compile preProcessFile '\rhsafrf\addons\rhs_c_a2port_air\scripts\rhs_air_init.sqf'";
			fired = "_this call SLX_XEH_EH_Fired;_this call RHS_fnc_mi8_shake; _this call (uinamespace getvariable 'BIS_fnc_effectFired')";
		};
	};
	class rhs_mi8mtv3_base: RHS_Mi8_base
	{
		displayName = "$STR_RHS_MI8MTV3_Name";
		class UserActions
		{
			class HUDoff
			{
				condition = "(player==driver this) and (this animationphase 'HUDAction' !=0)";
				displayname = "$STR_RHS_MI17HudOn_Name";
				displaynamedefault = "$STR_RHS_MI17HudOn_Name";
				onlyforplayer = 1;
				position = "zamerny";
				radius = 1;
				statement = "this animate ['HUDAction',0];this animate ['HUDaction_Hide',0]";
			};
			class HUDon
			{
				condition = "(player==driver this) and (this animationphase 'HUDAction' !=1)";
				displayname = "$STR_RHS_MI17HudOff_Name";
				displaynamedefault = "$STR_RHS_MI17HudOff_Name";
				onlyforplayer = 1;
				position = "zamerny";
				radius = 1;
				statement = "this animate ['HUDAction',1];this animate ['HUDaction_Hide',1]";
			};
		};
	};
	class rhs_mi8amtsh_base: rhs_mi8mtv3_base
	{
		displayName = "$STR_RHS_MI8AMTSh_Name";
	};
	class rhs_mi8amt_base: rhs_mi8_base
	{
		displayName = "$STR_RHS_MI8AMT_Name";
		class UserActions
		{
			class openDoor
			{
				displayName = "Open Rear Doors";
				position = "";
				radius = 3;
				priority = 0.05;
				onlyForplayer = 1;
				condition = "this doorPhase 'RearDoors' < 0.5 AND alive this";
				statement = "[this,15,16] call rhs_fnc_mi8_checkDoor";
			};
			class closeDoor: openDoor
			{
				displayName = "Close Rear Doors";
				condition = "this doorPhase 'RearDoors' > 0.5 AND alive this";
			};
			class openDoor_L: openDoor
			{
				displayName = "Open Left Door";
				position = "";
				condition = "this doorPhase 'LeftDoor' < 0.5 AND alive this";
				statement = "this animateDoor ['LeftDoor',1]";
			};
			class closeDoor_L: openDoor
			{
				displayName = "Close Left Door";
				condition = "this doorPhase 'LeftDoor' > 0.5 AND alive this";
				statement = "this animateDoor ['LeftDoor',0]";
			};
		};
		class EventHandlers: EventHandlers
		{
			getIn = "_this call SLX_XEH_EH_GetIn;_this call rhs_fnc_mi8_doors";
			getOut = "_this call SLX_XEH_EH_GetOut;_this call rhs_fnc_mi8_doors";
		};
	};
	class RHS_Mi8_VVS_Base: RHS_Mi8_base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8MTV3_VVS_Base: RHS_Mi8MTV3_base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8AMTSh_VVS_Base: RHS_Mi8AMTSh_base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8AMT_VVS_Base: RHS_Mi8AMT_base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8mt_vvs: RHS_Mi8_VVS_Base
	{
		scope = 2;
		displayName = "$STR_RHS_MI8MT_Name";
	};
	class RHS_Mi8mt_vvsc: RHS_Mi8mt_vvs
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8mt_vdv: RHS_Mi8mt_vvsc
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8mt_vv: RHS_Mi8mt_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8mt_Cargo_vvs: RHS_Mi8mt_vvs
	{
		displayName = "$STR_RHS_MI8MT_CARGO_Name";
		class UserActions
		{
			class openDoor
			{
				displayName = "Open Rear Doors";
				position = "";
				radius = 3;
				priority = 0.05;
				onlyForplayer = 1;
				condition = "this doorPhase 'RearDoors' < 0.5 AND alive this";
				statement = "[this,13,14] call rhs_fnc_mi8_checkDoor";
			};
			class closeDoor: openDoor
			{
				displayName = "Close Rear Doors";
				condition = "this doorPhase 'RearDoors' > 0.5 AND alive this";
			};
			class openDoor_L: openDoor
			{
				displayName = "Open Left Door";
				position = "";
				condition = "this doorPhase 'LeftDoor' < 0.5 AND alive this";
				statement = "this animateDoor ['LeftDoor',1]";
			};
			class closeDoor_L: openDoor
			{
				displayName = "Close Left Door";
				condition = "this doorPhase 'LeftDoor' > 0.5 AND alive this";
				statement = "this animateDoor ['LeftDoor',0]";
			};
		};
		class EventHandlers: EventHandlers
		{
			getIn = "_this call SLX_XEH_EH_GetIn;_this call rhs_fnc_mi8_doors";
			getOut = "_this call SLX_XEH_EH_GetOut;_this call rhs_fnc_mi8_doors";
		};
	};
	class RHS_Mi8mt_Cargo_vvsc: RHS_Mi8mt_Cargo_vvs
	{
		scope = 2;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8mt_Cargo_vdv: RHS_Mi8mt_Cargo_vvsc
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8mt_Cargo_vv: RHS_Mi8mt_Cargo_vvsc
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8MTV3_vvs: RHS_Mi8MTV3_VVS_Base
	{
		scope = 2;
		displayName = "$STR_RHS_MI8MTV3_Name";
	};
	class RHS_Mi8MTV3_vvsc: RHS_Mi8MTV3_vvs
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8MTV3_vdv: RHS_Mi8MTV3_vvsc
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8MTV3_UPK23_vvs: RHS_Mi8MTV3_VVS
	{
		scope = 2;
		displayName = "$STR_RHS_MI8MTV3_UPK_Name";
	};
	class RHS_Mi8MTV3_UPK23_vvsc: RHS_Mi8MTV3_UPK23_vvs
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8MTV3_UPK23_vdv: RHS_Mi8MTV3_UPK23_vvsc
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8MTV3_FAB_vvs: RHS_Mi8MTV3_VVS
	{
		scope = 2;
		displayName = "$STR_RHS_MI8MTV3_FAB_Name";
	};
	class RHS_Mi8MTV3_FAB_vvsc: RHS_Mi8MTV3_FAB_vvs
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8MTV3_FAB_vdv: RHS_Mi8MTV3_FAB_vvsc
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8AMT_vvs: RHS_Mi8AMT_VVS_Base
	{
		scope = 2;
		displayName = "$STR_RHS_Mi8AMT_Name";
	};
	class RHS_Mi8AMT_vvsc: RHS_Mi8AMT_vvs
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8AMT_vdv: RHS_Mi8AMT_vvsc
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8AMTSh_vvs: RHS_Mi8AMTSh_VVS_Base
	{
		scope = 2;
		faction = "a3c_rhs_faction_russian";
		displayName = "$STR_RHS_MI8AMTSh_Name";
	};
	class RHS_Mi8AMTSh_vvsc: RHS_Mi8AMTSh_vvs
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
		displayName = "$STR_RHS_MI8AMTSh_Name";
	};
	class RHS_Mi8AMTSh_UPK23_vvs: RHS_Mi8AMTSh_vvs
	{
		scope = 2;
		displayName = "$STR_RHS_MI8AMTSh_UPK_Name";
	};
	class RHS_Mi8AMTSh_UPK23_vvsc: RHS_Mi8AMTSh_UPK23_vvs
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8AMTSh_FAB_vvs: RHS_Mi8AMTSh_vvs
	{
		scope = 2;
		displayName = "$STR_RHS_MI8AMTSh_FAB_Name";
	};
	class RHS_Mi8AMTSh_FAB_vvsc: RHS_Mi8AMTSh_FAB_vvs
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Mi8amt_civilian: RHS_Mi8amt_vvs
	{
		displayName = "$STR_RHS_MI8AMT_Name";
		vehicleClass = "Air";
		faction = "CIV_F";
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init";
		};
	};
	class RHS_su25_base: O_Plane_CAS_02_F
	{
		displayname = "$STR_RHS_SU25_Name";
		vehicleClass = "a3c_rhs_vehclass_aircraft";
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call compile preProcessFile '\rhsafrf\addons\rhs_c_a2port_air\scripts\rhs_air_init.sqf'";
			fired = "_this call SLX_XEH_EH_Fired;_this call RHS_fnc_su25_shake; _this call (uinamespace getvariable 'BIS_fnc_effectFired')";
		};
	};
	class RHS_Su25_VVS_Base: RHS_Su25_base
	{
		faction = "a3c_rhs_faction_russian";
		vehicleClass = "a3c_rhs_vehclass_aircraft";
	};
	class RHS_Su25SM_vvs: RHS_Su25_VVS_Base
	{
		faction = "a3c_rhs_faction_russian";
		displayName = "$STR_RHS_SU25SM_Name";
	};
	class RHS_Su25SM_KH29_vvs: RHS_Su25SM_vvs
	{
		displayName = "$STR_RHS_SU25SM_KH29_Name";
	};
	class RHS_Su25SM_vvsc: RHS_Su25SM_vvs
	{
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Su25SM_KH29_vvsc: RHS_Su25SM_vvsc
	{
		displayName = "$STR_RHS_SU25SM_KH29_Name";
	};
	class RHS_Ka52_base: Heli_Attack_02_base_F
	{
		faction = "a3c_rhs_faction_russian";
		displayName = "Ka-52";
		vehicleClass = "a3c_rhs_vehclass_heli";
		class UserActions
		{
			class openDoor
			{
				displayName = "Lights up";
				position = "";
				radius = 3;
				priority = 0.05;
				onlyForplayer = 1;
				condition = "this doorPhase 'landingLights' < 0.5 AND alive this";
				statement = "this animateDoor ['landingLights',1]";
			};
			class closeDoor: openDoor
			{
				displayName = "Lights down";
				condition = "this doorPhase 'landingLights' > 0.5 AND alive this";
				statement = "this animateDoor ['landingLights',0]";
			};
		};
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call compile preProcessFile '\rhsafrf\addons\rhs_c_a2port_air\scripts\rhs_air_init.sqf'";
			fired = "_this call SLX_XEH_EH_Fired;_this call RHS_fnc_ka52_shake; _this call (uinamespace getvariable 'BIS_fnc_effectFired')";
		};
	};
	class RHS_Ka52Black_base: RHS_Ka52_base
	{
		scope = 1;
		displayName = "Ka-52 (CAS)";
	};
	class RHS_Ka52_vvsc: RHS_Ka52_base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ka52_vvs: RHS_Ka52Black_base
	{
		scope = 2;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ka52_UPK23_vvs: RHS_Ka52_vvs
	{
		scope = 2;
		displayName = "Ka-52 (UPK)";
	};
	class RHS_Ka52_UPK23_vvsc: RHS_Ka52_vvsc
	{
		scope = 1;
		displayName = "Ka-52 (UPK)";
	};
	class UAV_02_base_F: UAV
	{
		class EventHandlers;
	};
	class rhs_pchela1t_base: UAV_02_base_F
	{
		scope = 1;
		faction = "rhs_faction_vvs";
		displayName = "Pchela-1T";
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call compile preProcessFile '\rhsafrf\addons\rhs_c_a2port_air\scripts\rhs_air_init.sqf'";
		};
	};
	class rhs_pchela1t_vvs: rhs_pchela1t_base
	{
		scope = 1;
	};
	class rhs_pchela1t_vvsc: rhs_pchela1t_base
	{
		scope = 2;
		vehicleClass = "a3c_rhs_vehclass_autonomous";
		faction = "a3c_rhs_faction_russian";
	};
};