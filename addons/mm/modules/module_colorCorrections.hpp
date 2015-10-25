class GVAR(module_colorCorrections): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Filtr kolorystyczny";
	category = "a3cs_modules_effects";
	function = QUOTE(DFUNC(module_colorCorrections));

    class Arguments {
        class EffectType {
            displayName = "Typ efektu";
            description = "Typ efektu widocznego na ekranie po uruchomieniu modułu";
            typeName = "STRING";
            class values {
                class Effect01 {
                    name = "DayZ Standalone";
                    value = "dayz";
                    default = 1;
                };
                class Effect02 {
                    name = "Operation Flashpoint";
                    value = "ofp";
                    default = 0;
                };
                class Effect03 {
                    name = "Arma 2";
                    value = "a2";
                    default = 0;
                };
                class Effect04 {
                    name = "Arma 2 OA";
                    value = "a2oa";
                    default = 0;
                };
                class Effect05 {
                    name = "Zima";
                    value = "zima";
                    default = 0;
                };
                class Effect06 {
                    name = "Wiosna";
                    value = "wiosna";
                    default = 0;
                };
                class Effect07 {
                    name = "Jesien";
                    value = "jesien";
                    default = 0;
                };
                class Effect08 {
                    name = "Sloneczny dzien";
                    value = "sloneczny_dzien";
                    default = 0;
                };
                class Effect09 {
                    name = "Deszczowy dzien";
                    value = "deszczowy_dzien";
                    default = 0;
                };
                class Effect10 {
                    name = "Afryka";
                    value = "afryka";
                    default = 0;
                };
                class Effect11 {
                    name = "Pustynia";
                    value = "pustynia";
                    default = 0;
                };
                class Effect12 {
                    name = "Postapo";
                    value = "postapo";
                    default = 0;
                };
            };
        };
    };
    class ModuleDescription: ModuleDescription
    {
        description = "Zmiana kolorystyki widocznej w grze.";
        sync[] = {};
        position = 1;
    };
};
class PAM_Modules_CC_Effect: A3C_Module {
    scope = 1;
};
