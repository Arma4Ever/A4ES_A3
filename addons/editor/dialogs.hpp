class RscStandardDisplay;
class ctrlMenuStrip;

//Disable Editor 2D Button
class RscDisplaySelectIsland: RscStandardDisplay {
    class Controls {
        delete ButtonContinue3D;
    };
};

//Disable AttributesGarbageCollection
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
};
