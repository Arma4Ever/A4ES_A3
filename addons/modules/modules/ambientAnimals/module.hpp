class GVAR(ambientAnimals): GVAR(base) {
    scope = 2;
    author = "Krzyciu";
    displayName = CSTRING(ambientAnimals_displayName);
    icon = QPATHTOF(modules\ambientAnimals\data\icon.paa);
    category = QGVAR(ambient);
    function = QFUNC(ambientAnimals_module);
    canSetArea = 1;
    canSetAreaShape = 1;
    class AttributeValues {
        size3[] = {25, 25, -1};
        isRectangle = 0;
    };

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(ambientAmimals_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };
        class GVAR(animalsType): GVAR(dynamicCombo) {
            displayName = CSTRING(ambientAmimals_animalsType);
            tooltip = CSTRING(ambientAmimals_animalsType_Tooltip);
            property = QGVAR(animalsType);
            typeName = "STRING";
            defaultValue = "'Rabbit_F'";
            class values {
                class Rabbit_F {
                    name = CSTRING(ambientAmimals_Rabbit);
                    tooltip = "";
                    value = "Rabbit_F";
                    default = 1;
                };
                class Hen_random_F {
                    name = CSTRING(ambientAmimals_Hen);
                    tooltip = "";
                    value = "Hen_random_F";
                };
                class Fin_random_F {
                    name = CSTRING(ambientAmimals_Dog);
                    tooltip = "";
                    value = "Fin_random_F";
                };
                class Goat_random_F {
                    name = CSTRING(ambientAmimals_Goat);
                    tooltip = "";
                    value = "Goat_random_F";
                };
                class Sheep_random_F {
                    name = CSTRING(ambientAmimals_Sheep);
                    tooltip = "";
                    value = "Sheep_random_F";
                };
            };
        };

        class GVAR(animalsCount): GVAR(dynamicSlider) {
            displayName = CSTRING(ambientAmimals_animalsCount);
            tooltip = CSTRING(ambientAmimals_animalsCount_Tooltip);
            property = QGVAR(animalsCount);
            defaultValue = "3";
            typeName = "NUMBER";
            GVAR(range[]) = {1, 20};
            GVAR(valueUnit) = "";
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(ambientAmimals_shortDescription);
        description = CSTRING(ambientAmimals_description);
        positionInfo = CSTRING(ambientAmimals_positionInfo);
        //schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
