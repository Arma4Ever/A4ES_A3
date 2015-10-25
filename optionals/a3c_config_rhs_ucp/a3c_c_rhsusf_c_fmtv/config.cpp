class CfgPatches
{
	class a3c_c_rhsusf_c_fmtv
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhsusf_c_fmtv"};
		magazines[] = {};
	};
};
class CfgVehicles
{
	class Car;
	class Car_F: Car
	{
		class Turrets;
		class HitPoints;
		class EventHandlers;
		class AnimationSources;
	};
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
			class HitBody;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
		};
		class AnimationSources;
		class Turrets: Turrets
		{
			class MainTurret;
			class ViewOptics;
		};
	};
	class Truck_01_base_F: Truck_F
	{
		class AnimationSources: AnimationSources
		{
			class HitGlass1;
		};
		class Turrets: Turrets
		{
			class MainTurret;
			class ViewOptics;
		};
	};
	class rhsusf_fmtv_base: Truck_01_base_F
	{
		displayName = "FMTV";
		vehicleClass = "pojazdyladowe2";

		class AnimationSources: AnimationSources
		{
			class hide_cover {};
			class hide_spare: hide_cover {};
			class hide_scaffold: hide_cover {};
			class hide_bench: hide_cover {};
		};

		class EventHandlers: EventHandlers
		{
			dammaged = "_this call SLX_XEH_EH_Dammaged;_this call rhs_fnc_fuelLeak;";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class rhsusf_M1078A1P2_B_wd_fmtv_usarmy: rhsusf_fmtv_base
	{
		displayName = "M1078A1P2-B";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
	};
	class rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy: rhsusf_M1078A1P2_B_wd_fmtv_usarmy
	{
		displayName = "M1078A1P2-B (Open)";
	};
	class rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy: rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy
	{
		displayName = "M1078A1P2-B (Flatbed)";
	};
	class rhsusf_M1078A1P2_B_d_fmtv_usarmy: rhsusf_M1078A1P2_B_wd_fmtv_usarmy
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
	};
	class rhsusf_M1078A1P2_B_d_open_fmtv_usarmy: rhsusf_M1078A1P2_B_d_fmtv_usarmy
	{
		displayName = "M1078A1P2-B (Open)";
	};
	class rhsusf_M1078A1P2_B_d_flatbed_fmtv_usarmy: rhsusf_M1078A1P2_B_d_open_fmtv_usarmy
	{
		displayName = "M1078A1P2-B (Flatbed)";
	};
	class rhsusf_M1078A1P2_wd_fmtv_usarmy: rhsusf_M1078A1P2_B_wd_fmtv_usarmy
	{
		displayName = "M1078A1P2 WD";
	};
	class rhsusf_M1078A1P2_wd_open_fmtv_usarmy: rhsusf_M1078A1P2_wd_fmtv_usarmy
	{
		displayName = "M1078A1P2 WD (Open)";
	};
	class rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy: rhsusf_M1078A1P2_wd_open_fmtv_usarmy
	{
		displayName = "M1078A1P2 WD (Flatbed)";
	};
	class rhsusf_M1078A1P2_d_fmtv_usarmy: rhsusf_M1078A1P2_wd_fmtv_usarmy
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
	};
	class rhsusf_M1078A1P2_d_open_fmtv_usarmy: rhsusf_M1078A1P2_d_fmtv_usarmy
	{
		displayName = "M1078A1P2 (Open)";
	};
	class rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy: rhsusf_M1078A1P2_d_open_fmtv_usarmy
	{
		displayName = "M1078A1P2 (Flatbed)";
	};
	class rhsusf_M1083A1P2_B_wd_fmtv_usarmy: rhsusf_fmtv_base
	{
		displayName = "M1083A1P2-B WD";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
	};
	class rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy: rhsusf_M1083A1P2_B_wd_fmtv_usarmy
	{
		displayName = "M1083A1P2-B WD (Open)";
	};
	class rhsusf_M1083A1P2_B_wd_flatbed_fmtv_usarmy: rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy
	{
		displayName = "M1083A1P2-B WD (Flatbed)";
	};
	class rhsusf_M1083A1P2_B_d_fmtv_usarmy: rhsusf_M1083A1P2_B_wd_fmtv_usarmy
	{
		displayName = "M1083A1P2-B";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
	};
	class rhsusf_M1083A1P2_B_d_open_fmtv_usarmy: rhsusf_M1083A1P2_B_d_fmtv_usarmy
	{
		displayName = "M1083A1P2-B (Open)";
	};
	class rhsusf_M1083A1P2_B_d_flatbed_fmtv_usarmy: rhsusf_M1083A1P2_B_d_open_fmtv_usarmy
	{
		displayName = "M1083A1P2-B (Flatbed)";
	};
	class rhsusf_M1083A1P2_wd_fmtv_usarmy: rhsusf_M1083A1P2_B_wd_fmtv_usarmy
	{
		displayName = "M1083A1P2 WD";
	};
	class rhsusf_M1083A1P2_wd_open_fmtv_usarmy: rhsusf_M1083A1P2_wd_fmtv_usarmy
	{
		displayName = "M1083A1P2 WD (Open)";
	};
	class rhsusf_M1083A1P2_wd_flatbed_fmtv_usarmy: rhsusf_M1083A1P2_wd_open_fmtv_usarmy
	{
		displayName = "M1083A1P2 WD (Flatbed)";
	};
	class rhsusf_M1083A1P2_d_fmtv_usarmy: rhsusf_M1083A1P2_wd_fmtv_usarmy
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
	};
	class rhsusf_M1083A1P2_d_open_fmtv_usarmy: rhsusf_M1083A1P2_d_fmtv_usarmy
	{
		displayName = "M1083A1P2 (Open)";
	};
	class rhsusf_M1083A1P2_d_flatbed_fmtv_usarmy: rhsusf_M1083A1P2_d_open_fmtv_usarmy
	{
		displayName = "M1083A1P2 (Flatbed)";
	};
	class rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy: rhsusf_M1078A1P2_B_wd_fmtv_usarmy
	{
		displayName = "M1078A1P2-B WD (M2)";
	};
	class rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy: rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy
	{
		displayName = "M1078A1P2-B WD (M2/Open)";
	};
	class rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy: rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy
	{
		displayName = "M1078A1P2-B WD (M2/Flatbed)";
	};
	class rhsusf_M1078A1P2_B_M2_d_fmtv_usarmy: rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
	};
	class rhsusf_M1078A1P2_B_M2_d_open_fmtv_usarmy: rhsusf_M1078A1P2_B_M2_d_fmtv_usarmy
	{
		displayName = "M1078A1P2-B (M2/Open)";
	};
	class rhsusf_M1078A1P2_B_M2_d_flatbed_fmtv_usarmy: rhsusf_M1078A1P2_B_M2_d_open_fmtv_usarmy
	{
		displayName = "M1078A1P2-B (M2/Flatbed)";
	};
	class rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy: rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy
	{
		displayName = "M1083A1P2-B WD (M2)";
	};
	class rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy: rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy
	{
		displayName = "M1083A1P2-B WD (M2/Open)";
		Icon = "\rhsusf\addons\rhsusf_c_fmtv\data\ico\ico_m1083_open_m2.paa";
		class AnimationSources: AnimationSources
		{
			class hide_cover: hide_cover
			{
				initPhase = 1;
			};
		};
	};
	class rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy: rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy
	{
		displayName = "M1083A1P2-B WD (M2/Flatbed)";
	};
	class rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy: rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy
	{
		displayName = "M1083A1P2-B (M2/Flatbed)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
	};
	class rhsusf_M1083A1P2_B_M2_d_open_fmtv_usarmy: rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy
	{
		displayName = "M1083A1P2-B (M2/Open)";
	};
	class rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy: rhsusf_M1083A1P2_B_M2_d_open_fmtv_usarmy
	{
		displayName = "M1083A1P2-B (M2/Flatbed)";
	};
	class rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy: rhsusf_M1083A1P2_B_d_open_fmtv_usarmy
	{
		displayName = "M1083A1P2 (MHQ)";
		class UserActions
		{
			class deployfmtv
			{
				displayName = "Deploy Shelter";
				position = "";
				radius = 2;
				priority = 0.05;
				onlyForplayer = 1;
				condition = "(player == driver this) AND this doorPhase 'extend_shelter_source' < 0.01 and (speed this < 1)";
				statement = "[this,1] spawn rhs_fnc_fmtv_Deploy";
			};
			class foldfmtv: deployfmtv
			{
				displayName = "Fold Shelter";
				condition = "(player == driver this) AND this doorPhase 'extend_shelter_source' > 0.99";
				statement = "[this,0] spawn rhs_fnc_fmtv_Deploy";
			};
		};
	};
	class rhsusf_M1083A1P2_B_M2_d_Medical_fmtv_usarmy: rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy
	{
		displayName = "M1083A1P2 (MedCenter)";
	};
};