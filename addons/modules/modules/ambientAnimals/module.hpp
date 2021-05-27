class GVAR(ambientAnimals): GVAR(base) {
    scope = 2;
    author = "Krzyciu, SzwedzikPL";
    displayName = CSTRING(ambientAnimals_displayName);
    icon = QPATHTOF(modules\ambientAnimals\data\icon.paa);
    category = QGVAR(ambient);
    function = QFUNC(ambientAnimals_module);
    canSetArea = 1;
    canSetAreaShape = 1;
    class AttributeValues {
        size3[] = {20, 20, -1};
        isRectangle = 0;
    };

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
         #include "\z\a3cs\addons\modules\includes\moduleActivationAttributes.hpp"
         
        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(ambientAnimals_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };
        class GVAR(animalsType): GVAR(dynamicCombo) {
            displayName = CSTRING(ambientAnimals_animalsType);
            tooltip = CSTRING(ambientAnimals_animalsType_Tooltip);
            property = QGVAR(animalsType);
            typeName = "STRING";
            defaultValue = "'Rabbit_F'";
            class values {
                class Rabbit_F {
                    name = CSTRING(ambientAnimals_animalsType_Rabbit)
                    tooltip = "";
                    value = "Rabbit_F";
                    default = 1;
                };
                class Hen_random_F {
                    name = CSTRING(ambientAnimals_animalsType_Hen);
                    tooltip = "";
                    value = "Hen_random_F";
                };
                class Fin_random_F {
                    name = CSTRING(ambientAnimals_animalsType_Dog);
                    tooltip = "";
                    value = "Fin_random_F";
                };
                class Goat_random_F {
                    name = CSTRING(ambientAnimals_animalsType_Goat);
                    tooltip = "";
                    value = "Goat_random_F";
                };
                class Sheep_random_F {
                    name = CSTRING(ambientAnimals_animalsType_Sheep);
                    tooltip = "";
                    value = "Sheep_random_F";
                };
            };
        };

        class GVAR(animalsCount): GVAR(dynamicSlider) {
            displayName = CSTRING(ambientAnimals_animalsCount);
            tooltip = CSTRING(ambientAnimals_animalsCount_Tooltip);
            property = QGVAR(animalsCount);
            defaultValue = "3";
            typeName = "NUMBER";
            GVAR(range[]) = {1, 20};
            GVAR(valueUnit) = "";
        };

        class GVAR(addToCurators): GVAR(dynamicCheckbox) {
            displayName = CSTRING(ambientAnimals_Attributes_addToCurators);
            tooltip = CSTRING(ambientAnimals_Attributes_addToCurators_Tooltip);
            property = QGVAR(addToCurators);
            defaultValue = "false";
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(ambientAnimals_shortDescription);
        description = CSTRING(ambientAnimals_description);
        positionInfo = CSTRING(ambientAnimals_positionInfo);
        //schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
