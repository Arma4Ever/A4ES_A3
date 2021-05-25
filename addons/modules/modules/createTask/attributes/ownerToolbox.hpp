
class GVAR(createTask_ownerToolbox): GVAR(dynamicToolboxPicture) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 5;
            strings[] = {
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_custom_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa"
            };
            tooltips[] = {
                CSTRING(createTask_ownerToolbox_all),
                "BLUFOR",
                "OPFOR",
                "INDEP",
                "CIV"
            };
            values[] = {0, 1, 2, 3, 4};
        };
        class GVAR(description): GVAR(description) {};
    };
};
