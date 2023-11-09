class GVAR(setSkill): GVAR(base) {
    scope = 2;
    author = "Krzyciu";
    displayName = CSTRING(setSkill_displayName);
    icon = "\A3\ui_f\data\igui\cfg\simpletasks\types\Use_ca.paa";
    category = QGVAR(AI);
    function = QFUNC(setSkill_module);
    isTriggerActivated = 0;

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(unitSkill): GVAR(dynamicSkillSlider) {
            displayName = ECSTRING(ai,skill_displayName);
            tooltip = CSTRING(setSkill_Attributes_unitSkill_Tooltip);
            property = QGVAR(skill);
            defaultValue = "0.5";
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(setSkill_shortDescription);
        description = "";
    };
};