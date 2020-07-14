class GVAR(fireArtillery): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(fireArtillery_displayName);
    icon = "\a3\Modules_F_Curator\Data\portraitOrdnance_ca.paa";
    category = QGVAR(effects);
    function = QFUNC(fireArtillery_module);
    canSetArea = 1;
    canSetAreaShape = 1;
    class AttributeValues {
        size3[] = {50, 50, -1};
        isRectangle = 0;
    };

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(propertiesSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = "Wlasciwosci ostrzalu";
            property = QGVAR(propertiesSettingsSubCategory);
        };
        class GVAR(ammoCat): GVAR(dynamicCombo) {
            displayName = "Kategoria pociskow";
            tooltip = "";
            property = QGVAR(ammoCat);
            typeName = "NUMBER";
            defaultValue = "0";
            class values {
                class artillery {
                    name = "Artyleria";
                    tooltip = "Pociski artyleryjskie i mozdziezowe";
                    value = 0;
                    default = 1;
                };
                class grenades {
                    name = "Granatnik";
                    tooltip = "Granaty wystrzelone z granatnika";
                    value = 1;
                };
                class rockets {
                    name = "Rakiety niekierowane";
                    tooltip = "Proste rakiety niekierowane";
                    value = 2;
                };
                class missiles {
                    name = "Rakiety kierowane";
                    tooltip = "Rakiety kierowane";
                    value = 3;
                };
                class cruiseMissiles {
                    name = "Pociski manewrujace (cruise)";
                    tooltip = "Okretowe pociski manewrujace (cruise missile)";
                    value = 4;
                };
                class bombs {
                    name = "Bomby";
                    tooltip = "Bomby kierowane (JDAM)";
                    value = 5;
                };
            };
        };

        class GVAR(ammo_0): GVAR(dynamicCombo) {
            displayName = "Pociski";
            tooltip = "Typ pociskow artyleryjskich uzywanych w ostrzale";
            property = QGVAR(ammo_0);
            typeName = "STRING";
            defaultValue = "'Sh_82mm_AMOS'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 0);
            class values {
                class G_20mm_HE {
                    name = "Sh_82mm_AMOS";
                    tooltip = "";
                    value = "Sh_82mm_AMOS";
                    default = 1;
                };
                class Sh_155mm_AMOS {
                    name = "Sh_155mm_AMOS";
                    tooltip = "";
                    value = "Sh_155mm_AMOS";
                };
                class Smoke_120mm_AMOS_White {
                    name = "Smoke_120mm_AMOS_White";
                    tooltip = "";
                    value = "Smoke_120mm_AMOS_White";
                };
                class Smoke_82mm_AMOS_White {
                    name = "Smoke_82mm_AMOS_White";
                    tooltip = "";
                    value = "Smoke_82mm_AMOS_White";
                };
                // flary
            };
        };

        class GVAR(ammo_1): GVAR(dynamicCombo) {
            displayName = "Granaty";
            tooltip = "Typ granatów uzywanych w ostrzale";
            property = QGVAR(ammo_1);
            typeName = "STRING";
            defaultValue = "'G_20mm_HE'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 1);
            class values {
                class G_20mm_HE {
                    name = "G_20mm_HE";
                    tooltip = "";
                    value = "G_20mm_HE";
                    default = 1;
                };
                class G_40mm_HE {
                    name = "G_40mm_HE";
                    tooltip = "";
                    value = "G_40mm_HE";
                };
                class G_40mm_HEDP {
                    name = "G_40mm_HEDP";
                    tooltip = "";
                    value = "G_40mm_HEDP";
                };
                class G_40mm_Smoke {
                    name = "G_40mm_Smoke";
                    tooltip = "";
                    value = "G_40mm_Smoke";
                };
                class G_40mm_SmokeBlue {
                    name = "G_40mm_SmokeBlue";
                    tooltip = "";
                    value = "G_40mm_SmokeBlue";
                };
                class G_40mm_SmokeGreen {
                    name = "G_40mm_SmokeGreen";
                    tooltip = "";
                    value = "G_40mm_SmokeGreen";
                };
                class G_40mm_SmokeOrange {
                    name = "G_40mm_SmokeOrange";
                    tooltip = "";
                    value = "G_40mm_SmokeOrange";
                };
                class G_40mm_SmokeRed {
                    name = "G_40mm_SmokeRed";
                    tooltip = "";
                    value = "G_40mm_SmokeRed";
                };
                class G_40mm_SmokeYellow {
                    name = "G_40mm_SmokeYellow";
                    tooltip = "";
                    value = "G_40mm_SmokeYellow";
                };
            };
        };

        class GVAR(ammo_2): GVAR(dynamicCombo) {
            displayName = "Rakiety";
            tooltip = "Typ rakiet uzywanych w ostrzale";
            property = QGVAR(ammo_2);
            typeName = "STRING";
            defaultValue = "'R_60mm_HE'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 2);
            class values {
                class R_60mm_HE {
                    name = "R_60mm_HE";
                    tooltip = "";
                    value = "R_60mm_HE";
                    default = 1;
                };
                class R_80mm_HE {
                    name = "R_80mm_HE";
                    tooltip = "";
                    value = "R_80mm_HE";
                };
                class R_230mm_HE {
                    name = "R_230mm_HE";
                    tooltip = "";
                    value = "R_230mm_HE";
                };
                class R_230mm_Cluster {
                    name = "R_230mm_Cluster";
                    tooltip = "";
                    value = "R_230mm_Cluster";
                };
            };
        };

        class GVAR(ammo_3): GVAR(dynamicCombo) {
            displayName = "Pociski";
            tooltip = "Typ pociskow kierowanych w ostrzale";
            property = QGVAR(ammo_3);
            typeName = "STRING";
            defaultValue = "'M_Jian_AT'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 3);
            class values {
                class M_Jian_AT {
                    name = "M_Jian_AT";
                    tooltip = "";
                    value = "M_Jian_AT";
                    default = 1;
                };
                class M_Scalpel_AT {
                    name = "M_Scalpel_AT";
                    tooltip = "";
                    value = "M_Scalpel_AT";
                };
            };
        };

        class GVAR(ammo_4): GVAR(dynamicCombo) {
            displayName = "Pociski";
            tooltip = "Typ pociskow manewrujacych ktory ma zostac uzyty w ostrzale";
            property = QGVAR(ammo_4);
            typeName = "STRING";
            defaultValue = "'ammo_Missile_Cruise_01'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 4);
            class values {
                class magazine_Missiles_Cruise_01_x18 {
                    name = "magazine_Missiles_Cruise_01_x18";
                    tooltip = "";
                    value = "magazine_Missiles_Cruise_01_x18";
                    default = 1;
                };
                class magazine_Missiles_Cruise_01_Cluster_x18 {
                    name = "magazine_Missiles_Cruise_01_Cluster_x18";
                    tooltip = "";
                    value = "magazine_Missiles_Cruise_01_Cluster_x18";
                };
            };
        };

        class GVAR(ammo_5): GVAR(dynamicCombo) {
            displayName = "Bomby";
            tooltip = "Typ bomb ktory ma zostac uzyty w ostrzale";
            property = QGVAR(ammo_5);
            typeName = "STRING";
            defaultValue = "'ammo_Missile_Cruise_01'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 5);
            class values {
                class magazine_Missiles_Cruise_01_x18 {
                    name = "magazine_Missiles_Cruise_01_x18";
                    tooltip = "";
                    value = "magazine_Missiles_Cruise_01_x18";
                    default = 1;
                };
                class magazine_Missiles_Cruise_01_Cluster_x18 {
                    name = "magazine_Missiles_Cruise_01_Cluster_x18";
                    tooltip = "";
                    value = "magazine_Missiles_Cruise_01_Cluster_x18";
                };
            };
        };


        class GVAR(targetPosMode): Default {
            displayName = "Tryb generowania pozycji";
            tooltip = "Sposob w jakim beda generowane pozycje w ktore maja uderzac pociski.";
            control = QGVAR(fireArtillery_targetPosMode);
            property = QGVAR(targetPosMode);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(observeValue) = 1;
        };
        class GVAR(hitAngle): GVAR(dynamicSlider) {
            displayName = "Kat uderzenia rakiety";
            tooltip = "Kat pod jakim rakieta ma uderzyc w wyznaczona pozycje";
            property = QGVAR(hitAngle);
            defaultValue = "90";
            typeName = "NUMBER";
            GVAR(range[]) = {20, 90};
            GVAR(valueUnit) = "°";
        };
        class GVAR(hitDir): GVAR(dynamicSlider) {
            displayName = "Kierunek";
            tooltip = "Kierunek z ktorego maja uderzac pociski";
            property = QGVAR(hitDir);
            defaultValue = "0";
            typeName = "NUMBER";
            GVAR(range[]) = {0, 359};
            GVAR(valueUnit) = "";
        };
        // distance
        // generate craters?
        class GVAR(salvos): GVAR(dynamicCheckbox) {
            displayName = "Strzelaj salwami";
            tooltip = "salwy";
            property = QGVAR(salvos);
            defaultValue = "false";
        };
        class GVAR(salvoShellsCount): GVAR(dynamicEdit) {
            displayName = "Ilosc pociskow w salwie";
            tooltip = "Ilosc pociskow ktora ma zostac wystrzelona w kazdej salwie";
            property = QGVAR(salvoShellsCount);
            defaultValue = "'1'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(salvos)) isEqualTo true);
        };
        class GVAR(salvosMinDelay): GVAR(dynamicEdit) {
            displayName = "Min. odstep miedzy salwami";
            tooltip = "Minimalny odstep czasowy miedzy salwami liczony w sekundach";
            property = QGVAR(salvosMinDelay);
            defaultValue = "'2'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(salvos)) isEqualTo true);
        };
        class GVAR(salvosMidDelay): GVAR(dynamicEdit) {
            displayName = "Sr. odstep miedzy salwami";
            tooltip = "Sredni odstep czasowy miedzy salwami liczony w sekundach";
            property = QGVAR(salvosMidDelay);
            defaultValue = "'4'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(salvos)) isEqualTo true);
        };
        class GVAR(salvosMaxDelay): GVAR(dynamicEdit) {
            displayName = "Maks. odstep miedzy salwami";
            tooltip = "Maksymalny odstep czasowy miedzy salwami liczony w sekundach";
            property = QGVAR(salvosMaxDelay);
            defaultValue = "'6'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(salvos)) isEqualTo true);
        };
        class GVAR(shellsMinDelay): GVAR(dynamicEdit) {
            displayName = "Min. odstep miedzy pociskami";
            tooltip = "Minimalny odstep czasowy miedzy pociskami liczony w sekundach";
            property = QGVAR(shellsMinDelay);
            defaultValue = "'2'";
            validate = "NUMBER";
        };
        class GVAR(shellsMidDelay): GVAR(dynamicEdit) {
            displayName = "Sr. odstep miedzy pociskami";
            tooltip = "Sredni odstep czasowy miedzy pociskami liczony w sekundach";
            property = QGVAR(shellsMidDelay);
            defaultValue = "'4'";
            validate = "NUMBER";
        };
        class GVAR(shellsMaxDelay): GVAR(dynamicEdit) {
            displayName = "Maks. odstep miedzy pociskami";
            tooltip = "Maksymalny odstep czasowy miedzy pociskami liczony w sekundach";
            property = QGVAR(shellsMaxDelay);
            defaultValue = "'6'";
            validate = "NUMBER";
        };
        class GVAR(conditionSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = "Uwarunkowanie ostrzalu";
            property = QGVAR(conditionSettingsSubCategory);
        };
        class GVAR(conditionType): Default {
            displayName = "Typ warunku ostrzalu";
            tooltip = "Typ warunku pod jakim ostrzal ma byc prowadzony";
            control = QGVAR(fireArtillery_conditionType);
            property = QGVAR(conditionType);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(observeValue) = 1;
        };
        class GVAR(timer): GVAR(dynamicEdit) {
            displayName = "Czas trwania ostrzalu";
            tooltip = "Czas w sekundach po uplywie ktorego ostrzal zostanie zakoczony";
            property = QGVAR(timer);
            defaultValue = "'10'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(conditionType)) isEqualTo 0);
        };
        class GVAR(shellsCount): GVAR(dynamicEdit) {
            displayName = "Ilosc strzalow";
            tooltip = "Ilosc strzalow po ktorych ostrzal zostanie zakonczony";
            property = QGVAR(shellsCount);
            defaultValue = "'1'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE( ((_this getVariable QQGVAR(conditionType)) isEqualTo 1) && ((_this getVariable QQGVAR(salvos)) isEqualTo false));
        };
        class GVAR(salvosCount): GVAR(dynamicEdit) {
            displayName = "Ilosc salw";
            tooltip = "Ilosc salw po ktorych ostrzal zostanie zakonczony";
            property = QGVAR(salvosCount);
            defaultValue = "'1'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE( ((_this getVariable QQGVAR(conditionType)) isEqualTo 1) && ((_this getVariable QQGVAR(salvos)) isEqualTo true));
        };
        class GVAR(condition): GVAR(dynamicEditCodeMulti5) {
            displayName = "Warunek ostrzalu";
            tooltip = "Ostrzal bedzie prowadzony do momentu w ktorym waruek przestanie byc prawdziwy (zwroci nieprawde - false).";
            property = QGVAR(condition);
            defaultValue = "'true'";
            typeName = "STRING";
            validate = "condition";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(conditionType)) isEqualTo 2);
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(fireArtillery_shortDescription);
        description = CSTRING(fireArtillery_description);
        //schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
