
#define X_OFFSET 0.2

#define X_LISTBOX_OFFSET (X_ORIGINAL(11))
#define Y_LISTBOX_OFFSET (Y_ORIGINAL(0))

#define X_EDITBOX_OFFSET (X_ORIGINAL(11))
#define Y_EDITBOX_OFFSET (Y_ORIGINAL(6))

class A3CS_ui_backgroundBase {
    type = CT_STATIC;
    idc = -1;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = FONT_STANDARD;
    text = "";
    sizeEx = 0.032;
};
class A3CS_ui_staticBase {
    idc = -1;
    type = CT_STATIC;
    x = 0.0;
    y = 0.0;
    w = 0.183825;
    h = 0.104575;
    style = ST_LEFT;
    font = FONT_STANDARD;
    sizeEx = 0.03921;
    colorText[] = {0.95, 0.95, 0.95, 1.0};
    colorBackground[] = {0, 0, 0, 0};
    text = "";
};
class A3CS_ui_comboBoxBase: RscCombo {
    idc = -1;
    type = 4;
    style = "0x10 + 0x200";
    x = 0;
    y = 0;
    w = 0.3;
    h = 0.035;
    color[] = {0,0,0,0.6};
    colorActive[] = {1,0,0,1};
    colorBackground[] = {0,0,0,1};
    colorDisabled[] = {1,1,1,0.25};
    colorScrollbar[] = {1,0,0,1};
    colorSelect[] = {0,0,0,1};
    colorSelectBackground[] = {1,1,1,0.7};
    colorText[] = {1,1,1,1};
    arrowEmpty = "";
    arrowFull = "";
    wholeHeight = 0.45;
    font = FONT_STANDARD;
    sizeEx = 0.031;
    soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
    soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
    soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
    maxHistoryDelay = 1.0;
    class ScrollBar {
        color[] = {0.3,0.3,0.3,0.6};
        colorActive[] = {0.3,0.3,0.3,1};
        colorDisabled[] = {0.3,0.3,0.3,0.3};
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        border = "";
    };
    class ComboScrollBar {
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        autoScrollDelay = 5;
        autoScrollEnabled = 0;
        autoScrollRewind = 0;
        autoScrollSpeed = -1;
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
        color[] = {0.3,0.3,0.3,0.6};
        colorActive[] = {0.3,0.3,0.3,1};
        colorDisabled[] = {0.3,0.3,0.3,0.3};
        height = 0;
        scrollSpeed = 0.06;
        shadow = 0;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        width = 0;
    };
};
class A3CS_ui_listNBoxBase {
    type = CT_LISTNBOX;
    style =ST_MULTI;
    w = 0.4;
    h = 0.4;
    font = FONT_STANDARD;
    sizeEx = 0.031;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
    columns[] = {0.0};
    color[] = {1, 1, 1, 1};
    rowHeight = 0.03;
    colorBackground[] = {0, 0, 0, 0.2};
    colorText[] = {1,1, 1, 1.0};
    colorScrollbar[] = {0.95, 0.95, 0.95, 1};
    colorSelect[] = {0.95, 0.95, 0.95, 1};
    colorSelect2[] = {0.95, 0.95, 0.95, 1};
    colorSelectBackground[] = {0, 0, 0, 0.0};
    colorSelectBackground2[] = {0.0, 0.0, 0.0, 0.5};
    colorActive[] = {0,0,0,1};
    colorDisabled[] = {0,0,0,0.3};
    rows = 1;
    drawSideArrows = 0;
    idcLeft = -1;
    idcRight = -1;
    maxHistoryDelay = 1;
    soundSelect[] = {"", 0.1, 1};
    period = 1;
    shadow = 2;
    class ScrollBar {
        arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
        arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
        border = "#(argb,8,8,3)color(1,1,1,1)";
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        thumb = "#(argb,8,8,3)color(1,1,1,1)";
    };
    class ListScrollBar {
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        autoScrollDelay = 5;
        autoScrollEnabled = 0;
        autoScrollRewind = 0;
        autoScrollSpeed = -1;
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        height = 0;
        scrollSpeed = 0.06;
        shadow = 0;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        width = 0;
    };
};
class A3CS_ui_buttonBase {
    idc = -1;
    type = CT_SHORTCUTBUTTON;
    style = ST_LEFT;
    text = "";
    action = "";
    x = 0.0;
    y = 0.0;
    w = 0.25;
    h = 0.04;
    size = 0.03921;
    sizeEx = 0.03921;
    color[] = {1.0, 1.0, 1.0, 1};
    color2[] = {1.0, 1.0, 1.0, 1};
    colorBackground[] = {1,1,1,0.95};
    colorbackground2[] = {1,1,1,0.95};
    colorDisabled[] = {1,1,1,0.6};
    colorFocused[] = {1,1,1,1};
    colorBackgroundFocused[] = {1,1,1,1};
    periodFocus = 1.2;
    periodOver = 0.8;
    default = false;
    class HitZone {
        left = 0.00;
        top = 0.00;
        right = 0.00;
        bottom = 0.00;
    };
    class ShortcutPos {
        left = 0.00;
        top = 0.00;
        w = 0.00;
        h = 0.00;
    };
    class TextPos {
        left = 0.002;
        top = 0.0004;
        right = 0.0;
        bottom = 0.00;
    };
    textureNoShortcut = "";
    animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.9)";
    animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.8)";
    animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
    animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
    period = 0.5;
    font = FONT_STANDARD;
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.0,0};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.07,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    class Attributes {
        font = FONT_STANDARD;
        color = "#E5E5E5";
        align = "center";
        shadow = "true";
    };
    class AttributesImage {
        font = FONT_STANDARD;
        color = "#E5E5E5";
        align = "left";
        shadow = "true";
    };
};
class A3CS_ui_selectMenuButtonBase {
    tooltip = "";
    action = "";

    idc = -1;
    type = 1;
    text = "";
    font = FONT_STANDARD;
    sizeEx = "0.8 / 40 / (getResolution select 5)";
    shadow = 2;

    style = 2;
    x = 0;
    y = 0;
    w = 2.0 / 16 * safezoneW;
    h = 0.3 / 9 * safezoneH;

    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;

    colorText[] = {1,1,1,1};
    colorDisabled[] = {0.5,0.5,0.5,1};
    colorBackground[] = {0,0,0,0.8};
    colorBackgroundDisabled[] = {0,0,0,0.8};
    colorBackgroundActive[] = {1,1,1,0};
    colorFocused[] = {1,1,1,1};
    colorShadow[] = {0,0,0,0};
    colorBorder[] = {1,1,1,0.8};

    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
};
class A3CS_ui_listBox {
    idd = -1;
    movingEnable = 0;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2('A3CS_ui_listBox', _this select 0)];);
    onUnload = QUOTE(uiNamespace setVariable [ARR_2('A3CS_ui_listBox', nil)];);
    class controlsBackground {
        class HeaderBackground: A3CS_ui_backgroundBase {
            idc = -1;
            type = CT_STATIC;
            style = ST_LEFT + ST_SHADOW;
            x = X_ORIGINAL(0) + X_LISTBOX_OFFSET;
            y = Y_ORIGINAL(1) + Y_LISTBOX_OFFSET;
            w = W_ORIGINAL(24);
            h = H_ORIGINAL(1);
            SizeEx = H_ORIGINAL(1);
            colorText[] = {0.95, 0.95, 0.95, 0.75};
            colorBackground[] = {"(profilenamespace getVariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getVariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getVariable ['GUI_BCG_RGB_B',0.5])", "(profilenamespace getVariable ['GUI_BCG_RGB_A',0.9])"};
            text = "";
        };
        class BodyBackgroud: A3CS_ui_backgroundBase {
            idc = -1;
            type = CT_STATIC;
            style = ST_LEFT + ST_SHADOW;
            x = X_ORIGINAL(0) + X_LISTBOX_OFFSET;
            y = Y_ORIGINAL(2) + Y_LISTBOX_OFFSET;
            w = W_ORIGINAL(24);
            h = H_ORIGINAL(17);
            SizeEx = H_ORIGINAL(1);
            colorText[] = {0.95, 0.95, 0.95, 0.75};
            colorBackground[] = {0, 0, 0, 0.8};
            text = "";
        };
    };
    class controls {
        class HeaderName {
            idc = IDC_LISTBOX_HEADER;
            type = CT_STATIC;
            x = X_ORIGINAL(0) + X_LISTBOX_OFFSET;
            y = Y_ORIGINAL(1) + Y_LISTBOX_OFFSET;
            w = W_ORIGINAL(24);
            h = H_ORIGINAL(1);
            style = ST_LEFT + ST_SHADOW;
            font = FONT_STANDARD;
            SizeEx = H_PART(1);
            colorText[] = {0.95, 0.95, 0.95, 0.75};
            colorBackground[] = {0,0,0,0};
            text = "";
        };
        class List: A3CS_ui_listNBoxBase {
            idc = IDC_LISTBOX_LIST;
            style = ST_LEFT + LB_TEXTURES;
            x = X_ORIGINAL(0) + X_LISTBOX_OFFSET;
            y = Y_ORIGINAL(2.5) + Y_LISTBOX_OFFSET;
            w = W_ORIGINAL(24);
            h = H_ORIGINAL(15);
            colorText[] = {1,1,1,1};
            colorDisabled[] = {1,1,1,0.25};
            colorSelect[] = {1,1,1,1};
            colorSelect2[] = {1,1,1,1};
            colorShadow[] = {0,0,0,0.5};
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,0.25};
            onMouseButtonDblClick = "";
            SizeEx = H_ORIGINAL(1);
        };
        class ButtonOne: A3CS_ui_buttonBase {
            idc = IDC_LISTBOX_BUTTON1;
            x = X_ORIGINAL(0) + X_LISTBOX_OFFSET;
            y = Y_ORIGINAL(18) + Y_LISTBOX_OFFSET;
            w = W_ORIGINAL(8);
            h = H_ORIGINAL(1);
            animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.8)";
            animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.5)";
            animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
            animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
            animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
            animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
            color[] = {1,1,1,1};
            color2[] = {0,0,0,1};
            colorBackgroundFocused[] = {1,1,1,1};
            colorBackground[] = {1,1,1,1};
            colorbackground2[] = {1,1,1,1};
            colorDisabled[] = {0.5,0.5,0.5,0.8};
            colorFocused[] = {0,0,0,1};
            periodFocus = 1;
            periodOver = 1;
            text = "";
            action = "";
        };
        class ButtonTwo: ButtonOne {
            idc = IDC_LISTBOX_BUTTON2;
            x = X_ORIGINAL(8) + X_LISTBOX_OFFSET;
            y = Y_ORIGINAL(18) + Y_LISTBOX_OFFSET;
            w = W_ORIGINAL(8);
            h = H_ORIGINAL(1);
            text = "";
            action = "";
        };
        class ButtonThree: ButtonOne {
            idc = IDC_LISTBOX_BUTTON3;
            x = X_ORIGINAL(16) + X_LISTBOX_OFFSET;
            y = Y_ORIGINAL(18) + Y_LISTBOX_OFFSET;
            w = W_ORIGINAL(8);
            h = H_ORIGINAL(1);
            text = "";
            action = "";
        };
    };
};
class A3CS_ui_editBox {
    idd = -1;
    movingEnable = 0;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2('A3CS_ui_editBox', _this select 0)];);
    onUnload = QUOTE(uiNamespace setVariable [ARR_2('A3CS_ui_editBox', nil)];);
    class controlsBackground {
        class HeaderBackground: A3CS_ui_backgroundBase {
            idc = -1;
            type = CT_STATIC;
            style = ST_LEFT + ST_SHADOW;
            x = X_ORIGINAL(0) + X_EDITBOX_OFFSET;
            y = Y_ORIGINAL(1) + Y_EDITBOX_OFFSET;
            w = W_ORIGINAL(24);
            h = H_ORIGINAL(1);
            SizeEx = H_ORIGINAL(1);
            colorText[] = {0.95, 0.95, 0.95, 0.75};
            colorBackground[] = {"(profilenamespace getVariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getVariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getVariable ['GUI_BCG_RGB_B',0.5])", "(profilenamespace getVariable ['GUI_BCG_RGB_A',0.9])"};
            text = "";
        };
        class BodyBackgroud: A3CS_ui_backgroundBase {
            idc = -1;
            type = CT_STATIC;
            style = ST_LEFT + ST_SHADOW;
            x = X_ORIGINAL(0) + X_EDITBOX_OFFSET;
            y = Y_ORIGINAL(2) + Y_EDITBOX_OFFSET;
            w = W_ORIGINAL(24);
            h = H_ORIGINAL(4);
            SizeEx = H_ORIGINAL(1);
            colorText[] = {0.95, 0.95, 0.95, 0.75};
            colorBackground[] = {0, 0, 0, 0.8};
            text = "";
        };
    };
    class controls {
        class HeaderName {
            idc = IDC_EDITBOX_HEADER;
            type = CT_STATIC;
            x = X_ORIGINAL(0) + X_EDITBOX_OFFSET;
            y = Y_ORIGINAL(1) + Y_EDITBOX_OFFSET;
            w = W_ORIGINAL(24);
            h = H_ORIGINAL(1);
            style = ST_LEFT + ST_SHADOW;
            font = FONT_STANDARD;
            SizeEx = H_PART(1);
            colorText[] = {0.95, 0.95, 0.95, 0.75};
            colorBackground[] = {0,0,0,0};
            text = "";
        };
        class TextInputLabel: A3CS_ui_staticBase {
            idc = IDC_EDITBOX_TEXTINPUTLABEL;
            x = X_ORIGINAL(0.5) + X_EDITBOX_OFFSET;
            y = Y_ORIGINAL(3) + Y_EDITBOX_OFFSET;
            w = W_ORIGINAL(4.5);
            h = H_ORIGINAL(1);
            text = "";
        };
        class TextInput: ctrlEdit {
            idc = IDC_EDITBOX_TEXTINPUT;
            x = X_ORIGINAL(5) + X_EDITBOX_OFFSET;
            y = Y_ORIGINAL(3.1) + Y_EDITBOX_OFFSET;
            w = W_ORIGINAL(18.5);
            h = H_ORIGINAL(1);
        };
        class ButtonOne: A3CS_ui_buttonBase {
            idc = IDC_EDITBOX_BUTTON1;
            x = X_ORIGINAL(0) + X_EDITBOX_OFFSET;
            y = Y_ORIGINAL(5) + Y_EDITBOX_OFFSET;
            w = W_ORIGINAL(8);
            h = H_ORIGINAL(1);
            animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.8)";
            animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.5)";
            animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
            animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
            animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
            animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
            color[] = {1, 1, 1, 1};
            color2[] = {0,0,0, 1};
            colorBackgroundFocused[] = {1,1,1,1};
            colorBackground[] = {1,1,1,1};
            colorbackground2[] = {1,1,1,1};
            colorDisabled[] = {0.5,0.5,0.5,0.8};
            colorFocused[] = {0,0,0,1};
            periodFocus = 1;
            periodOver = 1;
            text = "";
            action = "";
        };
        class ButtonTwo: ButtonOne {
            idc = IDC_EDITBOX_BUTTON2;
            x = X_ORIGINAL(8) + X_EDITBOX_OFFSET;
            y = Y_ORIGINAL(5) + Y_EDITBOX_OFFSET;
            w = W_ORIGINAL(8);
            h = H_ORIGINAL(1);
            text = "";
            action = "";
        };
        class ButtonThree: ButtonOne {
            idc = IDC_EDITBOX_BUTTON3;
            x = X_ORIGINAL(16) + X_EDITBOX_OFFSET;
            y = Y_ORIGINAL(5) + Y_EDITBOX_OFFSET;
            w = W_ORIGINAL(8);
            h = H_ORIGINAL(1);
            text = "";
            action = "";
        };
    };
};
