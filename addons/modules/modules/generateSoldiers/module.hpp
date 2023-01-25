class GVAR(generateSoldiers): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(generateSoldiers_displayName);
    icon = QPATHTOF(modules\generateSoldiers\data\icon.paa);
    category = QGVAR(AI);
    function = QFUNC(generateSoldiers_module);
    GVAR(validator) = QFUNC(generateSoldiers_validate);
    canSetArea = 1;
    canSetAreaShape = 1;
    class AttributeValues {
        size3[] = {25, 25, -1};
        isRectangle = 0;
    };

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
        #include "\z\a4es\addons\modules\includes\moduleActivationAttributes.hpp"

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(generateSoldiers_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };
        class GVAR(source): Default {
            displayName = CSTRING(generateSoldiers_Attributes_source);
            tooltip = CSTRING(generateSoldiers_Attributes_source_Tooltip);
            control = QGVAR(generateSoldiers_source);
            property = QGVAR(source);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(observeValue) = 1;
        };
        class GVAR(classListMode): Default {
            displayName = CSTRING(generateSoldiers_Attributes_classListMode);
            tooltip = CSTRING(generateSoldiers_Attributes_classListMode_Tooltip);
            control = QGVAR(generateSoldiers_classListMode);
            property = QGVAR(classListMode);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(observeValue) = 1;
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(source)) isEqualTo 0);
        };
        class GVAR(composition): GVAR(dynamicCombo) {
            displayName = CSTRING(generateSoldiers_Attributes_composition);
            tooltip = CSTRING(generateSoldiers_Attributes_composition_Tooltip);
            property = QGVAR(composition);
            typeName = "STRING";
            defaultValue = "''";
            GVAR(observeValue) = 1;
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(source)) isEqualTo 1);
            GVAR(insertValues) = QFUNC(generateSoldiers_composition_insertValues);
        };
        class GVAR(groupCount): GVAR(dynamicSlider) {
            displayName = CSTRING(generateSoldiers_Attributes_groupCount);
            tooltip = CSTRING(generateSoldiers_Attributes_groupCount_Tooltip);
            property = QGVAR(groupCount);
            defaultValue = "1";
            typeName = "NUMBER";
            GVAR(range[]) = {1, 12};
            GVAR(valueUnit) = "";
        };
        class GVAR(unitCount): GVAR(dynamicSlider) {
            displayName = CSTRING(generateSoldiers_Attributes_unitCount);
            tooltip = CSTRING(generateSoldiers_Attributes_unitCount_Tooltip);
            property = QGVAR(unitCount);
            defaultValue = "1";
            typeName = "NUMBER";
            GVAR(range[]) = {1, 24};
            GVAR(valueUnit) = "";
            GVAR(conditionActive) = QUOTE(((_this getVariable QQGVAR(source)) isEqualTo 0) && ((_this getVariable QQGVAR(classListMode)) isEqualTo 0));
        };
        class GVAR(spawnPosMode): Default {
            displayName = CSTRING(generateSoldiers_Attributes_spawnPosMode);
            tooltip = CSTRING(generateSoldiers_Attributes_spawnPosMode_Tooltip);
            control = QGVAR(generateSoldiers_spawnPosMode);
            property = QGVAR(spawnPosMode);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(observeValue) = 1;
        };
        class GVAR(side): GVAR(dynamicToolboxSide) {
            displayName = CSTRING(generateSoldiers_Attributes_side);
            tooltip = CSTRING(generateSoldiers_Attributes_side_Tooltip);
            property = QGVAR(side);
            defaultValue = "1";
            typeName = "NUMBER";
        };
        class GVAR(skill): GVAR(dynamicSkillSlider) {
            displayName = ECSTRING(ai,skill_displayName);
            tooltip = CSTRING(generateSoldiers_Attributes_skill_Tooltip);
            property = QGVAR(skill);
            defaultValue = "0.5";
        };
        class GVAR(classList): Default {
            displayName = CSTRING(generateSoldiers_Attributes_classList);
            tooltip = CSTRING(generateSoldiers_Attributes_classList_Tooltip);
            control = QGVAR(dynamicClassSelect);
            property = QGVAR(classList);
            typeName = "STRING";
            defaultValue = '[]';
            GVAR(observeValue) = 1;
            GVAR(assetsTypes[]) = {"CAManBase"};
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(source)) isEqualTo 0);
            GVAR(onValuesChanged) = QFUNC(dynamicClassSelect_updateUI);
        };
        class GVAR(behaviourSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(generateSoldiers_Attributes_behaviourSettingsSubCategory);
            property = QGVAR(behaviourSettingsSubCategory);
        };
        class GVAR(behaviour): GVAR(dynamicCombo) {
            displayName = CSTRING(generateSoldiers_Attributes_behaviour);
            tooltip = CSTRING(generateSoldiers_Attributes_behaviour_Tooltip);
            property = QGVAR(behaviour);
            typeName = "NUMBER";
            defaultValue = "0";
            class values {
                class patrol {
                    name = CSTRING(generateSoldiers_Attributes_behaviour_patrol);
                    tooltip = CSTRING(generateSoldiers_Attributes_behaviour_patrol_Tooltip);
                    value = 0;
                    default = 1;
                };
                class camp {
                    name = CSTRING(generateSoldiers_Attributes_behaviour_camp);
                    tooltip = CSTRING(generateSoldiers_Attributes_behaviour_camp_Tooltip);
                    value = 1;
                };
                class garrison {
                    name = CSTRING(generateSoldiers_Attributes_behaviour_garrison);
                    tooltip = CSTRING(generateSoldiers_Attributes_behaviour_garrison_Tooltip);
                    value = 2;
                };
                class hunt {
                    name = CSTRING(generateSoldiers_Attributes_behaviour_hunt);
                    tooltip = CSTRING(generateSoldiers_Attributes_behaviour_hunt_Tooltip);
                    value = 3;
                };
                class creep {
                    name = CSTRING(generateSoldiers_Attributes_behaviour_creep);
                    tooltip = CSTRING(generateSoldiers_Attributes_behaviour_creep_Tooltip);
                    value = 4;
                };
                class rush {
                    name = CSTRING(generateSoldiers_Attributes_behaviour_rush);
                    tooltip = CSTRING(generateSoldiers_Attributes_behaviour_rush_Tooltip);
                    value = 5;
                };
                class move {
                    name = CSTRING(generateSoldiers_Attributes_behaviour_move);
                    tooltip = CSTRING(generateSoldiers_Attributes_behaviour_move_Tooltip);
                    value = 6;
                };
                class assault {
                    name = CSTRING(generateSoldiers_Attributes_behaviour_assault);
                    tooltip = CSTRING(generateSoldiers_Attributes_behaviour_assault_Tooltip);
                    value = 7;
                };
            };
        };
        class GVAR(patrolRange): GVAR(dynamicSlider) {
            displayName = CSTRING(generateSoldiers_Attributes_range);
            tooltip = CSTRING(generateSoldiers_Attributes_patrolRange_tooltip);
            property = QGVAR(patrolRange);
            defaultValue = "200";
            GVAR(range[]) = {100, 800};
            GVAR(valueUnit) = "m";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 0);
        };
        class GVAR(campRange): GVAR(dynamicSlider) {
            displayName = CSTRING(generateSoldiers_Attributes_range);
            tooltip = CSTRING(generateSoldiers_Attributes_campRange_tooltip);
            property = QGVAR(campRange);
            defaultValue = "50";
            GVAR(range[]) = {20, 250};
            GVAR(valueUnit) = "m";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 1);
        };
        class GVAR(garrisonRange): GVAR(dynamicSlider) {
            displayName = CSTRING(generateSoldiers_Attributes_range);
            tooltip = CSTRING(generateSoldiers_Attributes_garrisonRange_tooltip);
            property = QGVAR(garrisonRange);
            defaultValue = "50";
            GVAR(range[]) = {20, 250};
            GVAR(valueUnit) = "m";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 2);
        };
        class GVAR(hcrRange): GVAR(dynamicSlider) {
            displayName = CSTRING(generateSoldiers_Attributes_range);
            tooltip = CSTRING(generateSoldiers_Attributes_hcrRange_tooltip);
            property = QGVAR(hcrRange);
            defaultValue = "500";
            GVAR(range[]) = {200, 1500};
            GVAR(valueUnit) = "m";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) in [ARR_3(3,4,5)]);
        };
        class GVAR(behaviourAreaBoundary): GVAR(dynamicCombo) {
            displayName = CSTRING(generateSoldiers_Attributes_behaviourAreaBoundary);
            tooltip = CSTRING(generateSoldiers_Attributes_behaviourAreaBoundary_Tooltip);
            property = QGVAR(behaviourAreaBoundary);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) in [ARR_6(0,1,2,3,4,5)]);
            class values {
                class none {
                    name = CSTRING(generateSoldiers_Attributes_behaviourAreaBoundary_none);
                    tooltip = CSTRING(generateSoldiers_Attributes_behaviourAreaBoundary_none_Tooltip);
                    value = 0;
                    default = 1;
                };
                class module {
                    name = CSTRING(generateSoldiers_Attributes_behaviourAreaBoundary_module);
                    tooltip = CSTRING(generateSoldiers_Attributes_behaviourAreaBoundary_module_Tooltip);
                    value = 1;
                };
                class trigger {
                    name = CSTRING(generateSoldiers_Attributes_behaviourAreaBoundary_trigger);
                    tooltip = CSTRING(generateSoldiers_Attributes_behaviourAreaBoundary_trigger_Tooltip);
                    value = 2;
                };
            };
        };
        class GVAR(hcrLeaderAsCenter): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_hcrLeaderAsCenter);
            tooltip = CSTRING(generateSoldiers_Attributes_hcrLeaderAsCenter_tooltip);
            property = QGVAR(hcrLeaderAsCenter);
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) in [ARR_3(3,4,5)]);
        };
        class GVAR(hcrTargetOnlyPlayers): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_hcrTargetOnlyPlayers);
            tooltip = CSTRING(generateSoldiers_Attributes_hcrTargetOnlyPlayers_Tooltip);
            property = QGVAR(hcrTargetOnlyPlayers);
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) in [ARR_3(3,4,5)]);
        };
        class GVAR(patrolWaypointsCount): GVAR(dynamicSlider) {
            displayName = CSTRING(generateSoldiers_Attributes_patrolWaypointsCount);
            tooltip = CSTRING(generateSoldiers_Attributes_patrolWaypointsCount_Tooltip);
            property = QGVAR(patrolWaypointsCount);
            defaultValue = "4";
            GVAR(range[]) = {1, 8};
            GVAR(valueUnit) = "";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 0);
        };
        class GVAR(patrolDynamicPattern): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_patrolDynamicPattern);
            tooltip = CSTRING(generateSoldiers_Attributes_patrolDynamicPattern_Tooltip);
            property = QGVAR(patrolDynamicPattern);
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 0);
        };
        class GVAR(campTeleportUnits): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_campTeleportUnits);
            tooltip = CSTRING(generateSoldiers_Attributes_campTeleportUnits_Tooltip);
            property = QGVAR(campTeleportUnits);
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 1);
        };
        class GVAR(garrisonExitTrigger): GVAR(dynamicCombo) {
            displayName = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger);
            tooltip = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger_Tooltip);
            property = QGVAR(garrisonExitTrigger);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 2);
            class values {
                class none {
                    name = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger_none);
                    tooltip = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger_none_Tooltip);
                    value = 0;
                    default = 1;
                };
                class random {
                    name = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger_random);
                    tooltip = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger_random_Tooltip);
                    value = 1;
                };
                class firedNear {
                    name = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger_firedNear);
                    tooltip = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger_firedNear_Tooltip);
                    value = 2;
                };
                class firedDirect {
                    name = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger_firedDirect);
                    tooltip = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger_firedDirect_Tooltip);
                    value = 3;
                };
                class hit {
                    name = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger_hit);
                    tooltip = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger_hit_Tooltip);
                    value = 4;
                };
                class all {
                    name = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger_all);
                    tooltip = CSTRING(generateSoldiers_Attributes_garrisonExitTrigger_all_Tooltip);
                    value = 5;
                };
            };
        };
        class GVAR(garrisonSortPosByHeight): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_garrisonSortPosByHeight);
            tooltip = CSTRING(generateSoldiers_Attributes_garrisonSortPosByHeight_Tooltip);
            property = QGVAR(garrisonSortPosByHeight);
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 2);
        };
        class GVAR(garrisonTeleportUnits): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_garrisonTeleportUnits);
            tooltip = CSTRING(generateSoldiers_Attributes_garrisonTeleportUnits_Tooltip);
            property = QGVAR(garrisonTeleportUnits);
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 2);
        };
        class GVAR(huntScriptInterval): GVAR(dynamicSlider) {
            displayName = CSTRING(generateSoldiers_Attributes_hcrScriptInterval);
            tooltip = CSTRING(generateSoldiers_Attributes_hcrScriptInterval_Tooltip);
            property = QGVAR(huntScriptInterval);
            defaultValue = "70";
            GVAR(range[]) = {10, 120};
            GVAR(valueUnit) = "s";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 3);
        };
        class GVAR(creepScriptInterval): GVAR(dynamicSlider) {
            displayName = CSTRING(generateSoldiers_Attributes_hcrScriptInterval);
            tooltip = CSTRING(generateSoldiers_Attributes_hcrScriptInterval_Tooltip);
            property = QGVAR(creepScriptInterval);
            defaultValue = "10";
            GVAR(range[]) = {5, 30};
            GVAR(valueUnit) = "s";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 4);
        };
        class GVAR(rushScriptInterval): GVAR(dynamicSlider) {
            displayName = CSTRING(generateSoldiers_Attributes_hcrScriptInterval);
            tooltip = CSTRING(generateSoldiers_Attributes_hcrScriptInterval_Tooltip);
            property = QGVAR(rushScriptInterval);
            defaultValue = "15";
            GVAR(range[]) = {10, 120};
            GVAR(valueUnit) = "s";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 5);
        };
        class GVAR(maMovePosition): GVAR(dynamicEdit) {
            displayName = CSTRING(generateSoldiers_Attributes_maMovePosition);
            tooltip = CSTRING(generateSoldiers_Attributes_maMovePosition_Tooltip);
            property = QGVAR(maMovePosition);
            defaultValue = "''";
            validate = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) in [ARR_2(6,7)]);
        };
        class GVAR(maDistanceThreshold): GVAR(dynamicSlider) {
            displayName = CSTRING(generateSoldiers_Attributes_maDistanceThreshold);
            tooltip = CSTRING(generateSoldiers_Attributes_maDistanceThreshold_Tooltip);
            property = QGVAR(maDistanceThreshold);
            defaultValue = "50";
            GVAR(range[]) = {20, 200};
            GVAR(valueUnit) = "m";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) in [ARR_2(6,7)]);
        };
        class GVAR(assaultScriptInterval): GVAR(dynamicSlider) {
            displayName = CSTRING(generateSoldiers_Attributes_hcrScriptInterval);
            tooltip = CSTRING(generateSoldiers_Attributes_hcrScriptInterval_Tooltip);
            property = QGVAR(assaultScriptInterval);
            defaultValue = "10";
            GVAR(range[]) = {5, 30};
            GVAR(valueUnit) = "s";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 7);
        };
        class GVAR(assaultForcedRetreat): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_assaultForcedRetreat);
            tooltip = CSTRING(generateSoldiers_Attributes_assaultForcedRetreat_Tooltip);
            property = QGVAR(assaultForcedRetreat);
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(behaviour)) isEqualTo 7);
        };
        class GVAR(eventHandlersSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(generateSoldiers_Attributes_eventHandlersSubCategory);
            property = QGVAR(eventHandlersSubCategory);
        };
        class GVAR(addSpawnCond): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_addSpawnCond);
            tooltip = CSTRING(generateSoldiers_Attributes_addSpawnCond_Tooltip);
            property = QGVAR(addSpawnCond);
            ATTRIBUTE_LOCAL;
        };
        class GVAR(spawnCond): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(generateSoldiers_Attributes_spawnCond);
            tooltip = CSTRING(generateSoldiers_Attributes_spawnCond_tooltip);
            GVAR(description) = CSTRING(generateSoldiers_Attributes_spawnCond_desc);
            property = QGVAR(spawnCond);
            defaultValue = "'true'";
            typeName = "STRING";
            validate = "condition";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addSpawnCond)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };
        class GVAR(addUnitPostInit): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_addUnitPostInit);
            tooltip = CSTRING(generateSoldiers_Attributes_addUnitPostInit_Tooltip);
            property = QGVAR(addUnitPostInit);
        };
        class GVAR(unitPostInit): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(generateSoldiers_Attributes_unitPostInit);
            tooltip = CSTRING(generateSoldiers_Attributes_unitPostInit_Tooltip);
            property = QGVAR(unitPostInit);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addUnitPostInit)) isEqualTo true);
        };
        class GVAR(addGroupPostInit): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_addGroupPostInit);
            tooltip = CSTRING(generateSoldiers_Attributes_addGroupPostInit_Tooltip);
            property = QGVAR(addGroupPostInit);
        };
        class GVAR(groupPostInit): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(generateSoldiers_Attributes_groupPostInit);
            tooltip = CSTRING(generateSoldiers_Attributes_groupPostInit_Tooltip);
            property = QGVAR(groupPostInit);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addGroupPostInit)) isEqualTo true);
        };
        class GVAR(addModulePostExec): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_addModulePostExec);
            tooltip = CSTRING(generateSoldiers_Attributes_addModulePostExec_Tooltip);
            property = QGVAR(addModulePostExec);
        };
        class GVAR(modulePostExec): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(generateSoldiers_Attributes_modulePostExec);
            tooltip = CSTRING(generateSoldiers_Attributes_modulePostExec_Tooltip);
            property = QGVAR(modulePostExec);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addModulePostExec)) isEqualTo true);
        };
        class GVAR(extraSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(generateSoldiers_Attributes_extraSettingsSubCategory);
            property = QGVAR(extraSettingsSubCategory);
        };
        class GVAR(disableLambsAI): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_disableLambsAI);
            tooltip = CSTRING(generateSoldiers_Attributes_disableLambsAI_Tooltip);
            property = QGVAR(disableLambsAI);
            defaultValue = "false";
        };
        class GVAR(enableLambsReinforce): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_enableLambsReinforce);
            tooltip = CSTRING(generateSoldiers_Attributes_enableLambsReinforce_Tooltip);
            property = QGVAR(enableLambsReinforce);
            defaultValue = "true";
        };
        class GVAR(hasLambsRadio): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_hasLambsRadio);
            tooltip = CSTRING(generateSoldiers_Attributes_hasLambsRadio_Tooltip);
            property = QGVAR(hasLambsRadio);
            defaultValue = "true";
        };
        class GVAR(disableRandomization): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_disableRandomization);
            tooltip = CSTRING(generateSoldiers_Attributes_disableRandomization_Tooltip);
            property = QGVAR(disableRandomization);
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(source)) isEqualTo 0);
        };
        class GVAR(disableDynamicSim): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_disableDynamicSim);
            tooltip = CSTRING(generateSoldiers_Attributes_disableDynamicSim_Tooltip);
            property = QGVAR(disableDynamicSim);
        };
        class GVAR(disableHeadless): GVAR(dynamicCheckbox) {
            displayName = CSTRING(generateSoldiers_Attributes_disableHeadless);
            tooltip = CSTRING(generateSoldiers_Attributes_disableHeadless_Tooltip);
            property = QGVAR(disableHeadless);
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(generateSoldiers_shortDescription);
        description = "";
        positionInfo = CSTRING(generateSoldiers_positionInfo);
        //schema = QPATHTOF(data\schema_placeholder.paa);
    };
};
