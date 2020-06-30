class GVAR(genSoldiers): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = "Generator piechoty";
    icon = QPATHTOF(modules\genSoldiers\data\icon.paa);
    editorPreview = "\A3\EditorPreviews_F_Exp\Data\CfgVehicles\C_Man_casual_3_F.jpg";
    category = QGVAR(AI);
    function = QFUNC(genSoldiers_module);
    GVAR(validator) = QFUNC(genSoldiers_validate);
    canSetArea = 1;
    canSetAreaShape = 1;
    class AttributeValues {
        size3[] = {25, 25, -1};
        isRectangle = 0;
    };

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(source) {
            displayName = "Source";
            GVAR(description) = "Lorem ipsum dolor sit amet, consectetur adipiscing elit";
            control = QGVAR(genSoldiers_source);
            property = QGVAR(source);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(observeValue) = 1;
        };

        class GVAR(classListMode) {
            displayName = "Classlist mode";
            GVAR(description) = "Lorem ipsum dolor sit amet, consectetur adipiscing elit";
            control = QGVAR(genSoldiers_classListMode);
            property = QGVAR(classListMode);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(observeValue) = 1;
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(source)) isEqualTo 0);
        };

        class GVAR(unitCount): GVAR(dynamicEdit) {
            displayName = "unitCount";
            property = QGVAR(unitCount);
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
            GVAR(conditionActive) = QUOTE(((_this getVariable QQGVAR(source)) isEqualTo 0) && ((_this getVariable QQGVAR(classListMode)) isEqualTo 0));
        };

        class GVAR(composition): GVAR(dynamicCombo) {
            displayName = "Composition";
            property = QGVAR(composition);
            typeName = "STRING";
            defaultValue = "''";
            GVAR(observeValue) = 1;
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(source)) isEqualTo 1);
            GVAR(insertValues) = QFUNC(genSoldiers_composition_insertValues);
        };

        class GVAR(side): GVAR(dynamicToolboxSide) {
            displayName = "side";
            property = QGVAR(side);
            defaultValue = "0";
            typeName = "NUMBER";
        };

        class GVAR(classList) {
            displayName = "class List";
            control = QGVAR(dynamicClassSelect);
            property = QGVAR(classList);
            typeName = "STRING";
            defaultValue = '[]';
            GVAR(assetsTypes[]) = {"CAManBase"};
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(source)) isEqualTo 0);
            GVAR(onValuesChanged) = QFUNC(dynamicClassSelect_updateUI);
        };

        class GVAR(groupCount): GVAR(dynamicEdit) {
            displayName = "groupCount";
            property = QGVAR(groupCount);
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };

        // TODO: init

        class GVAR(skill): GVAR(dynamicSkillSlider) {
            displayName = ECSTRING(ai,skill_displayName);
            property = QGVAR(skill);
            defaultValue = "0.5";
        };

        class GVAR(unitPos): GVAR(dynamicToolboxUnitPos) {
            displayName = "Unit pos";
            property = QGVAR(unitPos);
            defaultValue = "0";
            typeName = "NUMBER";
        };

        // TODO: behaviour

        class GVAR(forceGunLights): GVAR(dynamicCheckbox) {
            displayName = "forceGunLights";
            property = QGVAR(forceGunLights);
        };

        class GVAR(disableDynamicSim): GVAR(dynamicCheckbox) {
            displayName = "disableDynamicSim";
            property = QGVAR(disableDynamicSim);
        };

        class GVAR(disableHeadless): GVAR(dynamicCheckbox) {
            displayName = "disableHeadless";
            property = QGVAR(disableHeadless);
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = "This is test dynamic module. This is simple description.";
        description = "Full detailed module description...";
        positionInfo = "Pozycja modulu wskazuje obszar w ktorym zrespia sie jednostki";
        schema = QPATHTOF(modules\dynamicModule\data\schema.jpg);
    };
};
