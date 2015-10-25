class GVAR(module_addDialogQuery): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Nowe pytanie";
	category = "a3cs_modules_interactions";
	function = QUOTE(DFUNC(module_addDialogQuery));

    class Arguments {
        class dialogID {
			displayName = "ID rozmowy";
			description = "";
			typeName = "STRING";
			defaultValue = "";
		};
        class dialogQuestion {
			displayName = "Pytanie";
			description = "";
			typeName = "STRING";
			defaultValue = "";
		};
        class dialogAnswer {
			displayName = "Odpowiedz";
			description = "";
			typeName = "STRING";
			defaultValue = "";
		};
        class dialogTarget {
			displayName = "Uprawnieni do rozmowy";
			description = "Strona (np. west) lub tablica (np. [jednostka1, jednostka2]) uprawniona do rozmowy. Jesli kazdy wpisz: true";
			typeName = "STRING";
			defaultValue = "";
		};
    };

	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
