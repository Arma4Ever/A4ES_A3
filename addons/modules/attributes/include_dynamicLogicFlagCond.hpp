
class DLFC_CLASS: Type {
    attributeLoad = QUOTE([ARR_4(_this,DLFC_IDC_LIST,DLFC_IDC_ARLEFT,DLFC_IDC_ARRIGHT)] call FUNC(dynamicLogicFlagCond_attributeLoad));
    attributeSave = QUOTE([ARR_2(_this,DLFC_IDC_LIST)] call FUNC(dynamicLogicFlagCond_attributeSave));
    h = "11.1 * 5 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class FlagsComboTitle: ctrlStatic {
            idc = -1;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "0 * 5 * (pixelH * pixelGrid * 	0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            text = CSTRING(dynamicLogicFlagCond_flagsComboTitle);
            colorText[] = {1, 1, 1, 0.4};
        };
        class FlagsCombo: ctrlCombo {
            idc = 120;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "1 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 25) * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class FlagsAddButton: ctrlButton {
            idc = 121;
            text = ECSTRING(common,Add);
            x = "(48 + 82 - 20) * (pixelW * pixelGrid * 0.50)";
            y = "1 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "20 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class FlagsEditNotification: ctrlStructuredText {
            idc = 122;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "2 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * (pixelH * pixelGrid * 	0.50)";
            fade = 1;
            shadow = 1;
            colorBackground[] = {0.12549, 0.505882, 0.313726, 1};
            class Attributes {
                color = "#ffffff";
                size = 1;
                align = "center";
                valign = "middle";
                colorLink = "#c2c2c2";
                font = "RobotoCondensedBold";
            };
        };
        class FlagsTitle: ctrlStatic {
            idc = 107;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "3 * 5 * (pixelH * pixelGrid * 	0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            text = CSTRING(dynamicLogicFlagCond_FlagsTitle);
            colorText[] = {1, 1, 1, 0.4};
        };
        class FlagsValueTitle: ctrlStatic {
            idc = 103;
            style = 1;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "3 * 5 * (pixelH * pixelGrid * 	0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            text = CSTRING(dynamicLogicFlagCond_FlagsValueTitle);
            colorText[] = {1, 1, 1, 0.4};
        };
        class ListBackground: ctrlStatic {
            idc = -1;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "4 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * 5 * (pixelH * pixelGrid * 0.50)";
            colorBackground[] = {1, 1, 1, 0.05};
        };
        class List: ctrlListNBox {
            idc = DLFC_IDC_LIST;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "4 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * 5 * (pixelH * pixelGrid * 0.50)";
            drawSideArrows = 1;
            idcLeft = DLFC_IDC_ARLEFT;
            idcRight = DLFC_IDC_ARRIGHT;
            columns[] = {0.05000001, 0.60000001, 0.85000002};
            disableOverflow = 1;
            colorBorder[] = {0, 0, 0, 1};
        };
        class ListDesc: ctrlStatic {
            idc = 106;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "9 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 30) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            text = "";
            colorText[] = {1, 1, 1, 0.4};
        };
        class ButtonRemove: ctrlButton {
            idc = 104;
            text = ECSTRING(common,Remove);
            tooltip = CSTRING(dynamicLogicFlagCond_ButtonRemove_Tooltip);
            x = "(48 + 82 - 25) * (pixelW * pixelGrid * 0.50)";
            y = "9 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "25 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class ListNotification: ctrlStructuredText {
            idc = 102;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "10 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            fade = 1;
            shadow = 1;
            colorBackground[] = {0.12549, 0.505882, 0.313726, 1};
            class Attributes {
                color = "#ffffff";
                size = 1;
                align = "center";
                valign = "middle";
                colorLink = "#c2c2c2";
                font = "RobotoCondensedBold";
            };
        };
        class ArrowLeft: ctrlButton {
            idc = DLFC_IDC_ARLEFT;
            text = "F";
            font = "RobotoCondensedBold";
            x = -1;
            y = -1;
            w = "5 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class ArrowRight: ArrowLeft {
            idc = DLFC_IDC_ARRIGHT;
            text = "P";
        };
    };
};

#undef DLFC_CLASS
#undef DLFC_IDC_LIST
#undef DLFC_IDC_ARLEFT
#undef DLFC_IDC_ARRIGHT
