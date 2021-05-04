class RscStructuredText;
class RscTitles {
    class GVAR(logsList) {
        idd = -1;
        movingEnable = 0;
        fadeIn = 0;
        fadeOut = 0;
        duration = 9.9999998e+010;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(logsList), _this select 0)]);
        class controls {
            class GVAR(logsListStructuredText): RscStructuredText {
            	idc = IDC_LOGSLIST;
            	x = 0.78 * safezoneW + safezoneX;
            	y = 0.29 * safezoneH + safezoneY;
            	w = 0.21 * safezoneW;
            	h = 0.61 * safezoneH;
            };
    	};
    };
};
