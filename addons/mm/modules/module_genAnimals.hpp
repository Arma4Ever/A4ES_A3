class GVAR(module_genAnimals): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_GenAnimals_DisplayName);
    category = "a3cs_modules_ai";
    function = QUOTE(DFUNC(module_genAnimals));
    portrait = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";
    canSetArea = 1;
    class AttributeValues {
        size3[] = {10,10,-1};
    };

    class Attributes: AttributesBase {
        class type: Combo {
            displayName = CSTRING(Module_GenAnimals_Type_DisplayName);
            tooltip = CSTRING(Module_GenAnimals_Type_Description);
            property = QGVAR(module_genAnimals_type);
            defaultValue = "'Sheep_random_F'";
            class values {
                class sheep {name = CSTRING(Module_GenAnimals_Type_Sheep_DisplayName); value = "Sheep_random_F"; default = 1;};
                class goats {name = CSTRING(Module_GenAnimals_Type_Goats_DisplayName); value = "Goat_random_F"; default = 0;};
                class hens {name = CSTRING(Module_GenAnimals_Type_Hens_DisplayName); value = "Hen_random_F"; default = 0;};
                class dogs {name = CSTRING(Module_GenAnimals_Type_Dogs_DisplayName); value = "Fin_random_F"; default = 0;};
                class rabbit {name = CSTRING(Module_GenAnimals_Type_Rabbit_DisplayName); value = "Rabbit_F"; default = 0;};
            };
        };
        class count: Edit {
            displayName = CSTRING(Module_GenAnimals_Count_DisplayName);
            tooltip = CSTRING(Module_GenAnimals_Count_Description);
            property = QGVAR(module_genAnimals_count);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class cacheModule: CheckboxNumber {
            displayName = CSTRING(Module_GenSoldiers_CacheModule_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_CacheModule_Description);
            property = QGVAR(module_genAnimals_cacheModule);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class script: EditMulti3 {
            displayName = CSTRING(Module_GenAnimals_Script_DisplayName);
            tooltip = CSTRING(Module_GenAnimals_Script_Description);
            property = QGVAR(module_genAnimals_script);
            defaultValue = "''";
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        position = 1;
        description = CSTRING(Module_GenAnimals_Description);
    };
};
