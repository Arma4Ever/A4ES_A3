class GVAR(module_getInVehicle): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Wsiadanie do pojazdu";
	category = "a3cs_modules_ai";
	function = QUOTE(DFUNC(module_getInVehicle));

    class Arguments {
        class targetVehicle {
            displayName = "Pojazd";
            description = "Nazwa pojazdu (np. auto01)";
            typeName = "STRING";
            defaultValue = "";
        };
    };
	class ModuleDescription: ModuleDescription
	{
		description = "Zsynchronizuj modul z kazda jednostka ktora ma wsiasc do danego pojazdu";
	};
};
