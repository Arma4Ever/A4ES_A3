
class GVAR(dynamicDialogueEntity): Type {
    attributeLoad = QUOTE(_this call FUNC(dynamicDialogueEntity_attributeLoad));
    attributeSave = QUOTE(_this call FUNC(dynamicDialogueEntity_attributeSave));
    h = "11.1 * 5 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class EntitiesComboTitle: ctrlStatic {
            idc = 1001;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "0 * 5 * (pixelH * pixelGrid * 	0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            text = "";
            colorText[] = {1, 1, 1, 0.4};
        };
        class EntitiesCombo: ctrlCombo {
            idc = 120;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "1 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 25) * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class EntitiesAddButton: ctrlButton {
            idc = 121;
            text = ECSTRING(common,Add);
            x = "(48 + 82 - 20) * (pixelW * pixelGrid * 0.50)";
            y = "1 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "20 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class EntitiesEditNotification: ctrlStructuredText {
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
        class EntitiesTitle: ctrlStatic {
            idc = 107;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "3 * 5 * (pixelH * pixelGrid * 	0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            text = "";
            colorText[] = {1, 1, 1, 0.4};
        };
        class EntitiesBackground: ctrlStatic {
            idc = -1;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "4 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * 5 * (pixelH * pixelGrid * 0.50)";
            colorBackground[] = {1, 1, 1, 0.05};
        };
        class EntitiesList: ctrlListNBox {
            idc = 105;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "4 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * 5 * (pixelH * pixelGrid * 0.50)";
            drawSideArrows = 0;
            columns[] = {0.05000001};
            disableOverflow = 1;
            colorBorder[] = {0, 0, 0, 1};
        };
        class EntitiesListDesc: ctrlStatic {
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
    };
};
