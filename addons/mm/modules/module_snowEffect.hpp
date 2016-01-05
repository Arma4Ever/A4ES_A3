class GVAR(module_snowEffect): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Opady sniegu";
	category = "a3cs_modules_effects";
	function = QUOTE(DFUNC(module_snowEffect));

    class Arguments {
		class effecttype {
			displayName = "Typ opadow";
			description = "";
			typeName = "NUMBER";
			class values {
				class flurry {name = "Rzadkie"; value = 0; default = 1;};
				class lightStorm {name = "Lekka burza"; value = 1; default = 0;};
				class mediumStorm {name = "Burza"; value = 2; default = 0;};
			};
		};
    };
	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
