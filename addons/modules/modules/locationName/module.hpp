class GVAR(locationName): GVAR(base) {
    scope = 2;
    author = "Krzyciu, SzwedzikPL";
    displayName = CSTRING(locationName_displayName);
    icon = "\a3\ui_f\data\igui\cfg\simpletasks\types\move_ca.paa";
    category = QGVAR(map);
    function = QFUNC(locationName_module);
    functionPriority = 1;
    isGlobal = 1;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(locationName_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(mapName): GVAR(dynamicEdit) {
            displayName = CSTRING(locationName_Attributes_mapName);
            tooltip = CSTRING(locationName_Attributes_mapName_tooltip);
            property = QGVAR(mapName);
            defaultValue = "''";
            unique = 1;
	        GVAR(observeValue) = 1;
            GVAR(description) = CSTRING(locationName_Attributes_mapName_desc);
            GVAR(disabled) = 1;
            ATTRIBUTE_LOCAL;
        };

	    class GVAR(replaceName): GVAR(dynamicCheckbox) {
            displayName = CSTRING(locationName_Attributes_replaceName);
            tooltip = CSTRING(locationName_Attributes_replaceName_tooltip);
            property = QGVAR(replaceName);
	        defaultValue = "false";
        };

        class GVAR(customName): GVAR(dynamicEdit) {
            displayName = CSTRING(locationName_Attributes_customName);
            tooltip = CSTRING(locationName_Attributes_customName_tooltip);
            property = QGVAR(customName);
            defaultValue = "''";
            typeName = "STRING";
            unique = 1;
	        GVAR(observeValue) = 1;
	        GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(replaceName)) isEqualTo true);
            GVAR(description) = CSTRING(locationName_Attributes_customName_desc);
            ATTRIBUTE_LOCAL;
        };

	    class GVAR(locationType): GVAR(dynamicCombo) {
            displayName = CSTRING(locationName_Attributes_locationType);
            tooltip = CSTRING(locationName_Attributes_locationType_tooltip);
            property = QGVAR(locationType);
	        GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(replaceName)) isEqualTo true);
            defaultValue = "'Name'";
            typeName = "STRING";
            ATTRIBUTE_LOCAL;
            class values {
                class FlatArea {
                    name = CSTRING(locationName_locationType_FlatArea);
                    value = "FlatArea";
                };
                class Name {
                    name = CSTRING(locationName_locationType_Name);
                    value = "Name";
                };
                class NameCity {
                    name = CSTRING(locationName_locationType_NameCity);
                    value = "NameCity";
                };
                class NameCityCapital {
                    name = CSTRING(locationName_locationType_NameCityCapital);
                    value = "NameCityCapital";
                };
                class NameLocal {
                    name = CSTRING(locationName_locationType_NameLocal);
                    value = "NameLocal";
                };
                class NameMarine {
                    name = CSTRING(locationName_locationType_NameMarine);
                    value = "NameMarine";
                };
                class SafetyZone {
                    name = CSTRING(locationName_locationType_SafetyZone);
                    value = "SafetyZone";
                };
                class BorderCrossing {
                    name = CSTRING(locationName_locationType_BorderCrossing);
                    value = "BorderCrossing";
                }
                class Hill {
                    name = CSTRING(locationName_locationType_Hill);
                    value = "Hill";
                }
            };
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(locationName_shortDescription);
        description = CSTRING(locationName_description);
        positionInfo = CSTRING(locationName_positionInfo);
        is3DEN = 1;
    };
};