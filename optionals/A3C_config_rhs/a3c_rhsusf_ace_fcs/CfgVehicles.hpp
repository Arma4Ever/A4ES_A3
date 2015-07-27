class Optics_Armored;
class Optics_Commander_01: Optics_Armored
{
	class Wide;
	class Medium;
	class Narrow;
};

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
	};
	class MBT_01_base_F: Tank_F
	{
		class EventHandlers;
	};
	class rhsusf_m1a1tank_base: MBT_01_base_F
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class OpticsIn
				{
					class Wide: ViewOptics
					{
						initAngleX = 0;
						minAngleX = -30;
						maxAngleX = "+30";
						initAngleY = 0;
						minAngleY = -100;
						maxAngleY = "+100";
						initFov = "0.7/3";
						minFov = 0.3;
						maxFov = 0.3;
						visionMode[] = {"Normal","Ti"};
						thermalMode[] = {2,3};
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2";
						gunnerOpticsEffect[] = {"TankGunnerOptics1","OpticsBlur2","OpticsCHAbera2"};
					};
					class Medium: Wide
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A1_2";
						initFov = "0.7/10";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Wide_TI: Wide
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_ti";
						visionMode[] = {"Normal","Ti"};
						initFov = "0.7/3";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Wide2_TI: Wide_TI
					{
						initFov = "0.7/6";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Medium_TI: Wide_TI
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_2";
						initFov = "0.7/13";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Medium2_TI: Wide_TI
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_3";
						initFov = "0.7/25";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Narrow_TI: Wide_TI
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_4";
						initFov = "0.7/50";
						minFov = 0.07;
						maxFov = 0.07;
					};
				};
			};
		};
	};
	class rhsusf_m1a1aimwd_usarmy: rhsusf_m1a1tank_base {};
	class rhsusf_m1a1aimd_usarmy: rhsusf_m1a1tank_base {};
	class rhsusf_m1a1aim_tuski_wd: rhsusf_m1a1tank_base {};
	class rhsusf_m1a1aim_tuski_d: rhsusf_m1a1aim_tuski_wd {};
	class rhsusf_m1a1fep_d: rhsusf_m1a1tank_base
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				weapons[] = {"rhs_weap_m256","rhs_weap_m240_abrams_coax"};
				magazines[] = {"rhs_mag_M829A2","rhs_mag_M830A1","rhs_mag_762x51_M240_1200","rhs_mag_762x51_M240_1200","rhs_mag_762x51_M240_1200","rhs_mag_762x51_M240_1200","rhs_mag_762x51_M240_1200","rhs_mag_762x51_M240_1200","rhs_mag_762x51_M240_1200","rhs_mag_762x51_M240_1200","rhs_mag_762x51_M240_1200"};
				class OpticsIn
				{
					class Wide: ViewOptics
					{
						initAngleX = 0;
						minAngleX = -30;
						maxAngleX = "+30";
						initAngleY = 0;
						minAngleY = -100;
						maxAngleY = "+100";
						initFov = "0.7/3";
						minFov = 0.3;
						maxFov = 0.3;
						visionMode[] = {"Normal","Ti"};
						thermalMode[] = {2,3};
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2";
						gunnerOpticsEffect[] = {};
					};
					class Medium: Wide
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A1_2";
						initFov = "0.7/10";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Wide_TI: Wide
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_ti";
						visionMode[] = {"Normal","Ti"};
						initFov = "0.7/3";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Wide2_TI: Wide_TI
					{
						initFov = "0.7/6";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Medium_TI: Wide_TI
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_2";
						initFov = "0.7/13";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Medium2_TI: Wide_TI
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_3";
						initFov = "0.7/25";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Narrow_TI: Wide_TI
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_4";
						initFov = "0.7/50";
						minFov = 0.07;
						maxFov = 0.07;
					};
				};
			};
		};
	};
	class rhsusf_m1a1fep_wd: rhsusf_m1a1tank_base {};
	class rhsusf_m1a1fep_od: rhsusf_m1a1tank_base {};

	class rhsusf_m1a2tank_base: rhsusf_m1a1tank_base
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class Turrets: Turrets
				{
					class CommanderOptics: CommanderOptics
					{
						class OpticsIn: Optics_Commander_01
						{
							class Wide: Wide
							{
								initFov = "0.7/3";
								minFov = 0.07;
								maxFov = 0.07;
							};
							class Medium: Medium
							{
								initFov = "0.7/6";
								minFov = 0.07;
								maxFov = 0.07;
							};
							class Medium_TI: Medium
							{
								initFov = "0.7/13";
								minFov = 0.07;
								maxFov = 0.07;
								visionMode[] = {"Normal","Ti"};
							};
							class Medium2_TI: Medium_TI
							{
								initFov = "0.7/25";
								minFov = 0.07;
								maxFov = 0.07;
							};
							class Narrow_TI: Medium_TI
							{
								initFov = "0.7/50";
								minFov = 0.07;
								maxFov = 0.07;
							};
						};
					};
				};
				class OpticsIn
				{
					class Wide: ViewOptics
					{
						initAngleX = 0;
						minAngleX = -30;
						maxAngleX = "+30";
						initAngleY = 0;
						minAngleY = -100;
						maxAngleY = "+100";
						initFov = "0.7/3";
						minFov = 0.3;
						maxFov = 0.3;
						visionMode[] = {"Normal","Ti"};
						thermalMode[] = {2,3};
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2";
						gunnerOpticsEffect[] = {};
					};
					class Medium: Wide
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A1_2";
						initFov = "0.7/10";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Wide_TI: Wide
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_ti";
						visionMode[] = {"Normal","Ti"};
						initFov = "0.7/3";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Wide2_TI: Wide_TI
					{
						initFov = "0.7/6";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Medium_TI: Wide_TI
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_2";
						initFov = "0.7/13";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Medium2_TI: Wide_TI
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_3";
						initFov = "0.7/25";
						minFov = 0.07;
						maxFov = 0.07;
					};
					class Narrow_TI: Wide_TI
					{
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_4";
						initFov = "0.7/50";
						minFov = 0.07;
						maxFov = 0.07;
					};
				};
			};
		};
	};
	class rhsusf_m1a2sep1d_usarmy: rhsusf_m1a2tank_base {};
	class rhsusf_m1a2sep1wd_usarmy: rhsusf_m1a2tank_base {};
	class rhsusf_m1a2sep1tuskid_usarmy: rhsusf_m1a2tank_base {};
	class rhsusf_m1a2sep1tuskiwd_usarmy: rhsusf_m1a2sep1tuskid_usarmy {};
	class rhsusf_m1a2sep1tuskiiwd_usarmy: rhsusf_m1a2sep1tuskid_usarmy {};
	class rhsusf_m1a2sep1tuskiid_usarmy: rhsusf_m1a2sep1tuskid_usarmy {};

};
