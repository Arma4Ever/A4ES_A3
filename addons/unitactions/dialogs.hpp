class RscPicture;
class RscStructuredText;

class RscTitles {
    class A3CS_RscDogtag {
        idd = -1;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2('A3CS_ctrlDogtag', (_this select 0) displayCtrl 2)]);
        movingEnable = false;
        duration = 5;
        fadeIn = 0.2;
        fadeOut = 0.2;
        name = "A3CS_RscDogtag";

        class controls {
            class DogtagBG: RscPicture {
                idc = 1;
                text = PATHTOF(data\dogtag.paa);
                SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0};
                x = ((safezoneX + safezoneW) - (10 *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40));
                y = safeZoneY + 0.175 * safezoneH;
                w = (8 *(((safezoneW / safezoneH) min 1.2) / 40));
                h = (4 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
                font = "EtelkaMonospacePro";
            };
            class DogtagName: RscStructuredText {
                idc = 2;
                text = "";
                SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0};
                x = ((safezoneX + safezoneW) - (8.4 *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40));
                y = safeZoneY + 0.2 * safezoneH;
                w = (5.9 *(((safezoneW / safezoneH) min 1.2) / 40));
                h = (4 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
                font = "EtelkaMonospacePro";
                class Attributes {
                    font = "EtelkaMonospacePro";
                    color = "#FFFFFF";
                    align = "center";
                    valign = "middle";
                    shadow = 1;
                    shadowColor = "#3f4345";
                    size = "0.85";
                };
            };
        };
    };
};
