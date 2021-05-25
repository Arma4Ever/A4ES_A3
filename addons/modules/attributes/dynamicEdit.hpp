
class GVAR(dynamicEdit): Edit {
    attributeLoad = QUOTE(_this call FUNC(dynamicEdit_attributeLoad));
    class Controls: Controls {
        class Title: Title {
            DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES(right,0);
        };
        class Value: Value {};
        class GVAR(description): GVAR(description) {};
    };
};
class GVAR(dynamicHiddenEdit): GVAR(dynamicEdit) {
    w = "0";
    h = "0";
};
class GVAR(dynamicEditCode): EditCode {
    attributeLoad = QUOTE(_this call FUNC(dynamicEdit_attributeLoad));
    class Controls: Controls {
        class Title: Title {
            DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES(right,0);
        };
        class Value: Value {};
        class GVAR(description): GVAR(description) {};
    };
};
class GVAR(dynamicEditMulti3): EditMulti3 {
    // TODO
};
class GVAR(dynamicEditMulti5): EditMulti5 {
    attributeLoad = QUOTE(_this call FUNC(dynamicEdit_attributeLoad));
    // TODO: Fix scroll (with & without desc)
    h = "(5 * 5 + 1.6 * 5) * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class BottomBackground: Background {
            y = "0.8 * 5 * (pixelH * pixelGrid * 0.50)";
            h = "(5 * 5 + 0.8 * 5) * (pixelH * pixelGrid * 0.50)";
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class Background: Background {
            style = 64;
            colorText[] = {1, 1, 1, 1};
            y = "0.8 * 5 * (pixelH * pixelGrid * 0.50)";
            h = "(5 * 5 + 0.8 * 5) * (pixelH * pixelGrid * 0.50)";
        };
        class Title: Title {
            DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES(left,0);
            y = "0";
            h = "4 * (pixelH * pixelGrid * 0.50)";
            colorBackground[] = {0, 0, 0, 0};
        };
        class Value: Value {
            //h = "5 * 3.5 * (pixelH * pixelGrid * 0.50)";
            y = "1.25 * 5 * (pixelH * pixelGrid * 0.50)";
        };
        class GVAR(description): GVAR(description) {
            y = "(5 * 3.5 + 1.6 * 5) * (pixelH * pixelGrid * 0.50)";
        };
    };
};
class GVAR(dynamicEditCodeMulti3): EditCodeMulti3 {
    // TODO
};
class GVAR(dynamicEditCodeMulti5): EditCodeMulti5 {
    attributeLoad = QUOTE(_this call FUNC(dynamicEdit_attributeLoad));
    h = "(5 * 3.5 + 1.6 * 5) * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class BottomBackground: Background {
            y = "0.8 * 5 * (pixelH * pixelGrid * 0.50)";
            h = "(5 * 3.5 + 0.8 * 5) * (pixelH * pixelGrid * 0.50)";
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class Background: Background {
            style = 64;
            colorText[] = {1, 1, 1, 1};
            y = "0.8 * 5 * (pixelH * pixelGrid * 0.50)";
            h = "(5 * 3.5 + 0.8 * 5) * (pixelH * pixelGrid * 0.50)";
        };
        class Title: Title {
            DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES(left,0);
            y = "0";
            h = "4 * (pixelH * pixelGrid * 0.50)";
            colorBackground[] = {0, 0, 0, 0};
        };
        class Value: Value {
            y = "1.25 * 5 * (pixelH * pixelGrid * 0.50)";
        };
        class GVAR(description): GVAR(description) {
            y = "(5 * 3.5 + 1.6 * 5) * (pixelH * pixelGrid * 0.50)";
        };
    };
};
