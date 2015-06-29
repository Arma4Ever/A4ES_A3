
	class rhsusf_socom_marsoc_base: rhsusf_infantry_usmc_base
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_MARSOC";
		displayName = "$STR_RHSUSF_INF_RIFLEMAN";
	};

	class rhsusf_socom_marsoc_cso_cqb: rhsusf_socom_marsoc_base
	{
		displayName = $STR_RHSUSF_MARSOC_OPERATOR_CQB;
	};

	class rhsusf_socom_marsoc_cso: rhsusf_socom_marsoc_base
	{
		displayName = $STR_RHSUSF_MARSOC_OPERATOR;
	};

	class rhsusf_socom_marsoc_cso_light: rhsusf_socom_marsoc_base
	{
		displayName = $STR_RHSUSF_MARSOC_OPERATOR_L;
	};

	class rhsusf_socom_marsoc_cso_breacher: rhsusf_socom_marsoc_base
	{
		displayName = $STR_RHSUSF_MARSOC_OPERATOR_B;
	};

	class rhsusf_socom_marsoc_cso_grenadier: rhsusf_socom_marsoc_cso
	{
		displayName = "$STR_RHSUSF_INF_GRENADIERA";
	};

	class rhsusf_socom_marsoc_teamleader: rhsusf_socom_marsoc_cso
	{
		displayName = $STR_RHSUSF_MARSOC_TEAMLEADER;
	};

	class rhsusf_socom_marsoc_teamchief: rhsusf_socom_marsoc_cso
	{
		displayName = $STR_RHSUSF_MARSOC_TEAMCHIEF;
	};

	class rhsusf_socom_marsoc_elementleader: rhsusf_socom_marsoc_cso
	{
		displayName = $STR_RHSUSF_MARSOC_ELEMENTLEADER;
	};

	class rhsusf_socom_marsoc_jfo: rhsusf_socom_marsoc_base
	{
		displayName = "$STR_RHSUSF_INF_JFO";
	};

	class rhsusf_socom_marsoc_cso_eod: rhsusf_socom_marsoc_base
	{
		displayName = $STR_RHSUSF_MARSOC_EOD;
	};

	class rhsusf_socom_marsoc_cso_mechanic: rhsusf_socom_marsoc_base
	{
		displayName = $STR_RHSUSF_MARSOC_MECH;
	};

	class rhsusf_socom_marsoc_marksman: rhsusf_socom_marsoc_cso
	{
		displayName = $STR_RHSUSF_INF_MARKSMAN;
	};

	class rhsusf_socom_marsoc_spotter: rhsusf_socom_marsoc_cso_light
	{
		displayName = $STR_RHSUSF_INF_USMC_SPOTTER;
	};

	class rhsusf_socom_marsoc_sniper: rhsusf_socom_marsoc_marksman
	{
		displayName = $STR_RHSUSF_INF_USMC_SNIPER;
	};