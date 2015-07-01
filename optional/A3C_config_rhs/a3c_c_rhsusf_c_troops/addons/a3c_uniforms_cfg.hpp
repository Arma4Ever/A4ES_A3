class cfgWeapons
{
	class Uniform_Base;
	class UniformItem;	
	class rhsusf_navyseals: Uniform_Base
	{
		scope = 2;
		displayName = "Umundurowanie Navy Seals";
		picture = "\pam_BLUEFOR\Jednostki_PL\PL_Piechota_woodland\Uniformy\UI\uniform_ui.paa";
		model = "\A3\Characters_F\BLUFOR\b_soldier_01";
		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "rhsusf_navyseals";
			containerClass = "Supply20";
			mass = 80;
		};
	};
	class rhsusf_usaf: Uniform_Base
	{
		scope = 2;
		displayName = "Umundurowanie USAF";
		picture = "\pam_BLUEFOR\Jednostki_PL\PL_Piechota_woodland\Uniformy\UI\uniform_ui.paa";
		model = "\A3\Characters_F\BLUFOR\b_soldier_01";
		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "rhsusf_usaf";
			containerClass = "Supply20";
			mass = 80;
		};
	};	
	class rhsusf_deltaforce: Uniform_Base
	{
		scope = 2;
		displayName = "Umundurowanie Delta Force";
		picture = "\pam_BLUEFOR\Jednostki_PL\PL_Piechota_woodland\Uniformy\UI\uniform_ui.paa";
		model = "\A3\Characters_F\BLUFOR\b_soldier_01";
		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "rhsusf_deltaforce";
			containerClass = "Supply20";
			mass = 80;
		};
	};		
	
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	class H_HelmetB;
	class ItemCore;	
	class HeadGearItem;	
	class ItemInfo;
	class a3c_rhs_helmet_air : H_HelmetB
{
	displayName = "LWH AIR-UCP";
	picture = "\A3\characters_f\Data\UI\icon_H_helmet_plain_ca.paa";

	model = "\rhsusf\addons\rhsusf_infantry\gear\head\lwh_wd";

	hiddenSelections[] = {"Camo"};
	hiddenSelectionsTextures[] = {"\A3C_config_rhs\a3c_c_rhsusf_c_troops\addons\data\helm_air_co.paa"};

	class ItemInfo: ItemInfo
	{
		mass = 40;
		uniformModel = "\rhsusf\addons\rhsusf_infantry\gear\head\lwh_wd";
		allowedSlots[] = {801,901,701,605};
		modelSides[] = {6};
		armor = 4;
		passThrough = 0.5;
	};
};
};	