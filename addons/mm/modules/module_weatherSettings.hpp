class GVAR(module_weatherSettings): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Ustawienia pogody";
    category = "a3cs_modules_settings";
	function = QUOTE(DFUNC(module_weatherSettings));
	isTriggerActivated = 0;

	class Arguments {
        class useACEWeather {
            displayName = "$STR_ACE_Weather_useACEWeather_DisplayName";
            description = "$STR_ACE_Weather_useACEWeather_Description";
            typeName = "BOOL";
            defaultValue = 1;
        };
	};
	class ModuleDescription: ModuleDescription
	{
		description = "";
		sync[] = {};
	};
};
