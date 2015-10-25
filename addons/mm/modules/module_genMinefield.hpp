class GVAR(module_genMinefield): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Generator pola minowego";
	category = "a3cs_modules_effects";
	function = QUOTE(DFUNC(module_genMinefield));

	class Arguments {
        class object {
            displayName = "Obszar";
            description = "Nazwa triggera np. resp01";
            typeName = "STRING";
            defaultValue = "";
        };
        class elements {
            displayName = "Klasy min";
            description = "Tablica z klasami min (np. [""klasa1"", ""klasa2""])";
            typeName = "STRING";
            defaultValue = "";
        };
        class number {
            displayName = "Ilosc min";
            description = "";
            typeName = "NUMBER";
            defaultValue = 0;
        };
    };
	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
