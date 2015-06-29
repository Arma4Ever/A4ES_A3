class CfgPatches
{
	class a3c_c_rhs_c_cars
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_c_cars", "rhs_c_a2port_car"};
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
	class LandVehicle;
	class Car: LandVehicle
	{
		class NewTurret;
	};
	class Car_F: Car
	{
		class Turrets
		{
			class MainTurret: NewTurret{};
		};
		class HitPoints
		{
			class HitLFWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRF2Wheel;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
		};
		class EventHandlers;
		class AnimationSources;
	};
	class Offroad_01_base_F: Car_F{};
	class Truck_F: Car_F
	{
		class ViewPilot;
		class HitPoints: HitPoints
		{
			class HitLFWheel;
			class HitLBWheel;
			class HitLMWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRBWheel;
			class HitRMWheel;
			class HitRF2Wheel;
		};
		class AnimationSources;
	};
	class MRAP_02_base_F: Car_F
	{
		class HitPoints: HitPoints
		{
			class HitLFWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRF2Wheel;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitFuel;
			class HitEngine;
		};
		class EventHandlers;
	};
	class rhs_tigr_base: MRAP_02_base_F
	{
		displayName = "$STR_RHS_GAZ233011";
		vehicleClass = "a3c_rhs_vehclass_car";
		faction = "a3c_rhs_faction_russian";
		class EventHandlers: EventHandlers
		{
			init = "_this call compile preProcessFile '\rhsafrf\addons\rhs_c_cars\scripts\rhs_decal_init.sqf'";
			dammaged = "_this call SLX_XEH_EH_Dammaged;_this call rhs_fnc_fuelLeak;";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class rhs_tigr_vdv: rhs_tigr_base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_tigr_vmf: rhs_tigr_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_tigr_msv: rhs_tigr_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_tigr_vv: rhs_tigr_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_tigr_3camo_vdv: rhs_tigr_base
	{
		displayName = "$STR_RHS_GAZ233011_3CAMO";
	};
	class rhs_tigr_3camo_vmf: rhs_tigr_3camo_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_tigr_3camo_msv: rhs_tigr_3camo_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_tigr_3camo_vv: rhs_tigr_3camo_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_tigr_ffv_vdv: rhs_tigr_vdv
	{
		displayName = "$STR_RHS_GAZ233011_HATCH";
	};
	class rhs_tigr_ffv_vmf: rhs_tigr_ffv_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_tigr_ffv_msv: rhs_tigr_ffv_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_tigr_ffv_vv: rhs_tigr_ffv_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_tigr_ffv_3camo_vdv: rhs_tigr_ffv_vdv
	{
		displayName = "$STR_RHS_GAZ233011_HATCH_3CAMO";
	};
	class rhs_tigr_ffv_3camo_vmf: rhs_tigr_ffv_3camo_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_tigr_ffv_3camo_msv: rhs_tigr_ffv_3camo_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_tigr_ffv_3camo_vv: rhs_tigr_ffv_3camo_vdv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_tigr_m_test: rhs_tigr_vdv
	{
		displayName = "$STR_RHS_GAZ233114";
	};
	class RHS_UAZ_Base: Offroad_01_base_F
	{
		displayName = "$STR_RHS_UAZ469_NAME";
		class UserActions
		{
			class wiperson
			{
				displayName = "$STR_RHS_WIPERSON";
				position = "";
				radius = 2;
				priority = 0.05;
				onlyForplayer = 1;
				condition = "(player == driver this) AND isengineon (this) AND this animationPhase 'wipers' < 0.5";
				statement = "[this,0] spawn rhs_fnc_wipers";
			};
			class wipersoff: wiperson
			{
				displayName = "$STR_RHS_WIPERSOFF";
				condition = "(player == driver this) AND this animationPhase 'wipers' > 0.5";
				statement = "[this,1] spawn rhs_fnc_wipers";
			};
		};
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call compile preProcessFile '\rhsafrf\addons\rhs_c_a2port_car\scripts\rhs_decal_init.sqf'";
			engine = "_this call SLX_XEH_EH_Engine;if(_this select 1)then{_this call RHS_fnc_gearSound};";
			dammaged = "_this call SLX_XEH_EH_Dammaged;_this call rhs_fnc_fuelLeak;";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class rhs_uaz_open_Base: RHS_UAZ_Base
	{
	};
	class RHS_UAZ_MSV_Base: RHS_UAZ_Base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_uaz_open_MSV_Base: rhs_uaz_open_Base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_UAZ_MSV_01: RHS_UAZ_MSV_Base
	{
		scope = 2;
		vehicleClass = "a3c_rhs_vehclass_car";
		author = "$STR_RHS_AUTHOR_FULL";
	};
	class rhs_uaz_vdv: RHS_UAZ_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_uaz_vmf: RHS_UAZ_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_uaz_vv: RHS_UAZ_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_uaz_open_MSV_01: rhs_uaz_open_MSV_Base
	{
		vehicleClass = "a3c_rhs_vehclass_car";
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_uaz_open_vdv: rhs_uaz_open_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_uaz_open_vmf: rhs_uaz_open_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_uaz_open_vv: rhs_uaz_open_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_BaseTurret: Truck_F
	{
		displayName = "$STR_RHS_URAL4320_NAME";
		vehicleClass = "a3c_rhs_vehclass_truck";
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call compile preProcessFile '\rhsafrf\addons\rhs_c_a2port_car\scripts\rhs_decal_init.sqf'";
			engine = "_this call SLX_XEH_EH_Engine;if(_this select 1)then{_this call RHS_fnc_gearSound};";
			dammaged = "_this call SLX_XEH_EH_Dammaged;_this call rhs_fnc_fuelLeak;";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class RHS_Ural_Base: RHS_Ural_BaseTurret
	{

	};
	class RHS_Ural_MSV_Base: RHS_Ural_Base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_MSV_01: RHS_Ural_MSV_Base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_VDV_01: RHS_Ural_MSV_Base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_VMF_01: RHS_Ural_MSV_Base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_VV_01: RHS_Ural_MSV_Base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Flat_MSV_01: RHS_Ural_MSV_Base
	{
		displayName = "Ural-4320 (Flatbed)";
	};
	class RHS_Ural_Flat_VDV_01: RHS_Ural_Flat_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Flat_VMF_01: RHS_Ural_Flat_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Flat_VV_01: RHS_Ural_Flat_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Open_MSV_01: RHS_Ural_MSV_Base
	{
		displayName = "$STR_RHS_URAL4320OPEN_NAME";
	};
	class RHS_Ural_Open_VDV_01: RHS_Ural_Open_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Open_VMF_01: RHS_Ural_Open_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Open_VV_01: RHS_Ural_Open_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Open_Flat_MSV_01: RHS_Ural_Open_MSV_01
	{
		displayName = "Ural-4320 (Open/Flatbed)";
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Open_Flat_VDV_01: RHS_Ural_Open_Flat_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Open_Flat_VMF_01: RHS_Ural_Open_Flat_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Open_Flat_VV_01: RHS_Ural_Open_Flat_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Support_MSV_Base_01: RHS_Ural_MSV_Base
	{

	};
	class RHS_Ural_Fuel_MSV_01: RHS_Ural_Support_MSV_Base_01
	{
		faction = "a3c_rhs_faction_russian";
		displayName = "$STR_RHS_URAL4320FUEL_NAME";
	};
	class RHS_Ural_Fuel_VDV_01: RHS_Ural_Fuel_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Fuel_VMF_01: RHS_Ural_Fuel_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Fuel_VV_01: RHS_Ural_Fuel_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_BM21_MSV_01: RHS_Ural_BaseTurret
	{
		faction = "a3c_rhs_faction_russian";
		displayName = "$STR_RHS_BM21_NAME";
	};
	class RHS_BM21_VDV_01: RHS_BM21_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_BM21_VMF_01: RHS_BM21_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_BM21_VV_01: RHS_BM21_MSV_01
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_Ural_Civ_Base: RHS_Ural_Base
	{
		faction = "CIV_F";
	};
	class RHS_Ural_Civ_01: RHS_Ural_Civ_Base
	{
		displayName = "$STR_RHS_URAL4320BLUE_NAME";
	};
	class RHS_Ural_Civ_02: RHS_Ural_Civ_01
	{
		displayName = "$STR_RHS_URAL4320YELLOW_NAME";
	};
	class RHS_Ural_Civ_03: RHS_Ural_Civ_01
	{
		displayName = "$STR_RHS_URAL4320WORKER_NAME";
	};
	class RHS_Ural_Open_Civ_01: RHS_Ural_Civ_Base
	{
		displayName = "$STR_RHS_URAL4320BLUEOPEN_NAME";
	};
	class RHS_Ural_Open_Civ_02: RHS_Ural_Open_Civ_01
	{
		displayName = "$STR_RHS_URAL4320YELLOWOPEN_NAME";
	};
	class RHS_Ural_Open_Civ_03: RHS_Ural_Open_Civ_01
	{
		displayName = "$STR_RHS_URAL4320WORKEROPEN_NAME";
	};
	class Truck_02_base_F;
	class RHS_Civ_Truck_02_covered_F: Truck_02_base_F
	{
		faction = "CIV_F";
	};
	class RHS_Civ_Truck_02_transport_F: Truck_02_base_F
	{
		faction = "CIV_F";
	};
};