
class GVAR(dynamicCombo): Combo {
    attributeLoad = QUOTE(_this call FUNC(dynamicCombo_attributeLoad));

    class Controls: Controls {
        class Title: Title {
            DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES(right);
        };
        class Value: Value {};
        class GVAR(description): GVAR(description) {};
    };
};
