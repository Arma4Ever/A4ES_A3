class GVAR(module_setTaskState): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Status zadania";
	category = "a3cs_modules_tasks";
	function = QUOTE(DFUNC(module_setTaskState));

    class Arguments {
        class taskID {
    		displayName = "ID zadania";
    		description = "";
    		typeName = "STRING";
    		defaultValue = "";
    	};
        class taskStatus {
    		displayName = "Status zadania";
    		description = "";
            typeName = "STRING";
    		class values
    		{
    			class created {name = "Utworzone"; value = "created"; default = 1;};
    			class assigned {name = "Przydzielone"; value = "assigned"; default = 0;};
    			class succeeded {name = "Wykonane"; value = "succeeded"; default = 0;};
    			class failed {name = "Niewykonane"; value = "failed"; default = 0;};
    			class canceled {name = "Anulowane"; value = "canceled"; default = 0;};
    		};
    	};
        class taskNotification {
    		displayName = "Wyswietl powiadomienie";
    		description = "";
    		typeName = "BOOL";
    		defaultValue = "";
    	};
    };
    class ModuleDescription: ModuleDescription
    {
		description = "";
    };
};
