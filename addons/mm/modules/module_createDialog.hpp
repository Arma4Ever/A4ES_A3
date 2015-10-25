class GVAR(module_createDialog): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Nowa rozmowa";
	category = "a3cs_modules_interactions";
	function = QUOTE(DFUNC(module_createDialog));

    class Arguments {
        class dialogID {
			displayName = "ID rozmowy";
			description = "";
			typeName = "STRING";
			defaultValue = "";
		};
        class unit {
			displayName = "Jednostka";
			description = "Nazwa jednostki z ktora mozna rozmawiac";
			typeName = "STRING";
			defaultValue = "";
		};
        class avatar {
			displayName = "Sciezka do avatara";
			description = "";
			typeName = "STRING";
			defaultValue = "";
		};
    };

	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
