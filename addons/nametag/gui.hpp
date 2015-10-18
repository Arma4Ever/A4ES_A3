class w_RscText {
    idc = -1;
    type = 0;
    style = 0x00;
    colorBackground[] = { 1 , 1 , 1 , 0 };
    colorText[] = { 1 , 1 , 1 , 1 };
    font = "PuristaSemibold";
    sizeEx = 0.025;
    h = 0.25;
    text = "";
};
class RscStructuredText;
class RscListbox;
class IGUIBack;
class RscText;
#define X_OFFSET 0.2

class GVAR(button_base) {
    tooltip = "";
    action = "";

    idc = -1;
    access = 0;
    type = 1;
    text = "";
    font = "PuristaMedium";
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
class GVAR(select_menu) {
    idd = 8854;
    movingEnable = 0;
    class controls {
        class back: IGUIBack {
            x = X_OFFSET;
            y = 0;
            w = 0.6;
            h = 0.71;
            colorBackground[] = {0, 0, 0, 0.2};
        };
        class header: RscText {
            idc = 8870;
            x = X_OFFSET + 0.005;
            y = 0.005;
            w = 0.59;
            h = 0.05;
            style = 0x02;
            text = "";
        };
        class itemList: RscListBox {
            onMouseButtonDblClick = "";//"_this call ACE_Interaction_fnc_onSelectMenuDblClick";
            idc = 8866;
            x = X_OFFSET + 0.005;
            w = 0.59;
            h = 0.54;
            y = 0.06;
        };
        /*
        class cancelBtnBackground: GVAR(button_base) {
            type = 0;
            style = 2;
            idc = -1;
            colorBackground[] = {0,0,0,0.5};
            colorBackgroundDisabled[] = {0,0,0,0.5};
            x = X_OFFSET + 0.005;
            w = 0.15;
            h = 0.1;
            y = 0.605;
        };
        */
        class approveBtnBackground: GVAR(button_base) {
            type = 0;
            style = 2;
            idc = -1;
            colorBackground[] = {0,0,0,0.5};
            colorBackgroundDisabled[] = {0,0,0,0.5};
            x = X_OFFSET + 0.445;
            y = 0.605;
            h = 0.1;
            w = 0.15;
        };
        /*
        class cancelBtn: GVAR(button_base) {
            idc = 8855;
            x = X_OFFSET + 0.005;
            w = 0.15;
            h = 0.1;
            y = 0.605;
            style = 2;
            text = "Zamknij"; //$STR_ACE_Interaction_CancelSelection;
            action = "closedialog 0";//"call ACE_Interaction_fnc_hideMenu;";   //'Default' call ACE_Interaction_fnc_openMenu;    'Default' call ACE_Interaction_fnc_openMenuSelf;
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {1,1,1,0.2};
            colorFocused[] = {0,0,0,0};
        };
        */
        class approveBtn: GVAR(button_base) {
            idc = 8860;
            x = X_OFFSET + 0.445;
            y = 0.605;
            h = 0.1;
            w = 0.15;
            style = 2;
            text = "Zamknij";
            action = "closedialog 0";//"call ACE_Interaction_fnc_hideMenu;";
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {1,1,1,0.2};
            colorFocused[] = {0,0,0,0};
        };
    };
};

class RscTitles {
    class GVAR(tag) {
        idd = -1;
        fadeout = 0.25;
        fadein = 0;
        duration = 0.25;
        name= QGVAR(tag);
        onLoad = QUOTE(uiNamespace setVariable [ARR_2('a3cs_nametag_tag', _this select 0)]);
        class controlsBackground {
            class GVAR(tag_status): w_RscText {
                idc = 3600;
                type = 13;
                size = 0.040;
                x = 0.45;
                y = 0.50;
                w = 0.60;
                h = 0.20;
                colorText[] = {1,1,1,1};
                lineSpacing = 0;
                colorBackground[] = {0,0,0,0};
                shadow = 2;
                class Attributes {
                    align = "left";
                };
            };
        };
    };

    //sthud
    class STUI_Canvas
    {
        idd = -1;
        movingEnable = 1;
        enableSimulation = 1;
        enableDisplay = 1;
        duration = 2147483647;
        fadein = 0;
        fadeout = 0;
        onLoad = "_this call STUI_Canvas_OnLoad";
        class controls
        {
            class canvas
            {
                idc = 0;
                x = "SafeZoneX";
                y = "SafeZoneY - 100";
                w = "SafeZoneW";
                h = "SafeZoneH";
                style = 0;
                type = 100;
                scaleMin = 1e-006;
                scaleMax = 1000;
                scaleDefault = 2;
                font = "TahomaB";
                sizeEx = 0.0;
                maxSatelliteAlpha = 0.0;
                colorBackground[] = {0,0,0,0};
                colorLevels[] = {0,0,0,0};
                colorSea[] = {0,0,0,0};
                colorForest[] = {0,0,0,0};
                colorRocks[] = {0,0,0,0};
                colorCountlines[] = {0,0,0,0};
                colorMainCountlines[] = {0,0,0,0};
                colorCountlinesWater[] = {0,0,0,0};
                colorMainCountlinesWater[] = {0,0,0,0};
                colorPowerLines[] = {0,0,0,0};
                colorRailWay[] = {0,0,0,0};
                colorForestBorder[] = {0,0,0,0};
                colorRocksBorder[] = {0,0,0,0};
                colorNames[] = {0,0,0,0};
                colorInactive[] = {0,0,0,0};
                colorOutside[] = {0,0,0,0};
                colorText[] = {0,0,0,0};
                colorGrid[] = {0,0,0,0};
                colorGridMap[] = {0,0,0,0};
                colorTracks[] = {0,0,0,0};
                colorTracksFill[] = {0,0,0,0};
                colorRoads[] = {0,0,0,0};
                colorRoadsFill[] = {0,0,0,0};
                colorMainRoads[] = {0,0,0,0};
                colorMainRoadsFill[] = {0,0,0,0};
                ShowCountourInterval = 0;
                shadow = 0;
                text = "";
                alphaFadeStartScale = 0.0;
                alphaFadeEndScale = 0.0;
                fontLabel = "TahomaB";
                sizeExLabel = 0.0;
                fontGrid = "TahomaB";
                sizeExGrid = 0.0;
                fontUnits = "TahomaB";
                sizeExUnits = 0.0;
                fontNames = "TahomaB";
                sizeExNames = 0.0;
                fontInfo = "TahomaB";
                sizeExInfo = 0.0;
                fontLevel = "TahomaB";
                sizeExLevel = 0.0;
                stickX[] = {0.0,{ "Gamma",0,0.0 }};
                stickY[] = {0.0,{ "Gamma",0,0.0 }};
                ptsPerSquareSea = 0;
                ptsPerSquareTxt = 0;
                ptsPerSquareCLn = 0;
                ptsPerSquareExp = 0;
                ptsPerSquareCost = 0;
                ptsPerSquareFor = 0;
                ptsPerSquareForEdge = 0;
                ptsPerSquareRoad = 0;
                ptsPerSquareObj = 0;
                class Task
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    iconCreated = "";
                    colorCreated[] = {0,0,0,0};
                    iconCanceled = "";
                    colorCanceled[] = {0,0,0,0};
                    iconDone = "";
                    colorDone[] = {0,0,0,0};
                    iconFailed = "";
                    colorFailed[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class CustomMark
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Bunker
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Bush
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class BusStop
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Command
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Cross
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Fortress
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Fuelstation
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Fountain
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Hospital
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Chapel
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Church
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Lighthouse
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Quay
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Rock
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Ruin
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class SmallTree
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Stack
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Tree
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Tourism
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Transmitter
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class ViewTower
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Watertower
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Waypoint
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class WaypointCompleted
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class ActiveMarker
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class PowerSolar
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class PowerWave
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class PowerWind
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Shipwreck
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
            };
        };
    };
    class ST_STHud_Rsc
    {
        idd = -1;
        movingEnable = 1;
        enableSimulation = 1;
        enableDisplay = 1;
        onLoad = "_this call ST_STHud_Load";
        duration = 2147483647;
        fadein = 0;
        fadeout = 0;
        class controls
        {
            class Text: RscStructuredText
            {
                idc = 0;
                x = 0.58;
                y = "(SafeZoneY + SafeZoneH - 0.2)";
                w = 0.25;
                h = 0.2;
            };
            class Text2: Text
            {
                idc = 1;
                x = 0.75;
            };
            class Minimap
            {
                idc = 2;
                x = "(0.5- (0.5 * 0.2))";
                y = "(SafeZoneY + SafeZoneH - 0.2)- 100";
                w = 0.2;
                h = 0.2;
                style = 0;
                type = 100;
                scaleMin = 1e-006;
                scaleMax = 1000;
                scaleDefault = 2;
                font = "TahomaB";
                sizeEx = 0.0;
                maxSatelliteAlpha = 0.0;
                colorBackground[] = {0,0,0,0};
                colorLevels[] = {0,0,0,0};
                colorSea[] = {0,0,0,0};
                colorForest[] = {0,0,0,0};
                colorRocks[] = {0,0,0,0};
                colorCountlines[] = {0,0,0,0};
                colorMainCountlines[] = {0,0,0,0};
                colorCountlinesWater[] = {0,0,0,0};
                colorMainCountlinesWater[] = {0,0,0,0};
                colorPowerLines[] = {0,0,0,0};
                colorRailWay[] = {0,0,0,0};
                colorForestBorder[] = {0,0,0,0};
                colorRocksBorder[] = {0,0,0,0};
                colorNames[] = {0,0,0,0};
                colorInactive[] = {0,0,0,0};
                colorOutside[] = {0,0,0,0};
                colorText[] = {0,0,0,0};
                colorGrid[] = {0,0,0,0};
                colorGridMap[] = {0,0,0,0};
                colorTracks[] = {0,0,0,0};
                colorTracksFill[] = {0,0,0,0};
                colorRoads[] = {0,0,0,0};
                colorRoadsFill[] = {0,0,0,0};
                colorMainRoads[] = {0,0,0,0};
                colorMainRoadsFill[] = {0,0,0,0};
                ShowCountourInterval = 0;
                shadow = 0;
                text = "";
                alphaFadeStartScale = 0.0;
                alphaFadeEndScale = 0.0;
                fontLabel = "TahomaB";
                sizeExLabel = 0.0;
                fontGrid = "TahomaB";
                sizeExGrid = 0.0;
                fontUnits = "TahomaB";
                sizeExUnits = 0.0;
                fontNames = "TahomaB";
                sizeExNames = 0.0;
                fontInfo = "TahomaB";
                sizeExInfo = 0.0;
                fontLevel = "TahomaB";
                sizeExLevel = 0.0;
                stickX[] = {0.0,{ "Gamma",0,0.0 }};
                stickY[] = {0.0,{ "Gamma",0,0.0 }};
                ptsPerSquareSea = 0;
                ptsPerSquareTxt = 0;
                ptsPerSquareCLn = 0;
                ptsPerSquareExp = 0;
                ptsPerSquareCost = 0;
                ptsPerSquareFor = 0;
                ptsPerSquareForEdge = 0;
                ptsPerSquareRoad = 0;
                ptsPerSquareObj = 0;
                class Task
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    iconCreated = "";
                    colorCreated[] = {0,0,0,0};
                    iconCanceled = "";
                    colorCanceled[] = {0,0,0,0};
                    iconDone = "";
                    colorDone[] = {0,0,0,0};
                    iconFailed = "";
                    colorFailed[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class CustomMark
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Bunker
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Bush
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class BusStop
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Command
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Cross
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Fortress
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Fuelstation
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Fountain
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Hospital
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Chapel
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Church
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Lighthouse
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Quay
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Rock
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Ruin
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class SmallTree
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Stack
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Tree
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Tourism
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Transmitter
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class ViewTower
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Watertower
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Waypoint
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class WaypointCompleted
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class ActiveMarker
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class PowerSolar
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class PowerWave
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class PowerWind
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Shipwreck
                {
                    icon = "";
                    color[] = {0,0,0,0};
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                };
            };
        };
    };
};
