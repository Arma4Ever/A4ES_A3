class GVAR(module_snowEffect): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Opady sniegu";
	category = "a3cs_modules_effects";
	function = QUOTE(DFUNC(module_snowEffect));

    class Arguments {
		class effecttype {
			displayName = "Sila opadow";
			description = "";
			typeName = "NUMBER";
			class values {
				class none {name = "Brak"; value = 0; default = 1;};
				class easy {name = "Slabe opady"; value = 1; default = 0;};
				class medium {name = "Srednie opady"; value = 2; default = 0;};
				class hard {name = "Silne opady"; value = 3; default = 0;};
			};
		};
    };
	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
