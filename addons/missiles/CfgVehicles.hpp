class CfgVehicles {
    class LandVehicle;
	class Tank: LandVehicle {
		class NewTurret;
		class Sounds;
		class HitPoints;
	};
	class Tank_F: Tank {
		class Turrets {
			class MainTurret: NewTurret {};
		};
        class AnimationSources;
	};
    class MBT_01_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class AnimationSources: AnimationSources {};
    };
    class MBT_01_mlrs_base_F: MBT_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class AnimationSources: AnimationSources {
            class Missiles_revolving;
            class muzzle_hide_missiles;
        };
	};
	class B_MBT_01_mlrs_base_F: MBT_01_mlrs_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class AnimationSources: AnimationSources {
			class Missiles_revolving: Missiles_revolving {};
			class muzzle_hide_missiles: muzzle_hide_missiles {};
		};
	};
	class B_MBT_01_mlrs_F: B_MBT_01_mlrs_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class AnimationSources: AnimationSources {
			class Missiles_revolving: Missiles_revolving {};
			class muzzle_hide_missiles: muzzle_hide_missiles {};
		};
	};
    class B_MBT_01_mlrs_ATACMS_F: B_MBT_01_mlrs_F {
        displayName = "ATACMS";

        class Turrets: Turrets {
			class MainTurret: MainTurret {
				weapons[]= {QGVAR(ATACMS_launcher)};
				magazines[]= {QGVAR(2Rnd_ATACMS_rockets)};
			};
		};
        class AnimationSources: AnimationSources {
            class Missiles_revolving: Missiles_revolving {
                source = "revolving";
                weapon = QGVAR(ATACMS_launcher);
            };
            class muzzle_hide_missiles: muzzle_hide_missiles {
                source = "reload";
                weapon = QGVAR(ATACMS_launcher);
            };
        };
    };
};
