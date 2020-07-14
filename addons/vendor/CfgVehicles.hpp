class CfgVehicles {
	class Tank_F;
	class vurtual_seat: Tank_F {
		displayName = "Seat";
        ace_cookoff_probability = 0;
        class CargoTurret;
		class Turrets {
			class MainTurret: CargoTurret {
				gunnerName = "Cargo";
			};
		};
	};
	class weapon_bag_base;
	class vurtual_stretcher_bag: weapon_bag_base {
        scope = 1;
        scopeCurator = 0;
        scopeArsenal = 0;
        ace_cookoff_probability = 0;
	};
	class vurtual_foxhole: vurtual_seat {
        ace_cookoff_probability = 0;
		class EventHandlers {
			init = "";
		};
	};
	class vurtual_stretcher: vurtual_seat {
        ace_cookoff_probability = 0;
		class EventHandlers {
			init = "";
		};
	};

    class Ship_F;
    class House_F;
    class staticMGWeapon;
    class vurtual_ship_base: Ship_F {
        ace_cookoff_probability = 0;
    };
    class vurtual_ship: vurtual_ship_base {
        ace_cookoff_probability = 0;
    };
    class vurtual_ship_aaf: vurtual_ship {
        ace_cookoff_probability = 0;
    };
    class vurtual_ship_csat: vurtual_ship {
        ace_cookoff_probability = 0;
    };
    class vurtual_ship_big: vurtual_ship_base {
        ace_cookoff_probability = 0;
    };
    class vurtual_destroyer: vurtual_ship_base {
        ace_cookoff_probability = 0;
    };
    class vurtual_destroyer_aaf: vurtual_destroyer {
        ace_cookoff_probability = 0;
    };
    class vurtual_destroyer_csat: vurtual_destroyer {
        ace_cookoff_probability = 0;
    };
    class vurtual_ship_hull_big1: House_F  {
        ace_cookoff_probability = 0;
    };
    class vurtual_ship_hull_big2: vurtual_ship_hull_big1 {
        ace_cookoff_probability = 0;
    };
    class vurtual_ship_hull_big3: vurtual_ship_hull_big1 {
        ace_cookoff_probability = 0;
    };
    class vurtual_ship_hull_door: vurtual_ship_hull_big1 {
        ace_cookoff_probability = 0;
    };
    class vurtual_ship_hull_hollow: vurtual_ship_hull_big1 {
        ace_cookoff_probability = 0;
    };
    class vurtual_destroyer_hull_p0: vurtual_ship_hull_big1 {
        ace_cookoff_probability = 0;
    };
    class vurtual_destroyer_hull_p1: vurtual_ship_hull_big1 {
        ace_cookoff_probability = 0;
    };
    class vurtual_destroyer_hull_p2: vurtual_ship_hull_big1 {
        ace_cookoff_probability = 0;
    };
    class vurtual_destroyer_hull_p3: vurtual_ship_hull_big1 {
        ace_cookoff_probability = 0;
    };
    class vurtual_crane: Tank_F {
        ace_cookoff_probability = 0;
    };
    class vurtual_ship_armed_base: vurtual_ship_base {
        ace_cookoff_probability = 0;
    };
    class vurtual_ship_armed: vurtual_ship_armed_base {
        ace_cookoff_probability = 0;
    };
    class vurtual_ship_armed_aaf: vurtual_ship_armed {
        ace_cookoff_probability = 0;
    };
    class vurtual_ship_armed_csat: vurtual_ship_armed {
        ace_cookoff_probability = 0;
    };
    class vurtual_shipturret_base: staticMGWeapon {
        ace_cookoff_probability = 0;
    };
    class vurtual_shipturret_mk45_base: vurtual_shipturret_base {
        ace_cookoff_probability = 0;
    };
    class vurtual_shipturret_m242_base: vurtual_shipturret_base {
        ace_cookoff_probability = 0;
    };
    class vurtual_shipturret_mk41_base: vurtual_shipturret_base {
        ace_cookoff_probability = 0;
    };
    class vurtual_shipturret_mk41: vurtual_shipturret_mk41_base {
        ace_cookoff_probability = 0;
    };
};
