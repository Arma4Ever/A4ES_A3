#include "\a3\3DEN\UI\resincl.inc"

// Control IDC
#define IDC_DISPLAY3DEN_PANELLEFT_WARNINGS        1200
#define IDC_DISPLAY3DEN_PANELLEFT_WARNINGS_ICON   1201
#define IDC_DISPLAY3DEN_PANELLEFT_WARNINGS_INFO   1202
#define IDC_DISPLAY3DEN_PANELLEFT_WARNINGS_TREE   1203

#define IDC_DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE    701
#define IDC_DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_DESC     702

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
