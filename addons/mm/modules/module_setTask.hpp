class GVAR(module_setTask): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Nowe zadanie";
	category = "a3cs_modules_tasks";
	function = QUOTE(DFUNC(module_setTask));

	class Arguments {
        class taskID {
			displayName = "ID zadania";
			description = "";
			typeName = "STRING";
			defaultValue = "";
		};
        class taskTitle {
			displayName = "Tytul zadania";
			description = "";
			typeName = "STRING";
			defaultValue = "";
		};
        class taskDescription {
			displayName = "Opis zadania";
			description = "";
			typeName = "STRING";
			defaultValue = "";
		};
        class taskTarget {
			displayName = "Grupa docelowa";
			description = "Strona (np. west, east itp) lub tablica jednostek (np. [jednostka1, jednostka2])";
			typeName = "STRING";
			defaultValue = "";
		};
        class taskNotification {
			displayName = "Wyswietl powiadomienie";
			description = "";
			typeName = "BOOL";
		};
        class taskLabel {
			displayName = "Zakladka zadania";
			description = "Tekst wyswietlajacy sie na mapie po najechaniu na punkt zadania (dziala tylko jesli podamy pozycje/marker)";
			typeName = "STRING";
			defaultValue = "";
		};
        class taskPosition {
			displayName = "Pozycja zadania";
			description = "Nazwa markera (np. ""marker"") lub pozycja ([x,y,z]) zadania na mapie";
			typeName = "STRING";
			defaultValue = "";
		};
        class taskParent {
			displayName = "ID zadania nadrzednego";
			description = "Jesli zadanie nadrzedne zostanie wykonane lub anulowane to zadanie zostanie dodane";
			typeName = "STRING";
			defaultValue = "";
		};
    };
	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
