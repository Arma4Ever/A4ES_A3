class RscDisplayStart: RscStandardDisplay
{
    class controlsBackground
    {
        class Black: RscText
        {
            colorBackground[] = {0,0,0,1};
            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneWAbs";
            h = "safezoneH";
        };
        class Map: RscPicture
        {
            idc = 999;
            text = "#(argb,8,8,3)color(0,0,0,1)";
            colorText[] = {1,1,1,0.42};
            x = "safezoneX";
            y = "safezoneY - (safezoneW * 4/3) / 4";
            w = "safezoneW";
            h = "safezoneW * 4/3";
        };
        class CA_Vignette: RscVignette
        {
            colorText[] = {0,0,0,1};
        };
        class Noise: RscPicture
        {
            text = "\A3\Ui_f\data\GUI\Cfg\LoadingScreens\LoadingNoise_ca.paa";
            colorText[] = {1,1,1,1};
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
    };
    class controls
    {
        class LoadingStart: RscControlsGroupNoScrollbars
        {
            idc = 2310;
            x = "0 * safezoneW + safezoneX";
            y = "0 * safezoneH + safezoneY";
            w = "1 * safezoneW";
            h = "1 * safezoneH";
            class controls
            {
                class Black: RscText
                {
                    idc = 1000;
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                    colorBackground[] = {0,0,0,1};
                };
                class Noise: RscPicture
                {
                    idc = 1201;
                    text = "\A3\Ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                };
                class Logo: RscPictureKeepAspect
                {
                    idc = 1200;
                    text = PATHTOF(data\a3c_splash_logo.paa);
                    x = "0.25 * safezoneW";
                    y = "0.3125 * safezoneH";
                    w = "0.5 * safezoneW";
                    h = "0.25 * safezoneH";
                };

                class Logo_a3: RscPictureKeepAspect
                {
                    idc = 1207;
                    text = "\A3\Ui_f\data\Logos\arma3_expansion_ca.paa";
                    x = "(1 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_bi: RscPictureKeepAspect
                {
                    idc = 1208;
                    text = "\A3\Ui_f\data\Logos\bi_white_ca.paa";
                    x = "(12 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_a3cs: RscPictureKeepAspect
                {
                    idc = 1209;
                    text = PATHTOF(data\a3cs_logo.paa);
                    x = "1 * safezoneW - (21 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_pam: RscPictureKeepAspect
                {
                    idc = 1210;
                    text = PATHTOF(data\pam_logo.paa);
                    x = "1 * safezoneW - (11 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
            };
        };
    };
};
class RscDisplayLoadMission: RscStandardDisplay
{
    class controlsBackground
    {
        class Black: RscText
        {
            colorBackground[] = {0,0,0,1};
            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneWAbs";
            h = "safezoneH";
        };
        class Map: RscPicture
        {
            idc = 999;
            text = "#(argb,8,8,3)color(0,0,0,1)";
            colorText[] = {1,1,1,0.42};
            x = "safezoneX";
            y = "safezoneY - (safezoneW * 4/3) / 4";
            w = "safezoneW";
            h = "safezoneW * 4/3";
        };
        class CA_Vignette: RscVignette
        {
            colorText[] = {0,0,0,1};
        };
        class Noise: RscPicture
        {
            text = "\A3\Ui_f\data\GUI\Cfg\LoadingScreens\LoadingNoise_ca.paa";
            colorText[] = {1,1,1,1};
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
    };
    class controls
    {
        class LoadingStart: RscControlsGroupNoScrollbars
        {
            idc = 2310;
            x = "0 * safezoneW + safezoneX";
            y = "0 * safezoneH + safezoneY";
            w = "1 * safezoneW";
            h = "1 * safezoneH";
            class controls
            {
                class Black: RscText
                {
                    idc = 1000;
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                    colorBackground[] = {0,0,0,1};
                };
                class Noise: RscPicture
                {
                    idc = 1201;
                    text = "\A3\Ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                };
                class Logo: RscPictureKeepAspect
                {
                    idc = 1200;
                    text = PATHTOF(data\a3c_splash_logo.paa);
                    x = "0.25 * safezoneW";
                    y = "0.3125 * safezoneH";
                    w = "0.5 * safezoneW";
                    h = "0.25 * safezoneH";
                };

                class Logo_a3: RscPictureKeepAspect
                {
                    idc = 1207;
                    text = "\A3\Ui_f\data\Logos\arma3_expansion_ca.paa";
                    x = "(1 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_bi: RscPictureKeepAspect
                {
                    idc = 1208;
                    text = "\A3\Ui_f\data\Logos\bi_white_ca.paa";
                    x = "(12 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_a3cs: RscPictureKeepAspect
                {
                    idc = 1209;
                    text = PATHTOF(data\a3cs_logo.paa);
                    x = "1 * safezoneW - (21 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_pam: RscPictureKeepAspect
                {
                    idc = 1210;
                    text = PATHTOF(data\pam_logo.paa);
                    x = "1 * safezoneW - (11 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
            };
        };
    };
};
class RscDisplayNotFreeze: RscStandardDisplay
{
    class controlsBackground
    {
        class Black: RscText
        {
            colorBackground[] = {0,0,0,1};
            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneWAbs";
            h = "safezoneH";
        };
        class Map: RscPicture
        {
            idc = 999;
            text = "#(argb,8,8,3)color(0,0,0,1)";
            colorText[] = {1,1,1,0.42};
            x = "safezoneX";
            y = "safezoneY - (safezoneW * 4/3) / 4";
            w = "safezoneW";
            h = "safezoneW * 4/3";
        };
        class CA_Vignette: RscVignette
        {
            colorText[] = {0,0,0,1};
        };
        class Noise: RscPicture
        {
            text = "\A3\Ui_f\data\GUI\Cfg\LoadingScreens\LoadingNoise_ca.paa";
            colorText[] = {1,1,1,1};
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
    };
    class controls
    {
        class LoadingStart: RscControlsGroupNoScrollbars
        {
            idc = 2310;
            x = "0 * safezoneW + safezoneX";
            y = "0 * safezoneH + safezoneY";
            w = "1 * safezoneW";
            h = "1 * safezoneH";
            class controls
            {
                class Black: RscText
                {
                    idc = 1000;
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                    colorBackground[] = {0,0,0,1};
                };
                class Noise: RscPicture
                {
                    idc = 1201;
                    text = "\A3\Ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                };
                class Logo: RscPictureKeepAspect
                {
                    idc = 1200;
                    text = PATHTOF(data\a3c_splash_logo.paa);
                    x = "0.25 * safezoneW";
                    y = "0.3125 * safezoneH";
                    w = "0.5 * safezoneW";
                    h = "0.25 * safezoneH";
                };

                class Logo_a3: RscPictureKeepAspect
                {
                    idc = 1207;
                    text = "\A3\Ui_f\data\Logos\arma3_expansion_ca.paa";
                    x = "(1 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_bi: RscPictureKeepAspect
                {
                    idc = 1208;
                    text = "\A3\Ui_f\data\Logos\bi_white_ca.paa";
                    x = "(12 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_a3cs: RscPictureKeepAspect
                {
                    idc = 1209;
                    text = PATHTOF(data\a3cs_logo.paa);
                    x = "1 * safezoneW - (21 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_pam: RscPictureKeepAspect
                {
                    idc = 1210;
                    text = PATHTOF(data\pam_logo.paa);
                    x = "1 * safezoneW - (11 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
            };
        };
    };
};
class RscDisplayClient: RscStandardDisplay
{
    class controlsBackground
    {
        class Black: RscText
        {
            colorBackground[] = {0,0,0,1};
            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneWAbs";
            h = "safezoneH";
        };
        class Map: RscPicture
        {
            idc = 999;
            text = "#(argb,8,8,3)color(0,0,0,1)";
            colorText[] = {1,1,1,0.42};
            x = "safezoneX";
            y = "safezoneY - (safezoneW * 4/3) / 4";
            w = "safezoneW";
            h = "safezoneW * 4/3";
        };
        class CA_Vignette: RscVignette
        {
            colorText[] = {0,0,0,1};
        };
        class Noise: RscPicture
        {
            text = "\A3\Ui_f\data\GUI\Cfg\LoadingScreens\LoadingNoise_ca.paa";
            colorText[] = {1,1,1,1};
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
    };
    class controls
    {
        class LoadingStart: RscControlsGroupNoScrollbars
        {
            idc = 2310;
            x = "0 * safezoneW + safezoneX";
            y = "0 * safezoneH + safezoneY";
            w = "1 * safezoneW";
            h = "1 * safezoneH";
            class controls
            {
                class Black: RscText
                {
                    idc = 1000;
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                    colorBackground[] = {0,0,0,1};
                };
                class Noise: RscPicture
                {
                    idc = 1201;
                    text = "\A3\Ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                };
                class Logo: RscPictureKeepAspect
                {
                    idc = 1200;
                    text = PATHTOF(data\a3c_splash_logo.paa);
                    x = "0.25 * safezoneW";
                    y = "0.3125 * safezoneH";
                    w = "0.5 * safezoneW";
                    h = "0.25 * safezoneH";
                };

                class Logo_a3: RscPictureKeepAspect
                {
                    idc = 1207;
                    text = "\A3\Ui_f\data\Logos\arma3_expansion_ca.paa";
                    x = "(1 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_bi: RscPictureKeepAspect
                {
                    idc = 1208;
                    text = "\A3\Ui_f\data\Logos\bi_white_ca.paa";
                    x = "(12 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_a3cs: RscPictureKeepAspect
                {
                    idc = 1209;
                    text = PATHTOF(data\a3cs_logo.paa);
                    x = "1 * safezoneW - (21 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_pam: RscPictureKeepAspect
                {
                    idc = 1210;
                    text = PATHTOF(data\pam_logo.paa);
                    x = "1 * safezoneW - (11 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
            };
        };
    };
};