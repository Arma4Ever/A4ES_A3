
class GVAR(dynamicToolbox): Toolbox {
    attributeLoad = QUOTE(_this call FUNC(dynamicToolbox_attributeLoad););
    attributeSave = QUOTE(_this call FUNC(dynamicToolbox_attributeSave););
    class Controls: Controls {
        class Title: Title {
            DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES(right,0);
            y = "0.5 * (pixelH * pixelGrid * 0.50)";
            h = "4.5 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: Value {
            idc = 100;
            rows = 1;
            columns = 0;
            strings[] = {};
            tooltips[] = {};
            values[] = {};
            colorBackground[] = {0, 0, 0, 0.5};
            colorText[] = {1, 1, 1, 0.75};
            colorTextSelect[] = {1, 1, 1, 1};
            colorSelectedBg[] = {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
                1
            };
        };
        class GVAR(description): GVAR(description) {};
    };
};

class GVAR(dynamicToolboxPicture): GVAR(dynamicToolbox) {
    h = "8 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            y = "2 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: Value {
            x = "48 * (pixelW * pixelGrid * 0.50)";
            y = "0";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "8 * (pixelH * pixelGrid * 0.50)";
            style = "0x02 + 0x30 + 0x800";
        };
        class GVAR(description): GVAR(description) {
            y = "8 * (pixelH * pixelGrid * 0.50)";
        };
    };
};
