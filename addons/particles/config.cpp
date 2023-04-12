#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a4es_common",
            "A3_Data_F_ParticleEffects",
            "Blastcore_VEP"
        };
        author = ECSTRING(main,Author);
        authors[] = {"Zabuza", "SzwedzikPL", "ARK"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgCloudlets.hpp"
#include "CfgLights.hpp"

class HeavyBombExplosion {
	class ArtySmokeTrailLink;
	class LightExp;
	class BombExp1;
	class mk82_light;
	class MK82_Explosion_01;
	class MK82_Explosion_02;
	class explosion_glow_01;
	class mk82_glow;
};

class A4ES_VLSExplosion: HeavyBombExplosion {
	class ArtySmokeTrailLink: ArtySmokeTrailLink {
		intensity = 1.5;
		interval = 1;
		lifeTime = 0.2;
	};
	class LightExp: LightExp {
		simulation = "light";
		type = "ExploLightFastBig";
		position[] = {0, 0, 5};
		intensity = 1.4;
		interval = 1;
		lifeTime = 0.70000001;
	};
	class BombExp1: BombExp1 {
		intensity = 3;
		interval = 1;
		lifeTime = 0;
	};
	class mk82_light: mk82_light {
		intensity = 3;
		interval = 1;
		lifeTime = 0.70000001;
	};
	class MK82_Explosion_01: MK82_Explosion_01 {
		intensity = 3;
		interval = 1;
		lifeTime = 0.2;
		smokeGenMinDist = 1;
		smokeGenMaxDist = 1200;
		smokeSizeCoef = 0;
		smokeIntervalCoef = 0;
	};
	class MK82_Explosion_02: MK82_Explosion_02 {
		intensity = 3;
		interval = 1;
		lifeTime = 0.2;
		smokeGenMinDist = 1;
		smokeGenMaxDist = 1200;
		smokeSizeCoef = 0;
		smokeIntervalCoef = 0;
	};
	class explosion_glow_01: explosion_glow_01 {
		intensity = 3;
		interval = 1;
		lifeTime = 0.70000001;
		smokeGenMinDist = 1;
		smokeGenMaxDist = 1200;
		smokeSizeCoef = 0;
		smokeIntervalCoef = 0;
	};
	class mk82_glow: mk82_glow {
		intensity = 3;
		interval = 1;
		lifeTime = 0.70000001;
		smokeGenMinDist = 1;
		smokeGenMaxDist = 1200;
		smokeSizeCoef = 0;
		smokeIntervalCoef = 0;
	};
};