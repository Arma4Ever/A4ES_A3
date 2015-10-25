class GVAR(module_genAttack): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Generator atakow";
	category = "a3cs_modules_ai";
	function = QUOTE(DFUNC(module_genAttack));

	class Arguments {
        class place {
            displayName = "Miejsce respu";
            description = "Nazwa triggera np. resp01";
            typeName = "STRING";
            defaultValue = "";
        };
        class marker {
            displayName = "Cel";
            description = "Nazwa markera np. ""cel01""";
            typeName = "STRING";
            defaultValue = "";
        };
        class ammount {
            displayName = "Ilosc AI";
            description = "";
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class side {
            displayName = "Strona";
            description = "";
            typeName = "STRING";
            class values
			{
				class blufor {name = "BLUFOR"; value = "west"; default = 1;};
				class opfor {name = "OPFOR"; value = "east"; default = 0;};
				class indep {name = "Independent"; value = "independent"; default = 0;};
				class civ {name = "Cywil"; value = "civilian"; default = 0;};
			};
        };
        class classes {
            displayName = "Klasy jednostek";
            description = "Tablica z klasami jednostek (np. [""klasa1"", ""klasa2""])";
            typeName = "STRING";
            defaultValue = "";
        };
        class condition {
            displayName = "Warunek respu";
            description = "Warunek logiczny (np. alive unit1) lub liczbowy (limit zrespionych jednostek np. 20)";
            typeName = "STRING";
            defaultValue = "";
        };
        class ingroup {
            displayName = "Atakuj w grupach";
            description = "Tak - tak w grupach, Nie - atak jako rozproszone jednostki";
            typeName = "BOOL";
        };
        class script {
            displayName = "Skrypt jednostki";
            description = "np. _this setSkill 0.7";
            typeName = "STRING";
            defaultValue = "";
        };
        class ignore {
            displayName = "Obszary ignorowane";
            description = "Tablica z triggerami w ktorych AI ma sie nie respic (np. [trig01,trig02])";
            typeName = "STRING";
            defaultValue = "";
        };
    };
	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
