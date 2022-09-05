class GVAR(locationName): GVAR(base) {
    scope = 2;
    author = "Krzyciu, SzwedzikPL";
    displayName = CSTRING(locationName_displayName);
    icon = "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\documents_ca.paa";
    category = QGVAR(ambient);
    function = QFUNC(locationName_module);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(locationName_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };

        class GVAR(locationText): GVAR(dynamicEdit) {
            displayName = CSTRING(locationName_Text);
            tooltip = CSTRING(locationName_Tooltip);
            property = QGVAR(locationName);
            typeName = "STRING";
            defaultValue = "''";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(locationType): GVAR(dynamicCombo) {
            displayName = CSTRING(locationName_Type);
            tooltip = CSTRING(locationName_Type_Tooltip);
            property = QGVAR(locationType);
            typeName = "STRING";
            defaultValue = "'Name'";
            ATTRIBUTE_LOCAL;
            class values {
                class BorderCrossing {
                    name = CSTRING(locationName_Type_BorderCrossing);
                    value = "BorderCrossing";
                };
                class CityCenter {
                    name = CSTRING(locationName_Type_CityCenter);
                    value = "CityCenter";
                };
                class Hill {
                    name = CSTRING(locationName_Type_Hill);
                    value = "Hill";
                };
                class FlatArea {
                    name = CSTRING(locationName_Type_FlatArea);
                    value = "FlatArea";
                };
                class Name {
                    name = CSTRING(locationName_Type_Name);
                    value = "Name";
                    default = 1;
                };
                class NameCity {
                    name = CSTRING(locationName_Type_NameCity);
                    value = "NameCity";
                };
                class NameLocal {
                    name = CSTRING(locationName_Type_NameLocal);
                    value = "NameLocal";
                };
                class NameMarine {
                    name = CSTRING(locationName_Type_NameMarine);
                    value = "NameMarine";
                };
                class NameCityCapital {
                    name = CSTRING(locationName_Type_NameCityCapital);
                    value = "NameCityCapital";
                };
                class NameVillage {
                    name = CSTRING(locationName_Type_NameVillage);
                    value = "NameVillage";
                };
                class ViewPoint {
                    name = CSTRING(locationName_Type_ViewPoint);
                    value = "ViewPoint";
                };
            };
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(locationName_shortDescription);
        positionInfo = CSTRING(locationName_positionInfo);
    };
};
