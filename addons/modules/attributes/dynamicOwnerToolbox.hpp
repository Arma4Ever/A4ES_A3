
class GVAR(dynamicOwnerToolbox): GVAR(dynamicToolboxPicture) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns = 6;
            strings[] = {
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_custom_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa",
                QPATHTOF(data\attributes\dynamicOwnerToolbox_syncedUnits.paa)
            };
            tooltips[] = {
                CSTRING(dynamicOwnerToolbox_all),
                "BLUFOR",
                "OPFOR",
                "INDEP",
                "CIV",
                CSTRING(dynamicOwnerToolbox_syncedUnits)
            };
            values[] = {0, 1, 2, 3, 4, 5};
        };
        class GVAR(description): GVAR(description) {};
    };
};
