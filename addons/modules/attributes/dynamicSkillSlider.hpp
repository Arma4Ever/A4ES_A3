class GVAR(dynamicSkillSlider): Skill {
    //onLoad = QUOTE(_this call FUNC(skill_onLoad););
    //attributeLoad = "";
    class Controls: Controls {
        class Title: Title {
            DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES(right);
        };
        class Value: Value {};
        class Edit: Edit {};
        class GVAR(description): GVAR(description) {};
    };
};
