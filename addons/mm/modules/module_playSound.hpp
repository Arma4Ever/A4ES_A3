class GVAR(module_playSound): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Odtwarzacz dzwiekow";
	category = "a3cs_modules_effects";
	function = QUOTE(DFUNC(module_playSound));

	class Arguments {
        class object {
            displayName = "Zrodlo dzwieku";
            description = "Nazwa obiektu np. logika1";
            typeName = "STRING";
            defaultValue = "";
        };
        class sound {
            displayName = "Sciezka do dzwieku";
            description = "np. sounds\dzwiek.ogg";
            typeName = "STRING";
        };
        class soundFromMS {
            displayName = "Dzwiek z folderu misji";
            description = "Tak jesli z folderu misji, Nie jesli sciezka bezwzgledna (pbo)";
            typeName = "BOOL";
        };
        class isInside {
            displayName = "Zrodlo dzwieku w budynku";
            description = "Tak jesli zrodlo znajduje sie w pomieszczeniu, Nie jesli na otwartej przestrzeni";
            typeName = "BOOL";
        };
        class volume {
            displayName = "Glosnosc";
            description = "";
            typeName = "NUMBER";
            defaultValue = 10;
        };
        class distance {
            displayName = "Zasieg";
            description = "Maksymalny zasieg slyszalnosci";
            typeName = "NUMBER";
            defaultValue = 50;
        };
    };
	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
