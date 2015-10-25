class GVAR(module_genSoldiers): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Generator AI";
	category = "a3cs_modules_ai";
	function = QUOTE(DFUNC(module_genSoldiers));

    class Arguments {
        class place {
            displayName = "Miejsce respu";
            description = "Nazwa triggera np. resp01";
            typeName = "STRING";
            defaultValue = "";
        };
        class distanceLand {
            displayName = "Odl. respu dla jed. lad.";
            description = "Z jakiej odleglosci najblizszy gracz ma uruchomic resp AI";
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class distanceAir {
            displayName = "Odl. respu dla jed. pow.";
            description = "Z jakiej odleglosci najblizszy samolot/helka ma uruchomic resp AI. Zostaw 0 jesli jednostki powietrzne maja nie uruchamiac respu.";
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class ammount {
            displayName = "Ilosc grup AI";
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
            description = "Tabliza z klasami jednostek (np. [""klasa1"", ""klasa2""])";
            typeName = "STRING";
            defaultValue = "";
        };
        class groupCount {
            displayName = "Ilosc AI z grupie";
            description = "Wartosc stala np. 5 lub losowa np. [3,5] (czyli od 3 do 5)";
            typeName = "STRING";
            defaultValue = "";
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
