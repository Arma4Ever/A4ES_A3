
class GVAR(moduleDescription): ModuleInfo {
    attributeLoad = QUOTE(_this call FUNC(moduleDescription_attributeLoad));
    h = "5 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class TitleCustom: TitleCustom {
            idc = IDC_DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE;
            text = CSTRING(ModuleDescription_Title);
            colorText[] = {0.75, 0.75, 0.75, 1};
            colorShadow[] = {0, 0, 0, 0};
            colorBackground[] = {0, 0, 0, 0.25};
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class Group: Group {
            h = "0";
            class Controls: Controls {
                class Text: Text {
                    colorBackground[] = {0, 0, 0, 0.15};
                    h = "0";
                };
            };
        };
    };
};
