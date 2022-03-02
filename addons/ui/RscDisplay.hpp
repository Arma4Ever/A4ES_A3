class RscControlsGroup;
class RscHTML;
class RscText;

class RscDisplayDiary {
    class Controls {
        class CA_ContentBackgroundd : RscText {
            w = "32 * (((safezoneW / safezoneH) min 1.2) / 40)";
            // "21.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class CA_DiaryGroup : RscControlsGroup {
            w = "32 * (((safezoneW / safezoneH) min 1.2) / 40)";
            class controls {
                class CA_Diary : RscHTML {
                    w = "29 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    // "20.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
            };
        };
    };
};

class RscDisplayMainMap {
    class controls {
        class CA_ContentBackgroundd : RscText {
            w = "32 * (((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class CA_DiaryGroup : RscControlsGroup {
            w = "32 * (((safezoneW / safezoneH) min 1.2) / 40)";
            class controls {
                class CA_Diary : RscHTML {
                    w = "29 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
            };
        };
    };
};

class RscDisplayGetReady : RscDisplayMainMap {
    class controls {
        class CA_ContentBackgroundd : RscText {
            w = "32 * (((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class CA_DiaryGroup : RscControlsGroup {
            w = "32 * (((safezoneW / safezoneH) min 1.2) / 40)";
            class controls {
                class CA_Diary : RscHTML {
                    w = "29 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
            };
        };
    };
};

class RscDisplayServerGetReady : RscDisplayGetReady {
    class controls {
        class CA_ContentBackgroundd : RscText {
            w = "32 * (((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class CA_DiaryGroup : RscControlsGroup {
            w = "32 * (((safezoneW / safezoneH) min 1.2) / 40)";
            class controls {
                class CA_Diary : RscHTML {
                    w = "29 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
            };
        };
    };
};

class RscDisplayClientGetReady : RscDisplayGetReady {
    class controls {
        class CA_ContentBackgroundd : RscText {
            w = "32 * (((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class CA_DiaryGroup : RscControlsGroup {
            w = "32 * (((safezoneW / safezoneH) min 1.2) / 40)";
            class controls {
                class CA_Diary : RscHTML {
                    w = "29 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
            };
        };
    };
};
