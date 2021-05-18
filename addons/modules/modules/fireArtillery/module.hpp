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
            displayName = CSTRING(fireArtillery_Attributes);
            property = QGVAR(propertiesSettingsSubCategory);
        };
        class GVAR(ammoCat): GVAR(dynamicCombo) {
            displayName = CSTRING(fireArtillery_ammoCat);
            property = QGVAR(ammoCat);
            typeName = "NUMBER";
            defaultValue = "0";
            class values {
                class artillery {
                    name = CSTRING(fireArtillery_ammoCat_Art);
                    tooltip = CSTRING(fireArtillery_ammoCat_Art_Tooltip);
                    value = 0;
                    default = 1;
                };
                class grenades {
                    name = CSTRING(fireArtillery_ammoCat_Granatnik);
                    tooltip = CSTRING(fireArtillery_ammoCat_Granatnik_Tooltip);
                    value = 1;
                };
                class rockets {
                    name = CSTRING(fireArtillery_ammoCat_Unguided);
                    tooltip = CSTRING(fireArtillery_ammoCat_Unguided_Tooltip);
                    value = 2;
                };
                class missiles {
                    name = CSTRING(fireArtillery_ammoCat_Guided);
                    tooltip = CSTRING(fireArtillery_ammoCat_Guided_Tooltip);
                    value = 3;
                };
                class cruiseMissiles {
                    name = CSTRING(fireArtillery_ammoCat_VLS);
                    tooltip = CSTRING(fireArtillery_ammoCat_VLS_Tooltip);
                    value = 4;
                };
                class bombs {
                    name = CSTRING(fireArtillery_ammoCat_JDAM);
                    tooltip = CSTRING(fireArtillery_ammoCat_JDAM_Tooltip);
                    value = 5;
                };
            };
        };

        class GVAR(ammo_0): GVAR(dynamicCombo) {
            displayName = CSTRING(fireArtillery_ammoType_Art);
            tooltip = CSTRING(fireArtillery_ammoType_Art_Tooltip);
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
            displayName = CSTRING(fireArtillery_ammoType_Art);
            tooltip = CSTRING(fireArtillery_ammoType_Art_Tooltip);
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
            displayName = CSTRING(fireArtillery_ammoType_Rockets);
            tooltip = CSTRING(fireArtillery_ammoType_Rockets_Tooltip);
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
            displayName = CSTRING(fireArtillery_ammoType_Gudied);
            tooltip = CSTRING(fireArtillery_ammoType_Guided_Tooltip);
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
            displayName = CSTRING(fireArtillery_ammoType_VLS);
            tooltip = CSTRING(fireArtillery_ammoType_VLS_Tooltip);
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
            displayName = CSTRING(fireArtillery_ammoType_Bombs);
            tooltip = CSTRING(fireArtillery_ammoType_Bombs_Tooltip);
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
            displayName = CSTRING(fireArtillery_targetPosMode);
            tooltip = CSTRING(fireArtillery_targetPosMode_Tooltip);
            control = QGVAR(fireArtillery_targetPosMode);
            property = QGVAR(targetPosMode);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(observeValue) = 1;
        };
        class GVAR(hitAngle): GVAR(dynamicSlider) {
            displayName = CSTRING(fireArtillery_hitAngle);
            tooltip = CSTRING(fireArtillery_hitAngle_Tooltip);
            property = QGVAR(hitAngle);
            defaultValue = "90";
            typeName = "NUMBER";
            GVAR(range[]) = {20, 90};
            GVAR(valueUnit) = "°";
        };
        class GVAR(hitDir): GVAR(dynamicSlider) {
            displayName = CSTRING(fireArtillery_hitDir);
            tooltip = CSTRING(fireArtillery_hitDir_Tooltip);
            property = QGVAR(hitDir);
            defaultValue = "0";
            typeName = "NUMBER";
            GVAR(range[]) = {0, 359};
            GVAR(valueUnit) = "";
        };
        // distance
        // generate craters?
        class GVAR(salvos): GVAR(dynamicCheckbox) {
            displayName = CSTRING(fireArtillery_salvos);
            tooltip = CSTRING(fireArtillery_salvos_Tooltip);
            property = QGVAR(salvos);
            defaultValue = "false";
        };
        class GVAR(salvoShellsCount): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_salvoShellsCount);
            tooltip = CSTRING(fireArtillery_salvoShellsCount_Tooltip);
            property = QGVAR(salvoShellsCount);
            defaultValue = "'1'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(salvos)) isEqualTo true);
        };
        class GVAR(salvosMinDelay): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_salvosMinDelay);
            tooltip = CSTRING(fireArtillery_salvosMinDelay_Tooltip);
            property = QGVAR(salvosMinDelay);
            defaultValue = "'2'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(salvos)) isEqualTo true);
        };
        class GVAR(salvosMidDelay): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_salvosMidDelay);
            tooltip = CSTRING(fireArtillery_salvosMidDelay_Tooltip);
            property = QGVAR(salvosMidDelay);
            defaultValue = "'4'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(salvos)) isEqualTo true);
        };
        class GVAR(salvosMaxDelay): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_salvosMaxDelay);
            tooltip = CSTRING(fireArtillery_salvosMaxDelay_Tooltip);
            property = QGVAR(salvosMaxDelay);
            defaultValue = "'6'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(salvos)) isEqualTo true);
        };
        class GVAR(shellsMinDelay): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_shellsMinDelay);
            tooltip = CSTRING(fireArtillery_shellsMinDelay_Tooltip);
            property = QGVAR(shellsMinDelay);
            defaultValue = "'2'";
            validate = "NUMBER";
        };
        class GVAR(shellsMidDelay): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_shellsMidDelay);
            tooltip = CSTRING(fireArtillery_shellsMidDelay_Tooltip);
            property = QGVAR(shellsMidDelay);
            defaultValue = "'4'";
            validate = "NUMBER";
        };
        class GVAR(shellsMaxDelay): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_shellsMaxDelay);
            tooltip = CSTRING(fireArtillery_shellsMaxDelay_Tooltip);
            property = QGVAR(shellsMaxDelay);
            defaultValue = "'6'";
            validate = "NUMBER";
        };
        class GVAR(conditionSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(fireArtillery_conditionSettingsSubCategory);
            property = QGVAR(conditionSettingsSubCategory);
        };
        class GVAR(conditionType): Default {
            displayName = CSTRING(fireArtillery_conditionType);
            tooltip = CSTRING(fireArtillery_conditionType_Tooltip);
            control = QGVAR(fireArtillery_conditionType);
            property = QGVAR(conditionType);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(observeValue) = 1;
        };
        class GVAR(timer): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_timer);
            tooltip = CSTRING(fireArtillery_timer_Tooltip);
            property = QGVAR(timer);
            defaultValue = "'10'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(conditionType)) isEqualTo 0);
        };
        class GVAR(shellsCount): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_shellsCount);
            tooltip = CSTRING(fireArtillery_shellsCount_Tooltip);
            property = QGVAR(shellsCount);
            defaultValue = "'1'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE( ((_this getVariable QQGVAR(conditionType)) isEqualTo 1) && ((_this getVariable QQGVAR(salvos)) isEqualTo false));
        };
        class GVAR(salvosCount): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_salvosCount);
            tooltip = CSTRING(fireArtillery_salvosCount_Tooltip);
            property = QGVAR(salvosCount);
            defaultValue = "'1'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE( ((_this getVariable QQGVAR(conditionType)) isEqualTo 1) && ((_this getVariable QQGVAR(salvos)) isEqualTo true));
        };
        class GVAR(condition): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(fireArtillery_condition);
            tooltip = CSTRING(fireArtillery_condition_Tooltip);
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
        description = "";
        //schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
