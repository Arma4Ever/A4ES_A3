
class GVAR(dynamicCheckbox): Checkbox {
    attributeLoad = QUOTE(_this call FUNC(dynamicCheckbox_attributeLoad););
    defaultValue = "false";
    typeName = "BOOL";

    class Controls: Controls {
        class Title: Title {
            DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES(right,0);
            y = "0.75 * (pixelH * pixelGrid * 0.50)";
            h = "4.25 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: Value {};
        class GVAR(description): GVAR(description) {};
    };
};
