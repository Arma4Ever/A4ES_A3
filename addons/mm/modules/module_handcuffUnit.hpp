class GVAR(module_handcuffUnit): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Zakuj jednostke";
	category = "a3cs_modules_ai";
	function = QUOTE(DFUNC(module_handcuffUnit));

	class Arguments {};
	class ModuleDescription: ModuleDescription
	{
		description = "Zsynchronizuj modul z kazda jednostka ktora ma zostac zakuta";
	};
};
