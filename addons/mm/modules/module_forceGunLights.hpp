class GVAR(module_forceGunLights): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Wymus wlaczenie latarek";
	category = "a3cs_modules_ai";
	function = QUOTE(DFUNC(module_forceGunLights));

	class Arguments {};
	class ModuleDescription: ModuleDescription
	{
		description = "Zsynchronizuj modul z kazda jednostka ktorej grupa ma wlaczyc latarki";
	};
};
