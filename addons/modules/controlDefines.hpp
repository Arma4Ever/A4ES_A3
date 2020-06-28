#include "\a3\3DEN\UI\resincl.inc"

#define DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES(alignDir) \
    idc = IDC_DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE; \
    type = 13; \
    size = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5"; \
    text = ""; \
    shadow = 0; \
    class Attributes { \
        color = "#FFFFFF"; \
        size = 1; \
        align = QUOTE(alignDir); \
        valign = "middle"; \
        colorLink = "#c2c2c2"; \
        font = "RobotoCondensedLight"; \
    }
