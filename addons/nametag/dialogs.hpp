
#include "\z\a3cs\addons\common\ui\define.hpp"
#include "ui\idcTacticalHud.hpp"

#define X_TACTICALHUD_OFFSET 19
#define Y_TACTICALHUD_OFFSET 5.5

class RscStructuredText;
class RscPicture;
class RscMapControlEmpty;
class GVAR(tag_textBase) {
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
class RscTitles {
    class GVAR(tag) {
        idd = -1;
        fadeout = 0.25;
        fadein = 0;
        duration = 0.25;
        name = QGVAR(tag);
        onLoad = QUOTE(uiNamespace setVariable [ARR_2('a3cs_nametag_tag',_this select 0)]);
        class controlsBackground {
            class GVAR(tag_status): GVAR(tag_textBase) {
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
    class GVAR(tacticalHud) {
        idd = -1;
        movingEnable = 1;
        enableSimulation = 1;
        enableDisplay = 1;
        onload = QUOTE(call DFUNC(onLoadTacticalHud));
        duration = 1e+011;
        fadein = 0;
        fadeout = 0;
        class controls {
            class tacticalHudRadar: RscMapControlEmpty {
                idc = IDC_TACTICALHUD_RADAR;
                text = "";
                style = 0;
                x = X_ORIGINAL((0 + X_TACTICALHUD_OFFSET));
                y = (safezoneY + safezoneH - (0 + Y_TACTICALHUD_OFFSET) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
                w = W_ORIGINAL(5);
                h = H_ORIGINAL(5);
                sizeEx = 0;
                type = 100;
                moveOnEdges = 1;
                shadow = 0;
                font = "PuristaSemibold";
                ptsPerSquareSea = 1000000;
                ptsPerSquareTxt = 1000000;
                ptsPerSquareCLn = 1000000;
                ptsPerSquareExp = 1000000;
                ptsPerSquareCost = 1000000;
                ptsPerSquareFor = 1000000;
                ptsPerSquareForEdge = 1000000;
                ptsPerSquareRoad = 1000000;
                ptsPerSquareObj = 1000000;
                showCountourInterval = 0;
                scaleMin = 0.001;
                scaleMax = 1.0;
                scaleDefault = 0.16;
                maxSatelliteAlpha = 0;
                alphaFadeStartScale = 0;
                alphaFadeEndScale = 0;
                colorBackground[] = {0,0,0,0};
                colorSea[] = {0,0,0,0};
                colorForest[] = {0,0,0,0};
                colorForestBorder[] ={0,0,0,0};
                colorRocks[] = {0,0,0,0};
                colorRocksBorder[] = {0,0,0,0};
                colorLevels[] = {0,0,0,0};
                colorMainCountlines[] = {0,0,0,0};
                colorCountlines[] = {0,0,0,0};
                colorMainCountlinesWater[] = {0,0,0,0};
                colorCountlinesWater[] = {0,0,0,0};
                colorPowerLines[] = {0,0,0,0};
                colorRailWay[] = {0,0,0,0};
                colorNames[] = {0,0,0,0};
                colorInactive[] = {0,0,0,0};
                colorText[] = {0,0,0,0};
                colorOutside[] = {0,0,0,0};
                colorTracks[] = {0,0,0,0};
                colorTracksFill[] = {0,0,0,0};
                colorRoads[] = {0,0,0,0};
                colorRoadsFill[] = {0,0,0,0};
                colorMainRoads[] = {0,0,0,0};
                colorMainRoadsFill[] = {0,0,0,0};
                colorGrid[] = {0,0,0,0};
                colorGridMap[] = {0,0,0,0};
                fontLabel = "RobotoCondensed";
                sizeExLabel = 0;
                fontGrid = "TahomaB";
                sizeExGrid = 0;
                fontUnits = "TahomaB";
                sizeExUnits = 0;
                fontNames = "EtelkaNarrowMediumPro";
                sizeExNames = 0;
                fontInfo = "RobotoCondensed";
                sizeExInfo = 0;
                fontLevel = "TahomaB";
                sizeExLevel = 0;
                class Legend {
                    x = 0;
                    y = 0;
                    w = 0;
                    h = 0;
                    font = "RobotoCondensed";
                    sizeEx = 0;
                    colorBackground[] = {0,0,0,0};
                    color[] = {0,0,0,0};
                };
                class Task {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    iconCreated = "#(argb,8,8,3)color(0,0,0,0)";
                    iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
                    iconDone = "#(argb,8,8,3)color(0,0,0,0)";
                    iconFailed = "#(argb,8,8,3)color(0,0,0,0)";
                    color[] = {0,0,0,0};
                    colorCreated[] = {0,0,0,0};
                    colorCanceled[] = {0,0,0,0};
                    colorDone[] = {0,0,0,0};
                    colorFailed[] = {0,0,0,0};
                    size = 0;
                    importance = 1;
                    coefMin = 0;
                    coefMax = 0;
                };
                class Waypoint {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class WaypointCompleted {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class CustomMark {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class Command {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class Bush {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class Rock {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class SmallTree {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class Tree {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class busstop {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class fuelstation {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class hospital {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class church {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class lighthouse {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class power {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class powersolar {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class powerwave {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class powerwind {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class quay {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class transmitter {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class watertower {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class Cross {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class Chapel {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class Shipwreck {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class Bunker {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class Fortress {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class Fountain {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class Ruin {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class Stack {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class Tourism {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class ViewTower {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
                class ActiveMarker {
                    icon = "#(argb,8,8,3)color(0,0,0,0)";
                    size = 0;
                    importance = 0;
                    coefMin = 0;
                    coefMax = 0;
                    color[] = {0,0,0,0};
                };
            };
            class tacticalHudRadarBackground: RscPicture {
                idc = IDC_TACTICALHUD_RADARBG;
                text = "";
                x = X_ORIGINAL((0 + X_TACTICALHUD_OFFSET));
                y = (safezoneY + safezoneH - (0 + Y_TACTICALHUD_OFFSET) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
                w = W_ORIGINAL(5);
                h = H_ORIGINAL(5);
            };
            class tacticalHudListOne: RscStructuredText {
                idc = IDC_TACTICALHUD_LISTONE;
                text = "";
                colorBackground[] = {0,0,0,0};
                x = X_ORIGINAL((5.5 + X_TACTICALHUD_OFFSET));
                y = (safezoneY + safezoneH - (0 + Y_TACTICALHUD_OFFSET) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
                w = W_ORIGINAL(6);
                h = H_ORIGINAL(8);
            };
            class tacticalHudListTwo: RscStructuredText {
                idc = IDC_TACTICALHUD_LISTTWO;
                text = "";
                colorBackground[] = {0,0,0,0};
                x = X_ORIGINAL((12 + X_TACTICALHUD_OFFSET));
                y = (safezoneY + safezoneH - (0 + Y_TACTICALHUD_OFFSET) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
                w = W_ORIGINAL(6);
                h = H_ORIGINAL(8);
            };
            class tacticalHudListThree: RscStructuredText {
                idc = IDC_TACTICALHUD_LISTTHREE;
                text = "";
                colorBackground[] = {0,0,0,0};
                x = X_ORIGINAL((18.5 + X_TACTICALHUD_OFFSET));
                y = (safezoneY + safezoneH - (0 + Y_TACTICALHUD_OFFSET) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
                w = W_ORIGINAL(6);
                h = H_ORIGINAL(8);
            };
        };
    };
};
