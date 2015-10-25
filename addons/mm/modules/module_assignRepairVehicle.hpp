class GVAR(module_assignRepairVehicle): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Uprawnienia pojazdu naprawczego";
	category = "a3cs_modules_settings";
	function = QUOTE(DFUNC(module_assignRepairVehicle));
	isTriggerActivated = 0;

	class Arguments {};
	class ModuleDescription: ModuleDescription
	{
		description = "Zsynchronizuj modul z kazdym pojazdem ktory ma byc pojazdem naprawczym";
	};
};
