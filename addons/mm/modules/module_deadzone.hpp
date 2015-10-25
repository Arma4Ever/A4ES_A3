class GVAR(module_deadzone): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Strefa zabroniona";
	category = "a3cs_modules_effects";
	function = QUOTE(DFUNC(module_deadzone));

    class Arguments {
        class zoneArea {
			displayName = "Strefa";
			description = "Nazwa triggera (np. trigger) lub nazwa markera (np. ""marker"")";
			typeName = "STRING";
			defaultValue = "";
		};
        class zoneTarget {
			displayName = "Cele";
			description = "Tablica typow jednostek jakie maja byc brane pod uwage (np. [""Man"", ""Air""])";
			typeName = "STRING";
			defaultValue = "";
		};
        class zoneSpecCond {
			displayName = "Specjalny warunek";
			description = "Skrypt sprawdzajacy (np. _this == cos1)";
			typeName = "STRING";
			defaultValue = "";
		};
    };

	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
