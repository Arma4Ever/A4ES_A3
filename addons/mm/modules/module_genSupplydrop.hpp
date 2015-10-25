class GVAR(module_genSupplydrop): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Zrzut skrzynki z samolotu";
	category = "a3cs_modules_supplies";
	function = QUOTE(DFUNC(module_genSupplydrop));

	class Arguments {
        class planeClass {
            displayName = "Klasa samolotu";
            description = "np. RHS_C130J";
            typeName = "STRING";
            defaultValue = "";
        };
        class dropTarget {
            displayName = "Miejsce zrzutu";
            description = "Trigger (np. miejsce01) lub nazwa markera (np. ""miejsce01"")";
            typeName = "STRING";
            defaultValue = "";
        };
        class side {
            displayName = "Strona";
            description = "";
            typeName = "STRING";
            class values
			{
				class blufor {name = "BLUFOR"; value = "west"; default = 1;};
				class opfor {name = "OPFOR"; value = "east"; default = 0;};
				class indep {name = "Independent"; value = "independent"; default = 0;};
				class civ {name = "Cywil"; value = "civilian"; default = 0;};
			};
        };
        class items {
            displayName = "Ladunek";
            description = "Tablica z generatora skrzynek (np. [[""cos"", 1],[""cos2"", 2]])";
            typeName = "STRING";
            defaultValue = "";
        };
        class dropHeight {
            displayName = "Wysokosc zrzutu";
            description = "";
            typeName = "NUMBER";
            defaultValue = 800;
        };
        class dropChemlight {
            displayName = "Przyczep do skrzynki chemlighta";
            description = "";
            typeName = "BOOL";
        };
        class planeFlares {
            displayName = "Flary podczas zrzutu";
            description = "";
            typeName = "BOOL";
        };
    };
	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
