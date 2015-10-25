class GVAR(module_assignMedic): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Uprawnienia medyka";
	category = "a3cs_modules_settings";
	function = QUOTE(DFUNC(module_assignMedic));
	isTriggerActivated = 0;

	class Arguments {};
	class ModuleDescription: ModuleDescription
	{
		description = "Zsynchronizuj modul z kazda jednostka ktora ma byc medykiem";
	};
};
