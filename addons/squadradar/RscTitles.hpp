class RscMapControlEmpty;
class RscControlsGroupNoScrollbars;

class RscTitles {
    class GVAR(RscRadar) {
        idd = -1;
        movingEnable = 1;
        enableSimulation = 1;
        enableDisplay = 1;
        duration = 1e+011;
        fadein = 0;
        fadeout = 0;
        onLoad = QUOTE(_this call FUNC(handleRscRadarLoad););
        onUnload = QUOTE(_this call FUNC(handleRscRadarUnload););

        class ControlsBackground {
            class radar {
                idc = IDC_RSCRADAR_RADARBG;
                moving = 1;
                type = 0;
                style = 48;
                x = "0.5 - (pixelW * 64)";
                y = "safeZoneY + safeZoneH - (pixelH * 138)";
                w = "pixelW * 128";
                h = "pixelH * 128";
                font = "EtelkaNarrowMediumPro";
                sizeEx = 1;
                colorBackground[] = {0, 0, 0, 0};
                colorText[] = {1, 1, 1, 1};
                text = "";
                lineSpacing = 1;
            };
        };

        class Controls {
            class radar: RscMapControlEmpty {
                idc = IDC_RSCRADAR_RADAR;
                type = 101;
                x = "0.5 - (pixelW * 64)";
                y = "safeZoneY + safeZoneH - (pixelH * 138)";
                w = "pixelW * 128";
                h = "pixelH * 128";
                text = "#(argb,8,8,3)color(0,0,0,0)";

                #include "MapProperties.hpp"
            };

            class memberlist: RscControlsGroupNoScrollbars {
                idc = IDC_RSCRADAR_MEMBERLIST;
                x = "0.5 + (pixelW * 64)";
                y = "safeZoneY + safeZoneH - (pixelH * 138)";
                w = "(safeZoneW / 2) - (pixelW * 64)";
                h = "pixelH * 128";
                shadow = 0;
            };
        };
    };
};
