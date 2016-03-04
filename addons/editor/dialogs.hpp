class RscStandardDisplay;
class ctrlMenuStrip;
class ctrlMenu;
class ctrlStaticTitle;
class ctrlStaticBackground;
class ctrlEdit;
class ctrlStaticFooter;
class ctrlButtonOK;
class ctrlButtonCancel;

//Disable Editor 2D Button
class RscDisplaySelectIsland: RscStandardDisplay {
    class Controls {
        delete ButtonContinue3D;
    };
};

class Display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class Attributes {
                    items[] = {"AttributesScenario","AttributesEnvironment","AttributesMultiplayer","Separator"};
                };
            };
        };
    };
    class ContextMenu: ctrlMenu {
        class Items {
            items[] += {QGVAR(changeClass), QGVAR(copyClass), QGVAR(delete)};
            class GVAR(changeClass) {
                text = CSTRING(ChangeClass_DisplayName);
                value = 0;
                conditionShow = "selected";
                action = QUOTE(GVAR(changeClassArray) = (get3DENSelected 'object');(ctrlparent (_this select 0)) createdisplay 'A3CS_ui_3DENChangeClass';);
            };
            class GVAR(copyClass) {
                text = CSTRING(CopyClass_DisplayName);
                value = 0;
                conditionShow = "selected";
                action = "if (count (get3DENSelected 'object') > 1) then {copyToClipboard str ((get3DENSelected 'object') apply {typeof _x})} else {copyToClipboard str (typeof ((get3DENSelected 'object') select 0))} ";
            };
            class GVAR(delete) {
                text = CSTRING(Delete_DisplayName);
                value = 0;
                conditionShow = "selected";
                action = "delete3DENEntities (get3DENSelected 'object')";
            };
        };
    };
};

class A3CS_ui_3DENChangeClass {
    idd = 99320;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2('A3CS_ui_3DENChangeClass', _this select 0)];);
    onUnload = QUOTE(uiNamespace setVariable [ARR_2('A3CS_ui_3DENChangeClass', nil)];);
    class Controls {
        class Title: ctrlStaticTitle {
            x = "(	(0.5 - 0.5 * 	75 * (pixelW * 	1.25 * 4)))";
            y = "(	(0.5 - 0.5 * 	30 * (pixelH * 	1.25 * 4)))";
            w = "(	75) * (pixelW * 	1.25 * 4)";
            h = "5 * (pixelH * 	1.25 * 4)";
            text = CSTRING(ChangeClass_DisplayName);
        };
        class Background: ctrlStaticBackground {
            x = "(	(0.5 - 0.5 * 	75 * (pixelW * 	1.25 * 4)))";
            y = "(	(0.5 - 0.5 * 	30 * (pixelH * 	1.25 * 4))) + 	5 * (pixelH * 	1.25 * 4)";
            w = "(	75) * (pixelW * 	1.25 * 4)";
            h = "(4 * 	5 + 1) * (pixelH * 	1.25 * 4)";
        };
        class Name: ctrlEdit {
            idc = 101;
            x = "(	(0.5 - 0.5 * 	75 * (pixelW * 	1.25 * 4))) + 	5 * (pixelW * 	1.25 * 4)";
            y = "(	(0.5 - 0.5 * 	30 * (pixelH * 	1.25 * 4))) + (2 *  	5) * (pixelH * 	1.25 * 4)";
            w = "(	75 - 2 * 	5) * (pixelW * 	1.25 * 4)";
            h = "(	5) * (pixelH * 	1.25 * 4)";
        };
        class BottomBackground: ctrlStaticFooter {
            x = "(	(0.5 - 0.5 * 	75 * (pixelW * 	1.25 * 4)))";
            y = "(	(0.5 - 0.5 * 	30 * (pixelH * 	1.25 * 4))) + (4 * 	5 - 1) * (pixelH * 	1.25 * 4)";
            w = "(	75) * (pixelW * 	1.25 * 4)";
            h = "(	5 + 2) * (pixelH * 	1.25 * 4)";
        };
        class ButtonOK: ctrlButtonOK {
            x = "(0.5 - 0.5 * 	75 * (pixelW * 	1.25 * 4)) + (	75 * 1/3) * (pixelW * 	1.25 * 4)";
            y = "(	(0.5 - 0.5 * 	30 * (pixelH * 	1.25 * 4))) + (4 * 	5) * (pixelH * 	1.25 * 4)";
            w = "(	75 * 1/3 - 1) * (pixelW * 	1.25 * 4)";
            h = "5 * (pixelH * 	1.25 * 4)";
            onButtonClick = QUOTE((ctrlText ((ctrlparent (_this select 0)) displayCtrl 101)) call DFUNC(changeClass));
            onButtonDown = "ctrlsetfocus (_this select 0);";
        };
        class ButtonCancel: ctrlButtonCancel {
            x = "(0.5 - 0.5 * 	75 * (pixelW * 	1.25 * 4)) + (	75 * 2/3) * (pixelW * 	1.25 * 4)";
            y = "(	(0.5 - 0.5 * 	30 * (pixelH * 	1.25 * 4))) + (4 * 	5) * (pixelH * 	1.25 * 4)";
            w = "(	75 * 1/3 - 1) * (pixelW * 	1.25 * 4)";
            h = "5 * (pixelH * 	1.25 * 4)";
        };
    };
};
