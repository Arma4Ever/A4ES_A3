class GVAR(fireArtillery): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(fireArtillery_displayName);
    icon = QPATHTOF(modules\fireArtillery\data\icon.paa);
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

        // Attributes for module activator
        #define MODULE_ACTIVATOR_CONTROL QGVAR(dynamicToolboxActivationModeMissionStart)
        #define MODULE_ACTIVATOR_DEFAULT_VALUE QUOTE(-1)
        #include "\z\a4es\addons\modules\includes\moduleActivationAttributes.hpp"

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(fireArtillery_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };
        class GVAR(ammoCat): GVAR(dynamicCombo) {
            displayName = CSTRING(fireArtillery_Attributes_ammoCat);
            tooltip = CSTRING(fireArtillery_Attributes_ammoCat_tooltip);
            property = QGVAR(ammoCat);
            typeName = "NUMBER";
            defaultValue = "0";
            ATTRIBUTE_LOCAL;
            class values {
                class artillery {
                    name = CSTRING(fireArtillery_Attributes_ammoCat_artillery);
                    tooltip = CSTRING(fireArtillery_Attributes_ammoCat_artillery_tooltip);
                    value = 0;
                    default = 1;
                };
                class grenades {
                    name = CSTRING(fireArtillery_Attributes_ammoCat_grenades);
                    tooltip = CSTRING(fireArtillery_Attributes_ammoCat_grenades_tooltip);
                    value = 1;
                };
                class rockets {
                    name = CSTRING(fireArtillery_Attributes_ammoCat_rockets);
                    tooltip = CSTRING(fireArtillery_Attributes_ammoCat_rockets_tooltip);
                    value = 2;
                };
                class missiles {
                    name = CSTRING(fireArtillery_Attributes_ammoCat_missiles);
                    tooltip = CSTRING(fireArtillery_Attributes_ammoCat_missiles_tooltip);
                    value = 3;
                };
                class gBombs {
                    name = CSTRING(fireArtillery_Attributes_ammoCat_gbombs);
                    tooltip = CSTRING(fireArtillery_Attributes_ammoCat_gbombs_tooltip);
                    value = 4;
                };
                class uBombs {
                    name = CSTRING(fireArtillery_Attributes_ammoCat_ubombs);
                    tooltip = CSTRING(fireArtillery_Attributes_ammoCat_ubombs_tooltip);
                    value = 5;
                };
                /*
                class gBombs {
                    name = CSTRING(fireArtillery_Attributes_ammoCat_bombs);
                    tooltip = CSTRING(fireArtillery_Attributes_ammoCat_bombs_tooltip);
                    value = 4;
                };
                class cruiseMissiles {
                    name = CSTRING(fireArtillery_Attributes_ammoCat_cruiseMissiles);
                    tooltip = CSTRING(fireArtillery_Attributes_ammoCat_cruiseMissiles_tooltip);
                    value = 5;
                };
                */
            };
        };

        class GVAR(ammoType_artillery): GVAR(dynamicCombo) {
            displayName = CSTRING(fireArtillery_Attributes_ammoType);
            tooltip = CSTRING(fireArtillery_Attributes_ammoType_tooltip);
            property = QGVAR(ammoType_artillery);
            typeName = "STRING";
            defaultValue = "'Sh_82mm_AMOS'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 0);
            ATTRIBUTE_LOCAL;
            class values {
                class Sh_82mm_AMOS {
                    name = "82mm HE";
                    tooltip = "Sh_82mm_AMOS";
                    value = "Sh_82mm_AMOS";
                    default = 1;
                };
                class Smoke_82mm_AMOS_White {
                    name = "82mm Smoke White";
                    tooltip = "Smoke_82mm_AMOS_White";
                    value = "Smoke_82mm_AMOS_White";
                };
                class Sh_155mm_AMOS {
                    name = "155mm HE";
                    tooltip = "Sh_155mm_AMOS";
                    value = "Sh_155mm_AMOS";
                };
                class Smoke_120mm_AMOS_White {
                    name = "120mm Smoke White";
                    tooltip = "Smoke_120mm_AMOS_White";
                    value = "Smoke_120mm_AMOS_White";
                };
            };
        };

        class GVAR(ammoType_grenades): GVAR(dynamicCombo) {
            displayName = CSTRING(fireArtillery_Attributes_ammoType);
            tooltip = CSTRING(fireArtillery_Attributes_ammoType_tooltip);
            property = QGVAR(ammoType_grenades);
            typeName = "STRING";
            defaultValue = "'G_20mm_HE'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 1);
            ATTRIBUTE_LOCAL;
            class values {
                class G_20mm_HE {
                    name = "20mm HE";
                    tooltip = "G_20mm_HE";
                    value = "G_20mm_HE";
                    default = 1;
                };
                class G_40mm_HE {
                    name = "40mm HE";
                    tooltip = "G_40mm_HE";
                    value = "G_40mm_HE";
                };
                class G_40mm_HEDP {
                    name = "40mm HEDP";
                    tooltip = "G_40mm_HEDP";
                    value = "G_40mm_HEDP";
                };
                class G_40mm_Smoke {
                    name = "40mm Smoke White";
                    tooltip = "G_40mm_Smoke";
                    value = "G_40mm_Smoke";
                };
                class G_40mm_SmokeBlue {
                    name = "40mm Smoke Blue";
                    tooltip = "G_40mm_SmokeBlue";
                    value = "G_40mm_SmokeBlue";
                };
                class G_40mm_SmokeGreen {
                    name = "40mm Smoke Green";
                    tooltip = "G_40mm_SmokeGreen";
                    value = "G_40mm_SmokeGreen";
                };
                class G_40mm_SmokeOrange {
                    name = "40mm Smoke Orange";
                    tooltip = "G_40mm_SmokeOrange";
                    value = "G_40mm_SmokeOrange";
                };
                class G_40mm_SmokeRed {
                    name = "40mm Smoke Red";
                    tooltip = "G_40mm_SmokeRed";
                    value = "G_40mm_SmokeRed";
                };
                class G_40mm_SmokeYellow {
                    name = "40mm Smoke Yellow";
                    tooltip = "G_40mm_SmokeYellow";
                    value = "G_40mm_SmokeYellow";
                };
                class F_40mm_White {
                    name = "40mm Flare White";
                    tooltip = "ACE_40mm_Flare_white";
                    value = "ACE_40mm_Flare_white";
                };
                class F_40mm_Green {
                    name = "40mm Flare Green";
                    tooltip = "ACE_40mm_Flare_green";
                    value = "ACE_40mm_Flare_green";
                };
                class F_40mm_Red {
                    name = "40mm Flare Red";
                    tooltip = "ACE_40mm_Flare_red";
                    value = "ACE_40mm_Flare_red";
                };
                class F_40mm_Cir {
                    name = "40mm Flare IR";
                    tooltip = "ACE_40mm_Flare_ir";
                    value = "ACE_40mm_Flare_ir";
                };
            };
        };

        class GVAR(ammoType_rockets): GVAR(dynamicCombo) {
            displayName = CSTRING(fireArtillery_Attributes_ammoType);
            tooltip = CSTRING(fireArtillery_Attributes_ammoType_tooltip);
            property = QGVAR(ammoType_rockets);
            typeName = "STRING";
            defaultValue = "'R_60mm_HE'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 2);
            ATTRIBUTE_LOCAL;
            class values {
                class R_60mm_HE {
                    name = "60mm HE";
                    tooltip = "R_60mm_HE";
                    value = "R_60mm_HE";
                    default = 1;
                };
                class R_80mm_HE {
                    name = "80mm HE";
                    tooltip = "R_80mm_HE";
                    value = "R_80mm_HE";
                };
                class R_230mm_HE {
                    name = "230mm HE";
                    tooltip = "R_230mm_HE";
                    value = "R_230mm_HE";
                };
                class R_230mm_Cluster {
                    name = "230mm Cluster";
                    tooltip = "R_230mm_Cluster";
                    value = "R_230mm_Cluster";
                };
            };
        };

        class GVAR(ammoType_missiles): GVAR(dynamicCombo) {
            displayName = CSTRING(fireArtillery_Attributes_ammoType);
            tooltip = CSTRING(fireArtillery_Attributes_ammoType_tooltip);
            property = QGVAR(ammoType_missiles);
            typeName = "STRING";
            defaultValue = "'M_Jian_AT'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 3);
            ATTRIBUTE_LOCAL;
            class values {
                class M_Jian_AT {
                    name = "Jian AT";
                    tooltip = "M_Jian_AT";
                    value = "M_Jian_AT";
                    default = 1;
                };
                class M_Scalpel_AT {
                    name = "Scalpel AT";
                    tooltip = "M_Scalpel_AT";
                    value = "M_Scalpel_AT";
                };
            };
        };

        class GVAR(ammoType_gBombs): GVAR(dynamicCombo) {
            displayName = CSTRING(fireArtillery_Attributes_ammoType);
            tooltip = CSTRING(fireArtillery_Attributes_ammoType_tooltip);
            property = QGVAR(ammoType_gBombs);
            typeName = "STRING";
            defaultValue = "'a4es_modules_manual_GBU12'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 4);
            ATTRIBUTE_LOCAL;
            class values {
                class GVAR(manual_GBU12) {
                    name = "GBU-12";
                    tooltip = QGVAR(manual_GBU12);
                    value = QGVAR(manual_GBU12);
                    default = 1;
                };
            };
        };

        class GVAR(ammoType_uBombs): GVAR(dynamicCombo) {
            displayName = CSTRING(fireArtillery_Attributes_ammoType);
            tooltip = CSTRING(fireArtillery_Attributes_ammoType_tooltip);
            property = QGVAR(ammoType_uBombs);
            typeName = "STRING";
            defaultValue = "'Bo_Mk82'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 5);
            ATTRIBUTE_LOCAL;
            class values {
                class Bo_Mk82 {
                    name = "Mk82";
                    tooltip = "Bo_Mk82";
                    value = "Bo_Mk82";
                    default = 1;
                };
            };
        };

        /*
        class GVAR(ammoType_cruiseMissiles): GVAR(dynamicCombo) {
            displayName = CSTRING(fireArtillery_Attributes_ammoType);
            tooltip = CSTRING(fireArtillery_Attributes_ammoType_tooltip);
            property = QGVAR(ammoType_cruiseMissiles);
            typeName = "STRING";
            defaultValue = "'ammo_Missile_Cruise_01'";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 5);
            ATTRIBUTE_LOCAL;
            class values {
                class magazine_Missiles_Cruise_01_x18 {
                    name = "HE";
                    tooltip = "magazine_Missiles_Cruise_01_x18";
                    value = "magazine_Missiles_Cruise_01_x18";
                    default = 1;
                };
                class magazine_Missiles_Cruise_01_Cluster_x18 {
                    name = "Cluster";
                    tooltip = "magazine_Missiles_Cruise_01_Cluster_x18";
                    value = "magazine_Missiles_Cruise_01_Cluster_x18";
                };
            };
        };
        */

        class GVAR(targetPosMode): Default {
            displayName = CSTRING(fireArtillery_Attributes_targetPosMode);
            tooltip = CSTRING(fireArtillery_Attributes_targetPosMode_tooltip);
            control = QGVAR(fireArtillery_targetPosMode);
            property = QGVAR(targetPosMode);
            GVAR(observeValue) = 1;
            typeName = "NUMBER";
            defaultValue = "0";
            ATTRIBUTE_LOCAL;
        };
        class GVAR(showDebug): GVAR(dynamicCheckbox) {
            displayName = CSTRING(fireArtillery_Attributes_showDebug);
            tooltip = CSTRING(fireArtillery_Attributes_showDebug_tooltip);
            GVAR(description) = CSTRING(fireArtillery_Attributes_showDebug_desc);
            property = QGVAR(showDebug);
            defaultValue = "false";
            ATTRIBUTE_LOCAL;
        };
        class GVAR(shellHeight): GVAR(dynamicSlider) {
            displayName = CSTRING(fireArtillery_Attributes_shellHeight);
            tooltip = CSTRING(fireArtillery_Attributes_shellHeight_tooltip);
            property = QGVAR(shellHeight);
            defaultValue = "1000";
            typeName = "NUMBER";
            GVAR(range[]) = {1, 3000};
            GVAR(valueUnit) = "m";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(shellDistance): GVAR(dynamicSlider) {
            displayName = CSTRING(fireArtillery_Attributes_shellDistance);
            tooltip = CSTRING(fireArtillery_Attributes_shellDistance_tooltip);
            property = QGVAR(shellDistance);
            defaultValue = "1000";
            typeName = "NUMBER";
            GVAR(range[]) = {1, 3000};
            GVAR(valueUnit) = "m";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) in [ARR_3(2,3,4)]);
            ATTRIBUTE_LOCAL;
        };
        class GVAR(hitDir): GVAR(dynamicSlider) {
            displayName = CSTRING(fireArtillery_Attributes_hitDir);
            tooltip = CSTRING(fireArtillery_Attributes_hitDir_tooltip);
            property = QGVAR(hitDir);
            defaultValue = "0";
            typeName = "NUMBER";
            GVAR(range[]) = {0, 359};
            GVAR(valueUnit) = "";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) in [ARR_3(2,3,4)]);
            ATTRIBUTE_LOCAL;
        };
        class GVAR(dropAngle): GVAR(dynamicSlider) {
            displayName = CSTRING(fireArtillery_Attributes_dropAngle);
            tooltip = CSTRING(fireArtillery_Attributes_dropAngle_tooltip);
            property = QGVAR(dropAngle);
            defaultValue = "45";
            typeName = "NUMBER";
            GVAR(description) = CSTRING(fireArtillery_Attributes_dropAngle_desc);
            GVAR(range[]) = {0, 90};
            GVAR(valueUnit) = "°";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(ammoCat)) isEqualTo 2);
            ATTRIBUTE_LOCAL;
        };
        class GVAR(salvos): GVAR(dynamicCheckbox) {
            displayName = CSTRING(fireArtillery_Attributes_salvos);
            tooltip = CSTRING(fireArtillery_Attributes_salvos_tooltip);
            property = QGVAR(salvos);
            defaultValue = "false";
            ATTRIBUTE_LOCAL;
        };
        class GVAR(salvoShellsCount): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_Attributes_salvoShellsCount);
            tooltip = CSTRING(fireArtillery_Attributes_salvoShellsCount_tooltip);
            property = QGVAR(salvoShellsCount);
            defaultValue = "'1'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(salvos)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };
        class GVAR(salvosMinDelay): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_Attributes_salvosMinDelay);
            tooltip = CSTRING(fireArtillery_Attributes_salvosMinDelay_tooltip);
            property = QGVAR(salvosMinDelay);
            defaultValue = "'2'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(salvos)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };
        class GVAR(salvosMidDelay): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_Attributes_salvosMidDelay);
            tooltip = CSTRING(fireArtillery_Attributes_salvosMidDelay_tooltip);
            property = QGVAR(salvosMidDelay);
            defaultValue = "'4'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(salvos)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };
        class GVAR(salvosMaxDelay): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_Attributes_salvosMaxDelay);
            tooltip = CSTRING(fireArtillery_Attributes_salvosMaxDelay_tooltip);
            property = QGVAR(salvosMaxDelay);
            defaultValue = "'6'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(salvos)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };
        class GVAR(shellsMinDelay): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_Attributes_shellsMinDelay);
            tooltip = CSTRING(fireArtillery_Attributes_shellsMinDelay_tooltip);
            property = QGVAR(shellsMinDelay);
            defaultValue = "'2'";
            validate = "NUMBER";
            ATTRIBUTE_LOCAL;
        };
        class GVAR(shellsMidDelay): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_Attributes_shellsMidDelay);
            tooltip = CSTRING(fireArtillery_Attributes_shellsMidDelay_tooltip);
            property = QGVAR(shellsMidDelay);
            defaultValue = "'4'";
            validate = "NUMBER";
            ATTRIBUTE_LOCAL;
        };
        class GVAR(shellsMaxDelay): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_Attributes_shellsMaxDelay);
            tooltip = CSTRING(fireArtillery_Attributes_shellsMaxDelay_tooltip);
            property = QGVAR(shellsMaxDelay);
            defaultValue = "'6'";
            validate = "NUMBER";
            ATTRIBUTE_LOCAL;
        };
        class GVAR(conditionSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(fireArtillery_Attributes_conditionSettingsSubCategory);
            property = QGVAR(conditionSettingsSubCategory);
        };
        class GVAR(conditionType): Default {
            displayName = CSTRING(fireArtillery_Attributes_conditionType);
            tooltip = CSTRING(fireArtillery_Attributes_conditionType_tooltip);
            control = QGVAR(fireArtillery_conditionType);
            property = QGVAR(conditionType);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(observeValue) = 1;
            ATTRIBUTE_LOCAL;
        };
        class GVAR(conditionSalvosCount): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_Attributes_conditionSalvosCount);
            tooltip = CSTRING(fireArtillery_Attributes_conditionSalvosCount_tooltip);
            property = QGVAR(conditionSalvosCount);
            defaultValue = "'1'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE(((_this getVariable QQGVAR(conditionType)) isEqualTo 0) && ((_this getVariable QQGVAR(salvos)) isEqualTo true));
            ATTRIBUTE_LOCAL;
        };
        class GVAR(conditionShellsCount): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_Attributes_conditionShellsCount);
            tooltip = CSTRING(fireArtillery_Attributes_conditionShellsCount_tooltip);
            property = QGVAR(conditionShellsCount);
            defaultValue = "'1'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE(((_this getVariable QQGVAR(conditionType)) isEqualTo 0) && ((_this getVariable QQGVAR(salvos)) isEqualTo false));
            ATTRIBUTE_LOCAL;
        };
        class GVAR(conditionTime): GVAR(dynamicEdit) {
            displayName = CSTRING(fireArtillery_Attributes_conditionTime);
            tooltip = CSTRING(fireArtillery_Attributes_conditionTime_tooltip);
            property = QGVAR(conditionTime);
            defaultValue = "'10'";
            validate = "NUMBER";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(conditionType)) isEqualTo 1);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(conditionLogicFlags): GVAR(dynamicLogicFlagCond) {
            displayName = CSTRING(fireArtillery_Attributes_conditionLogicFlags);
            tooltip = CSTRING(fireArtillery_Attributes_conditionLogicFlags_tooltip);
            property = QGVAR(conditionLogicFlags);
            defaultValue = QUOTE('[]');
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(conditionType)) isEqualTo 2);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(conditionScript): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(fireArtillery_Attributes_conditionScript);
            tooltip = CSTRING(fireArtillery_Attributes_conditionScript_tooltip);
            GVAR(description) = CSTRING(fireArtillery_Attributes_conditionScript_desc);
            property = QGVAR(conditionScript);
            defaultValue = "'true'";
            typeName = "STRING";
            validate = "condition";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(conditionType)) isEqualTo 3);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(fireArtillery_shortDescription);
    };
};
