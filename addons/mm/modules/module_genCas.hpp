class GVAR(module_genCas): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "CAS";
	category = "a3cs_modules_support";
	function = QUOTE(DFUNC(module_genCas));

	class Arguments {
        class casTarget {
			displayName = "Cel";
			description = "Nazwa markera bez cudzyslowia (np. marker)";
			typeName = "STRING";
		};
        class planeClass {
			displayName = "Klasa samolotu";
			description = "";
			typeName = "STRING";
		};
        class weaponTypesID {
			displayName = "Typ ataku";
			description = "";
			typeName = "NUMBER";
            class values
			{
				class machinegun {name = "Ostrzal z dzialka"; value = 0; default = 1;};
				class missilelauncher {name = "Ostrzal z rakiet"; value = 1; default = 0;};
				class gunandmissile {name = "Ostrzal z rakiet + dzialka"; value = 2; default = 0;};
				class bomblauncher {name = "Zrzut bomb (wszystkie)"; value = 3; default = 0;};
				class bomblauncherone {name = "Zrzut bomb (jedna)"; value = 4; default = 0;};
			};
		};
        class weaponIndex {
            displayName = "Index broni";
			description = "Wykorzystywany tylko jesli samolot ma wiecej niz 1 bron danego typu";
			typeName = "NUMBER";
            defaultValue = 0;
		};
    };
	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
