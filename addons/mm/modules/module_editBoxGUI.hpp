class GVAR(module_editBoxGUI): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "$STR_A3CS_MM_EditBoxGUI_Displayname";
    category = "a3cs_modules_supplies";
	function = QUOTE(DFUNC(module_editBoxGUI));

	class Arguments {};
	class ModuleDescription: ModuleDescription
	{
		description = "$STR_A3CS_MM_EditBoxGUI_Desciption";
	};
};
