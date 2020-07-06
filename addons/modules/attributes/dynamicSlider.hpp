
class GVAR(dynamicSlider): Slider {
    onLoad = "";
    attributeLoad = QUOTE(_this call FUNC(dynamicSlider_attributeLoad));

    class Controls: Controls {
        class Title: Title {
            DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES(right,0);
            y = "0.5 * (pixelH * pixelGrid * 0.50)";
            h = "4.5 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: Value {
            sliderStep = 1;
        };
        class Edit: Edit {};
        class GVAR(description): GVAR(description) {};
    };
};
