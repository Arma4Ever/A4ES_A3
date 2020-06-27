
class GVAR(moduleWarnings): ModuleInfo {
    attributeLoad = QUOTE(_this call FUNC(moduleWarnings_attributeLoad));
    h = "5 * 	5 * (pixelH * pixelGrid * 0.50)";
    class Controls {
        delete TitleCustom;
        class Group: ctrlControlsGroup {
            idc = 101;
            x = "5 * (pixelW * pixelGrid * 0.50)";
            y = "0";
            w = "(	48 + 82 - 5) * (pixelW * pixelGrid * 0.50)";
            h = "5 * 5 * (pixelH * pixelGrid * 0.50)";

            class ScrollBar {
                scrollSpeed = 0;
            };
            class Controls {
                class Text: ctrlStructuredText {
                    idc = 100;
                    size = "3.96 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                    y = "0";
                    w = "(48 + 82 - 5) * (pixelW * pixelGrid * 0.50)";
                    h = "5 * 5 * (pixelH * pixelGrid * 	0.50)";
                    colorBackground[]={0,0,0,0};
                };
            };
        };
    };
};
