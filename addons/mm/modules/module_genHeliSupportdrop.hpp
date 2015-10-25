class GVAR(module_genHeliSupportdrop): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Zrzut sprzetu z helikoptera";
	category = "a3cs_modules_supplies";
	function = QUOTE(DFUNC(module_genHeliSupportdrop));

	class Arguments {
        class dropTarget {
			displayName = "Miejsce zrzutu";
			description = "Nazwa markera (bez cudzyslowia)";
			typeName = "STRING";
		};
        class heliClass {
			displayName = "Klasa smiglowca";
			description = "";
			typeName = "STRING";
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
        class cargoClass {
			displayName = "Ladunek";
			description = "Tablica z generatora skrzynek (w przypadku zrzutu skrzynki np. [[""cos"", 1],[""cos2"", 2]]) lub klasa pojazdu (w przypadku zrzutu pojazdu np. ""B_MRAP_01_F"")";
			typeName = "STRING";
		};
        class dropDistance {
			displayName = "Odleglosc respu";
			description = "Odleglosc w metrach miejsca respu helikoptera od miejsca zrzutu";
			typeName = "NUMBER";
            defaultValue = 3000;
		};
        class dropHeight {
			displayName = "Wysokosc respu";
			description = "";
            typeName = "NUMBER";
            defaultValue = 200;
		};
    };
	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
