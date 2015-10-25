class GVAR(module_surrenderUnit): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Poddaj jednostke";
	category = "a3cs_modules_ai";
	function = QUOTE(DFUNC(module_surrenderUnit));

	class Arguments {};
	class ModuleDescription: ModuleDescription
	{
		description = "Zsynchronizuj modul z kazda jednostka ktora ma sie poddac";
	};
};
