class GVAR(module_fireArtillery): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "$STR_A3CS_MM_fireArtillery_Name";
    category = "a3cs_modules_support";
	function = QUOTE(DFUNC(module_fireArtillery));
    isDisposable = 0;

	class Arguments {
        class fireTarget {
            displayName = "Cel";
            description = "Trigger (np. miejsce01)";
            typeName = "STRING";
            defaultValue = "";
        };
		class Ammotype
  		{
			displayName = "$STR_A3CS_MM_fireArtillery_Ammotype_Name";
			description = "$STR_A3CS_MM_fireArtillery_Ammotype_Desc";
			typeName = "STRING";
			class values
			{
				class 82mm {name = "82mm"; value = "Sh_82mm_AMOS"; default = 1;};
				class 155mm {name = "155mm"; value = "ModuleOrdnanceHowitzer_F_Ammo"; default = 0;};
				class smoke {name = "Dymne"; value = "Smoke_120mm_AMOS_White"; default = 0;};
				class rocket {name = "Rakiety 120mm"; value = "Missile_AGM_01_F"; default = 0;};
				class rocketcluster {name = "Rakiety 220mm (kasetowe)"; value = "ModuleOrdnanceRocket_F_Ammo"; default = 0;};
			};
		};
		class Conditionlogic
		{
			displayName = "$STR_A3CS_MM_fireArtillery_Conditionlogic_Name";
			description = "$STR_A3CS_MM_fireArtillery_Conditionlogic_Desc";
			typeName = "STRING";
			defaultValue = "";
		};
		class Conditionnumber
		{
			displayName = "$STR_A3CS_MM_fireArtillery_Conditionnumber_Name";
			description = "$STR_A3CS_MM_fireArtillery_Conditionnumber_Desc";
			typeName = "NUMBER";
			defaultValue = 0;
		};
		class shellmindelay
		{
			displayName = "$STR_A3CS_MM_fireArtillery_shellmindelay_Name";
			description = "$STR_A3CS_MM_fireArtillery_shellmindelay_Desc";
			typeName = "NUMBER";
			defaultValue = 1;
		};
		class shellmaxdelay
		{
			displayName = "$STR_A3CS_MM_fireArtillery_shellmaxdelay_Name";
			description = "$STR_A3CS_MM_fireArtillery_shellmaxdelay_Desc";
			typeName = "NUMBER";
			defaultValue = 3;
		};
	};
	class ModuleDescription: ModuleDescription
	{
		description = "";
		sync[] = {};
	};
};
