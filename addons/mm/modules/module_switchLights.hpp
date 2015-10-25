class GVAR(module_switchLights): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Latarnie";
	category = "a3cs_modules_effects";
	function = QUOTE(DFUNC(module_switchLights));

	class Arguments {
        class object {
            displayName = "Obszar";
            description = "Nazwa triggera np. resp01";
            typeName = "STRING";
            defaultValue = "";
        };
        class mode {
            displayName = "Tryb";
            description = "";
            typeName = "STRING";
            class values
    		{
    			class off {name = "Wylacz"; value = "off"; default = 1;};
    			class onn {name = "Wlacz"; value = "on"; default = 0;};
    		};
        };
    };
	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
