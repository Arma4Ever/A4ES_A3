
class GVAR(dynamicToolboxSide): GVAR(dynamicToolboxPicture) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 3;
            strings[] = {
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa"
            };
            tooltips[] = {
                "BLUFOR",
                "OPFOR",
                "INDEP"
            };
            values[] = {0, 1, 2};
        };
        class GVAR(description): GVAR(description) {};
    };
};

class GVAR(dynamicToolboxSideFull): GVAR(dynamicToolboxPicture) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 4;
            strings[] = {
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa"
            };
            tooltips[] = {
                "BLUFOR",
                "OPFOR",
                "INDEP",
                "CIV"
            };
            values[] = {0, 1, 2, 3};
        };
        class GVAR(description): GVAR(description) {};
    };
};
