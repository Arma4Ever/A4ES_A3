class GVAR(module_genCrapfield): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Generator wrakow/smieci";
	category = "a3cs_modules_effects";
	function = QUOTE(DFUNC(module_genCrapfield));

	class Arguments {
        class object {
            displayName = "Obszar";
            description = "Nazwa triggera np. resp01";
            typeName = "STRING";
            defaultValue = "";
        };
        class elements {
            displayName = "Klasy obiektow";
            description = "Tablica z klasami obiektow (np. [""klasa1"", ""klasa2""])";
            typeName = "STRING";
            defaultValue = "";
        };
        class number {
            displayName = "Ilosc obiektow";
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
