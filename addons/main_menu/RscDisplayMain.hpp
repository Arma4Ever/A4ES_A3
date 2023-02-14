
class RscDisplayMain: RscStandardDisplay {
    // delete all Spotlights added directly to the display. (only saw it in WS CDLC so far)
    delete Spotlight;

    class Controls {
        delete Spotlight1;
        delete Spotlight2;
        delete Spotlight3;
        delete SpotlightPrev;
        delete SpotlightNext;
        delete BackgroundSpotlight;
        delete BackgroundSpotlightLeft;
        delete BackgroundSpotlightRight;

        class A4ES_BackgroundSpotlight: RscPicture {
            text = "#(argb,8,8,3)color(1,1,1,1)";
            colorText[] = {0, 0, 0, 0.89999998};
            x = "0.5 - (1.5 * 10) * (pixelW * pixelGridNoUIScale * 2) - 2 * (2 * pixelW)";
            y = "0.5 - (10 / 2) * (pixelH * pixelGridNoUIScale * 2) - (2 * pixelH)";
            w = "3 * 10 * (pixelW * pixelGridNoUIScale * 2) + 4 * (2 * pixelW)";
            h = "(10) * (pixelH * pixelGridNoUIScale * 2) + 2 * (2 * pixelH)";
        };
        class A4ES_BackgroundSpotlightLeft: A4ES_BackgroundSpotlight {
            text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\gradient_ca.paa";
            angle = 180;
            x = "safezoneX";
            w = "(safezoneW - (3 * 10 * (pixelW * pixelGridNoUIScale * 2) + 4 * (2 * pixelW))) / 2";
        };
        class A4ES_BackgroundSpotlightRight: A4ES_BackgroundSpotlightLeft {
            text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\gradient_ca.paa";
            angle = 0;
            x = "0.5 + (1.5 * 10) * (pixelW * pixelGridNoUIScale * 2) + 2 * (2 * pixelW)";
        };
        class A4ES_Spotlight1: RscMainMenuSpotlight {
            idc = 71021;
            x = "0.5 - (1.5 * 10) * (pixelW * pixelGridNoUIScale * 2) - (2 * pixelW)";
            class Controls: Controls {
                class GroupPicture: GroupPicture {
                    class Controls: Controls {
                        class Picture: Picture {
                            text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\spotlight_2_ca.paa";
                        };
                        class Video: Video {
                            text = "\a3\Ui_f\Video\spotlight_2.ogv";
                        };
                    };
                };
                class GroupHover: GroupHover {
                    class Controls: Controls {
                        class Overlay: Overlay {};
                        class LineLeft: LineLeft {};
                        class LineRight: LineRight {};
                        class LineTop: LineTop {
                            text = "Dołącz na serwer Arma4Ever";
                        };
                        class LineBottom: LineBottom {};
                    };
                };
                class TextBackground: TextBackground {};
                class Text: Text {
                    text = "DOŁĄCZ";
                };
                class Button: Button {};
            };
        };
        class A4ES_Spotlight2: RscControlsGroupNoScrollbars {
            idc = 71020;
            x = "0.5 - (0.5 * 10) * (pixelW * pixelGridNoUIScale * 2)";
            y = "0.5 - (10 / 2) * (pixelH * pixelGridNoUIScale * 2)";
            w = "10 * (pixelW * pixelGridNoUIScale * 2)";
            h = "10 * (pixelH * pixelGridNoUIScale * 2)";
            
            class Controls {
                class Picture: RscPictureKeepAspect {
                    idc = 1023;
                    text = QPATHTOF(data\spotlight_info_error_ca.paa);
                    x = 0;
                    y = 0;
                    w = "10 * (pixelW * pixelGridNoUIScale * 2)";
                    h = "10 * (pixelH * pixelGridNoUIScale * 2)";
                };
                class Text: RscStructuredText {
                    idc = 1028;
                    size = "1.00 * (pixelH * pixelGridNoUIScale * 2)";
                    shadow = 0;
                    x = 0;
                    y = 0;
                    w = "10 * (pixelW * pixelGridNoUIScale * 2)";
                    h = "10 * (pixelH * pixelGridNoUIScale * 2)";
                    class Attributes {
                        align = "center";
                        color = "#ffffff";
                        font = "PuristaBold";
                    };
                };
            };
        };
        class A4ES_Spotlight3: RscMainMenuSpotlight {
            idc = 71022;
            x = "0.5 + (0.5 * 10) * (pixelW * pixelGridNoUIScale * 2) + (2 * pixelW)";
            class Controls: Controls {
                class GroupPicture: GroupPicture {
                    class Controls: Controls {
                        class Picture: Picture {
                            text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\spotlight_3_ca.paa";
                        };
                        class Video: Video {
                            text = "\a3\Ui_f\Video\spotlight3.ogv";
                        };
                    };
                };
                class GroupHover: GroupHover {
                    class Controls: Controls {
                        class Overlay: Overlay {};
                        class LineLeft: LineLeft {};
                        class LineRight: LineRight {};
                        class LineTop: LineTop {
                            text = "Stwórz scenariusz";
                        };
                        class LineBottom: LineBottom {};
                    };
                };
                class TextBackground: TextBackground {};
                class Text: Text {
                    text = "EDYTOR";
                };
                class Button: Button {};
            };
        };
    };
};
