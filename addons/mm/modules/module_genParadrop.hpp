class GVAR(module_genParadrop): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Zrzut AI z samolotu";
	category = "a3cs_modules_ai";
	function = QUOTE(DFUNC(module_genParadrop));

	class Arguments {
        class planeClass {
            displayName = "Klasa samolotu";
            description = "np. RHS_C130J";
            typeName = "STRING";
            defaultValue = "";
        };
        class dropTarget {
            displayName = "Miejsce zrzutu";
            description = "Trigger (np. miejsce01) lub nazwa markera (np. ""miejsce01"")";
            typeName = "STRING";
            defaultValue = "";
        };
        class amount {
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
            displayName = "Klasy";
            description = "Tablica z klasami np. [""klasa01"",""klasa02""]";
            typeName = "STRING";
            defaultValue = "";
        };
        class script {
            displayName = "Skrypt dla jednostek";
            description = "np. _this setskill 0.7";
            typeName = "STRING";
            defaultValue = "";
        };
        class jumpHeight {
            displayName = "Wysokosc zrzutu";
            description = "";
            typeName = "NUMBER";
            defaultValue = 1000;
        };
        class openHeight {
            displayName = "Wysokosc otwarcia spadochronu";
            description = "";
            typeName = "NUMBER";
            defaultValue = 400;
        };
        class planeFlares {
            displayName = "Flary podczas zrzutu";
            description = "";
            typeName = "BOOL";
        };
        class nextTarget {
            displayName = "Punkt zbiorki";
            description = "Marker do ktorego beda zmierzac AI po wyladowaniu (np. ""marker01"")";
            typeName = "STRING";
            defaultValue = "";
        };
    };
	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
