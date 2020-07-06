
class GVAR(dynamicClassSelect): Type {
    attributeLoad = QUOTE(_this call FUNC(dynamicClassSelect_attributeLoad));
    attributeSave = QUOTE(_this call FUNC(dynamicClassSelect_attributeSave));
    h = "24 * 5 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class TitleBorder: ctrlStatic {
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "4 * (pixelH * pixelGrid * 	0.50)";
            w = "(	48 + 	82 - 	5) * (pixelW * pixelGrid * 	0.50)";
            h = "0.3 * (pixelH * pixelGrid * 	0.50)";
            colorBackground[]={1, 1, 1, 0.2};
        };
        class Title: Title {
            DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_TITLE_PROPERTIES(left,0);
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            w = "(	48 + 	82 - 	5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * (pixelH * pixelGrid * 	0.50)";
            colorBackground[]={0,0,0,0};
        };
        class AssetsListTitle: ctrlStatic {
            idc = -1;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            text = CSTRING(dynamicClassSelect_AssetsListTitle);
            colorText[] = {1,1,1,0.4};
        };
        class Search: Search {
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "2 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 10) * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 	0.50)";
        };
        class SearchButton: SearchButton {
            x = "(48 + 82 - 5) * (pixelW * pixelGrid * 0.50)";
            y = "2 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "5 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 	0.50)";
        };
        class ValueBackground: ctrlStatic {
            idc = -1;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "3 * 5 * (pixelH * pixelGrid * 	0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "9 * 	5 * (pixelH * pixelGrid * 	0.50)";
            colorBackground[] = {1, 1, 1, 0.05};
        };
        class Value: Value {
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "3 * 5 * (pixelH * pixelGrid * 	0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "9 * 	5 * (pixelH * pixelGrid * 	0.50)";
            colorBorder[]={0,0,0,0};
        };
        class ValueNotification: ctrlStructuredText {
            idc = 503;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "12 * 5 * (pixelH * pixelGrid * 	0.50)";
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
        class ClassesEditTitle: ctrlStatic {
            idc = -1;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "13 * 5 * (pixelH * pixelGrid * 	0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            text = CSTRING(dynamicClassSelect_ClassesEditTitle);
            colorText[] = {1, 1, 1, 0.4};
        };
        class ClassesEdit: ctrlEdit {
            idc = 120;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "14 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 25) * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            text = "";
            tooltip = CSTRING(dynamicClassSelect_ClassesEdit_Tooltip);
        };
        class ClassesAddButton: ctrlButton {
            idc = 121;
            text = ECSTRING(common,Add);
            x = "(48 + 82 - 20) * (pixelW * pixelGrid * 0.50)";
            y = "14 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "20 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class ClassesEditNotification: ctrlStructuredText {
            idc = 122;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "15 * 5 * (pixelH * pixelGrid * 0.50)";
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
        class ListTitle: ctrlStatic {
            idc = 107;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "16 * 5 * (pixelH * pixelGrid * 	0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            text = "";
            colorText[] = {1, 1, 1, 0.4};
        };
        class ListModeTitle: ctrlStatic {
            idc = 103;
            style = 1;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "16 * 5 * (pixelH * pixelGrid * 	0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            text = "";
            colorText[] = {1, 1, 1, 0.4};
        };
        class ListBackground: ctrlStatic {
            idc = -1;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "17 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * 5 * (pixelH * pixelGrid * 0.50)";
            colorBackground[] = {1, 1, 1, 0.05};
        };
        class List: ctrlListNBox {
            idc = 101;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "17 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 5) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * 5 * (pixelH * pixelGrid * 0.50)";
            drawSideArrows = 1;
            idcLeft = 393101;
            idcRight = 393102;
            columns[] = {0.05000001, 0.60000001, 0.85000002};
            disableOverflow = 1;
            colorBorder[]={0, 0, 0, 1};
        };
        class ListDesc: ctrlStatic {
            idc = 106;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "22 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "(48 + 82 - 30) * (pixelW * pixelGrid * 	0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            text = "";
            colorText[] = {1, 1, 1, 0.4};
        };
        class ButtonRemove: ctrlButton {
            idc = 104;
            text = ECSTRING(common,Remove);
            tooltip = CSTRING(dynamicClassSelect_ButtonRemove_Tooltip);
            x = "(48 + 82 - 25) * (pixelW * pixelGrid * 0.50)";
            y = "22 * 5 * (pixelH * pixelGrid * 0.50)";
            w = "25 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class ListNotification: ctrlStructuredText {
            idc = 102;
            x = "5 * (pixelW * pixelGrid * 	0.50)";
            y = "23 * 5 * (pixelH * pixelGrid * 0.50)";
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
            idc = 393101;
            text = "-";
            font = "RobotoCondensedBold";
            x = -1;
            y = -1;
            w = "5 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class ArrowRight: ArrowLeft {
            idc = 393102;
            text = "+";
        };
    };
};
