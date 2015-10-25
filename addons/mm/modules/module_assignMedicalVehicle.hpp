class GVAR(module_assignMedicalVehicle): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Uprawnienia karetki";
	category = "a3cs_modules_settings";
	function = QUOTE(DFUNC(module_assignMedicalVehicle));
	isTriggerActivated = 0;

	class Arguments {};
	class ModuleDescription: ModuleDescription
	{
		description = "Zsynchronizuj modul z kazdym pojazdem ktory ma byc karetka";
	};
};
