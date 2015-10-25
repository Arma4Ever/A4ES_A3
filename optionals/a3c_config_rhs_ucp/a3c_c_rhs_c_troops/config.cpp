class CfgPatches
{
	class a3c_c_rhs_c_troops
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_c_troops"};
		author[] = {"A3C"};
		authorUrl = "";
		versionDesc = "";
		version = "";
		text = "";
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgVehicles {
	class Land;
	class Man: Land
	{
		class EventHandlers;
	};
	class CAManBase: Man {};
	class SoldierGB;
	
	#include "rhs_infantry_msv.hpp"
	#include "rhs_infantry_msv_emr.hpp"
	#include "rhs_infantry_vdv.hpp"
	#include "rhs_infantry_vdv_flora.hpp"
	#include "rhs_infantry_vdv_mflora.hpp"
	#include "rhs_infantry_vdv_recon.hpp"
	#include "rhs_infantry_specnaz.hpp"	
	
};
#include "rhs_infantry_specnaz_uniforms.hpp"	