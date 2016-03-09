class CfgGroups {
    class Empty {
        class arma3coop {
            name = "Kompozycje graczy Arma3Coop";
            class famas {
                name = "Famas";
                class fobpendleton {
                    name = "FOB Pendleton";
                    icon = "\a3\Ui_f\data\Map\VehicleIcons\iconVehicle_ca.paa";
                    side = 8;
                    #include "compositions\famas_fobpendleton.hpp"
                };
            };
            class wodzu {
                name = "Wodzu";
                class perlakujaw {
                    name = "Perla Kujaw";
                    icon = "\a3\Ui_f\data\Map\VehicleIcons\iconVehicle_ca.paa";
                    side = 8;
                    #include "compositions\wodzu_perlakujaw.hpp"
                };
            };
        };
    };
};
