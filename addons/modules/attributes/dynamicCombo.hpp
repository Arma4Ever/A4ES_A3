
class GVAR(dynamicCombo): Combo {
    attributeLoad = QUOTE(_this call FUNC(dynamicCombo_attributeLoad));

    class Controls: Controls {
        class Title: Title {
            DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES(right,0);
            y = "0.5 * (pixelH * pixelGrid * 0.50)";
            h = "4.5 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: Value {};
        class GVAR(description): GVAR(description) {};
    };
};
