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
};
