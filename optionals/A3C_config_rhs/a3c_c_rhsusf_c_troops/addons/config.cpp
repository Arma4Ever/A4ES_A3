class CfgPatches
{
	class a3c_c_rhsusf_c_troops
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhsusf_c_troops","rhsusf_main"};
		author[] = {"A3C"};
		authorUrl = "";
		versionDesc = "";
		version = "";
		text = "";
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgVehicleClasses
{ 
	class rhs_vehclass_infantry
	{
		displayname = "U.S. Air Force";
	};
	class rhs_vehclass_infantry_ucp
	{ 
		displayname = "U.S. Army (UCP)";
	};
	class rhs_vehclass_infantry_ocp
	{ 
		displayname = "U.S. Army (Multicam)";
	};
	class rhs_vehclass_infantry_usmc_d
	{ 
		displayname = "USMC (Marpat Desert)";
	};
	class rhs_vehclass_infantry_usmc_wd
	{ 
		displayname = "USMC (Marpat Woodland)";
	};
	class rhs_vehclass_infantry_usmc_fr_d
	{ 
		displayname = "USMC Recon (Marpat Desert)";
	};
	class rhs_vehclass_infantry_usmc_bdu_wd
	{ 
		displayname = "USMC (BDU Woodland)";
	};	
	class rhs_vehclass_infantry_101
	{ 
		displayname = "U.S. Army 101st Airborne Division";
	};		
	class rhs_vehclass_infantry_1cav
	{ 
		displayname = "U.S. Army 1st Cavalry Division";
	};	
	class rhs_vehclass_navyseals
	{ 
		displayname = "S.F. Navy Seals";
	};	
	class rhs_vehclass_deltaforce
	{ 
		displayname = "S.F. Delta Force";
	};		
	class rhs_vehclass_infantry_usmc_fr_wd
	{ 
		displayname = "USMC Recon (Marpat Woodland)";
	};
};
class CfgVehicles {
	class Land;
	class Man: Land
	{
		class EventHandlers;
	};
	class CAManBase: Man {};
	class SoldierWB;

	#include "rhsusf_infantry_army_ocp.hpp"
	#include "rhsusf_infantry_army_ucp.hpp"
	#include "rhsusf_infantry_usmc_marpat_wd.hpp"
	#include "rhsusf_infantry_usmc_marpat_d.hpp"
	#include "rhsusf_infantry_usmc_fr_marpat_wd.hpp"
	#include "rhsusf_infantry_usmc_fr_marpat_d.hpp"
	#include "rhsusf_infantry_socom_marsoc_m81.hpp"
	#include "rhsusf_infantry_navy.hpp"
	#include "rhsusf_infantry_airforce.hpp"
	#include "rhsusf_infantry_usmc_bdu_wd.hpp"
	#include "rhsusf_infantry_airborne.hpp"	
	#include "rhsusf_infantry_1st_cav.hpp"
	#include "rhsusf_infantry_navyseals.hpp"
	#include "rhsusf_infantry_usaf_troops.hpp"	
	#include "rhsusf_infantry_deltaforce.hpp"		
	
	#include "plecaki_a3c_rhs.hpp"
};
	#include "a3c_uniforms_cfg.hpp"
