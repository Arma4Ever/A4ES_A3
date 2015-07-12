class CfgPatches
{
	class a3c_c_rhs_c_bmp
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_c_bmp", "rhs_c_bmp3"};
		author[] = {"A3C"};
		authorUrl = "";
		versionDesc = "";
		version = "";
		text = "";
		magazines[] = {};
		ammo[] = {};
	};
};
class DefaultEventhandlers;
class CfgVehicles
{
	class LandVehicle;
	class Tank: LandVehicle
	{
		class NewTurret;
		class Sounds;
		class HitPoints;
	};
	class Tank_F: Tank
	{
		class Turrets
		{
			class MainTurret: NewTurret
			{
				class Turrets
				{
					class CommanderOptics;
				};
			};
		};
		class AnimationSources;
		class ViewPilot;
		class ViewOptics;
		class ViewCargo;
		class HeadLimits;
		class HitPoints: HitPoints
		{
			class HitHull;
			class HitEngine;
			class HitLTrack;
			class HitRTrack;
		};
		class Sounds: Sounds
		{
			class Engine;
			class Movement;
		};
		class EventHandlers;
	};
	class rhs_bmp1tank_base: Tank_F
	{
		vehicleClass = "a3c_rhs_vehclass_apc";
		displayName = "$STR_BMP1_Name";
		faction = "a3c_rhs_faction_russian";
		class UserActions
		{
			class Snorkel_1
			{
				displayName = "$STR_RHS_SnorkelOn";
				position = "MainTurret";
				onlyforplayer = 0;
				radius = 3.5;
				condition = "((this animationPhase 'RHS_BMP1_Snorkel' == 0) && (player == driver this))";
				statement = "this animate ['RHS_BMP1_Snorkel',1]; this animate ['RHS_BMP1_HT_lemez',1]; this animate ['RHS_BMP1_HT_lemez_B',1]; this animate ['RHS_BMP1_HT_lemez_A',1]";
			};
			class Snorkel_2
			{
				displayName = "$STR_RHS_SnorkelOff";
				position = "MainTurret";
				onlyforplayer = 0;
				radius = 3.5;
				condition = "((this animationPhase 'RHS_BMP1_Snorkel' == 1) && (player == driver this))";
				statement = "this animate ['RHS_BMP1_Snorkel',0]; this animate ['RHS_BMP1_HT_lemez',0]; this animate ['RHS_BMP1_HT_lemez_B',0]; this animate ['RHS_BMP1_HT_lemez_A',0]";
			};
		};
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call rhs_fnc_bmp_init";
			fired = "_this call SLX_XEH_EH_Fired;_this spawn rhs_fnc_9m14_fired; _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class rhs_bmp_base: rhs_bmp1tank_base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1_vdv: rhs_bmp_base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1_tv: rhs_bmp1_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1_msv: rhs_bmp1_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1_vmf: rhs_bmp1_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1_vv: rhs_bmp1_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1p_vdv: rhs_bmp1_vdv
	{
		faction = "a3c_rhs_faction_russian";
		displayName = "$STR_BMP1P_Name";
		class EventHandlers: EventHandlers
		{
			fired = "_this call SLX_XEH_EH_Fired;_this call rhs_fnc_at14_fired; _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
		};
	};
	class rhs_bmp1p_tv: rhs_bmp1p_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1p_msv: rhs_bmp1p_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1p_vmf: rhs_bmp1p_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1p_vv: rhs_bmp1p_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1k_vdv: rhs_bmp1_vdv
	{
		displayName = "$STR_BMP1K_Name";
	};
	class rhs_bmp1k_tv: rhs_bmp1k_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1k_msv: rhs_bmp1k_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1k_vmf: rhs_bmp1k_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1k_vv: rhs_bmp1k_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1d_vdv: rhs_bmp1_vdv
	{
		displayName = "$STR_BMP1D_Name";
		class UserActions {};
	};
	class rhs_bmp1d_tv: rhs_bmp1d_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1d_msv: rhs_bmp1d_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1d_vmf: rhs_bmp1d_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp1d_vv: rhs_bmp1d_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_prp3_vdv: rhs_bmp1_vdv
	{
		displayName = "$STR_PRP3_Name";
		class EventHandlers: EventHandlers
		{
			fired = "_this call SLX_XEH_EH_Fired;_this call rhs_fnc_prp3_autoloader; _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
		};
	};
	class rhs_prp3_tv: rhs_prp3_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_prp3_msv: rhs_prp3_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_prp3_vmf: rhs_prp3_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_prp3_vv: rhs_prp3_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2e_vdv: rhs_bmp1_vdv
	{
		displayName = "$STR_BMP2e_Name";
		class EventHandlers: EventHandlers
		{
			fired = "_this call SLX_XEH_EH_Fired;_this call rhs_fnc_at14_fired; _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
		};
	};
	class rhs_bmp2e_tv: rhs_bmp2e_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2e_msv: rhs_bmp2e_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2e_vmf: rhs_bmp2e_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2e_vv: rhs_bmp2e_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2_vdv: rhs_bmp2e_vdv
	{
		displayName = "$STR_BMP2_Name";
	};
	class rhs_bmp2_tv: rhs_bmp2_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2_msv: rhs_bmp2_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2_vmf: rhs_bmp2_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2_vv: rhs_bmp2_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2k_vdv: rhs_bmp2_vdv
	{
		displayName = "$STR_BMP2K_Name";
	};
	class rhs_bmp2k_tv: rhs_bmp2k_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2k_msv: rhs_bmp2k_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2k_vmf: rhs_bmp2k_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2k_vv: rhs_bmp2k_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2d_vdv: rhs_bmp2_vdv
	{
		scope = 1;
		displayName = "$STR_BMP2D_Name";
	};
	class rhs_bmp2d_tv: rhs_bmp2d_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2d_msv: rhs_bmp2d_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2d_vmf: rhs_bmp2d_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp2d_vv: rhs_bmp2d_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_brm1k_base: rhs_bmp2e_vdv
	{
		displayName = "$STR_BRM1K_Name";
		class UserActions: UserActions
		{
			class PSzNR_1
			{
				displayName = "$STR_RHS_PSNR5RADARON_NAME";
				position = "MainTurret";
				onlyforplayer = 0;
				radius = 3.5;
				condition = "(this animationPhase 'RHS_BMP1_PSzNR_5' == 0)";
				statement = "this animate ['RHS_BMP1_PSzNR_5',1]; this animate ['RHS_BMP1_PSzNR_cover',1]; this animate ['RHS_BMP1_PSzNR5_antenna',1]";
			};
			class PSzNR_2
			{
				displayName = "$STR_RHS_PSNR5RADAROFF_NAME";
				position = "MainTurret";
				onlyforplayer = 0;
				radius = 3.5;
				condition = "(this animationPhase 'RHS_BMP1_PSzNR_5' == 1)";
				statement = "this animate ['RHS_BMP1_PSzNR_5',0]; this animate ['RHS_BMP1_PSzNR_cover',0]; this animate ['RHS_BMP1_PSzNR5_antenna',0]";
			};
		};
	};
	class rhs_brm1k_vdv: rhs_brm1k_base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_brm1k_tv: rhs_brm1k_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_brm1k_msv: rhs_brm1k_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_brm1k_vmf: rhs_brm1k_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_brm1k_vv: rhs_brm1k_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_bmp3tank_base: Tank_F
	{
		vehicleClass = "a3c_rhs_vehclass_apc";
		displayName = "$STR_BMP3_Name";
		faction = "a3c_rhs_faction_russian";
		class EventHandlers: DefaultEventhandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call compile preProcessFile '\rhsafrf\addons\rhs_c_bmp3\scripts\rhs_bmp3_init.sqf'";
			fired = "_this call SLX_XEH_EH_Fired;_this spawn RHS_fnc_bmp3_autoloader; _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class rhs_bmp3_msv: rhs_bmp3tank_base
	{
		displayName = "$STR_BMP3_Name";
	};
	class rhs_bmp3_late_msv: rhs_bmp3tank_base
	{
		displayName = "$STR_BMP3_Late_Name";
	};
	class rhs_bmp3m_msv: rhs_bmp3tank_base
	{
		displayName = "$STR_BMP3M_Name";
	};
	class rhs_bmp3mera_msv: rhs_bmp3m_msv
	{
		displayName = "$STR_BMP3MERA_Name";
	};
};