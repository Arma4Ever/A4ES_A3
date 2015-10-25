class GVAR(module_editBox): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "$STR_A3CS_MM_EditBox_Displayname";
    category = "a3cs_modules_supplies";
	function = QUOTE(DFUNC(module_editBox));

	class Arguments
	{
		class contentcode
		{
			displayName = "$STR_A3CS_MM_EditBox_Contentcode_Displayname";
			description = "$STR_A3CS_MM_EditBox_Contentcode_Description";
			typeName = "STRING";
		};
		class clearbefore
  		{
			displayName = "$STR_A3CS_MM_EditBox_Clearbefore_Displayname";
			description = "$STR_A3CS_MM_EditBox_Clearbefore_Description";
			typeName = "BOOL";
			class values
			{
				class yes {
					name = "Tak";
					value = 1;
					default = 1;
				};
				class no {
					name = "Nie";
					value = 0;
				};
			};
		};
	};
	class ModuleDescription: ModuleDescription
	{
		description = "$STR_A3CS_MM_EditBox_Desciption";
		sync[] = {"ReammoBox_F"};
	};
};
