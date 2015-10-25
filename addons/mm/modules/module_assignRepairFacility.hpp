class GVAR(module_assignRepairFacility): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Uprawnienia warsztatu";
	category = "a3cs_modules_settings";
	function = QUOTE(DFUNC(module_assignRepairFacility));
	isTriggerActivated = 0;

	class Arguments {};
	class ModuleDescription: ModuleDescription
	{
		description = "Zsynchronizuj modul z kazdym obiektem ktory ma byc warsztatem";
	};
};
