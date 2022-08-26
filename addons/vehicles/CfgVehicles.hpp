class CfgVehicles {
    class Plane_Fighter_01_Base_F;
    class B_Plane_Fighter_01_Stealth_F: Plane_Fighter_01_Base_F {
        radarTargetSize = 0.2; // 0.4
    };

    class Plane_Fighter_02_Base_F;
    class O_Plane_Fighter_02_Stealth_F: Plane_Fighter_02_Base_F {
        radarTargetSize = 0.3; // 0.6
    };

    class Heli_Attack_01_base_F;
    class Heli_Attack_01_dynamicLoadout_base_F: Heli_Attack_01_base_F {
        radarTargetSize = 0.3; // 0.7;
    };

    class O_Plane_Fighter_02_F;
    class A3CS_Plane_Su35: O_Plane_Fighter_02_F
  	{
  		maxSpeed = 1145;
      displayName="Su-35";
      hiddenSelectionsTextures[]=
      {
        "a3\air_f_jets\plane_fighter_02\data\Fighter_02_fuselage_01_Blue_co.paa",
        "a3\air_f_jets\plane_fighter_02\data\Fighter_02_fuselage_02_Blue_co.paa",
        "a3\air_f_jets\plane_fighter_02\data\Fighter_02_fuselage_01_Blue_co.paa",
        "a3\air_f_jets\plane_fighter_02\data\Numbers\Fighter_02_number_02_co.paa",
        "a3\air_f_jets\plane_fighter_02\data\Numbers\Fighter_02_number_00_co.paa",
        "a3\air_f_jets\plane_fighter_02\data\Numbers\Fighter_02_number_01_co.paa"
      };
    };

    class I_Plane_Fighter_04_F;
    class A3CS_Plane_J10: I_Plane_Fighter_04_F
  	{
      maxSpeed = 1200;
      displayName="J-10";
      acceleration=210;
      hiddenSelectionsTextures[]=
      {
        "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_01_co.paa",
        "a3\air_f_jets\plane_fighter_04\data\Fighter_04_fuselage_02_co.paa",
        "a3\air_f_jets\plane_fighter_04\data\fighter_04_misc_01_co.paa",
        "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
        "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_04_ca.paa",
        "a3\air_f_jets\plane_fighter_04\data\Numbers\Fighter_04_number_08_ca.paa"
      };
    };

    class O_Plane_CAS_02_dynamicLoadout_F;
    class A3CS_Plane_Jak135: O_Plane_CAS_02_dynamicLoadout_F
  	{
      maxSpeed = 1100;
      acceleration=200;
      displayName="Jak-135";
    };

    class CUP_O_Su25_Dyn_CSAT_T;
    class A3CS_Su25SM3: CUP_O_Su25_Dyn_CSAT_T
  	{
      displayName="Su-25SM3";
      faction="OPF_F";
  		crew="O_Pilot_F";
      hiddenSelectionsTextures[]=
  		{
        "\CUP\AirVehicles\CUP_AirVehicles_Su25\data\textures\su25_body1_sla1_co.paa",
        "\CUP\AirVehicles\CUP_AirVehicles_Su25\data\textures\su25_body2_sla1_co.paa"
  		};
      weapons[] =
  		{
  			"CUP_Vacannon_GSh302K_veh",
        "Laserdesignator_pilotCamera",
  			"CMFlareLauncher"
  		};
      magazines[] =
  		{
  			"CUP_250Rnd_TE1_30mm_GSh302K_HE_M",
  			"Laserbatteries",
  			"240Rnd_CMFlare_Chaff_Magazine"
  		};
      class pilotCamera
      {
        class OpticsIn
        {
          class Wide
          {
            opticsDisplayName="WFOV";
            initAngleX=0;
            minAngleX=0;
            maxAngleX=0;
            initAngleY=0;
            minAngleY=0;
            maxAngleY=0;
            initFov="(75 / 120)";
            minFov="(75 / 120)";
            maxFov="(75 / 120)";
            directionStabilized=1;
            visionMode[] = {"Normal", "Ti"};
            thermalMode[]={0,1};
            gunnerOpticsModel="\A3\Drones_F\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_wide_F.p3d";
            opticsPPEffects[] = {"OpticsCHAbera2", "OpticsBlur2"};
          };
          class Medium: Wide
          {
            opticsDisplayName="MFOV";
            initFov="(15 / 120)";
            minFov="(15 / 120)";
            maxFov="(15 / 120)";
            gunnerOpticsModel="\A3\Drones_F\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_medium_F.p3d";
          };
          class Narrow: Wide
          {
            opticsDisplayName="NFOV";
            initFov="(3.75 / 120)";
            minFov="(3.75 / 120)";
            maxFov="(3.75 / 120)";
            gunnerOpticsModel="\A3\Drones_F\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_narrow_F.p3d";
          };
        };
      minTurn = -160;
			maxTurn = 160;
			initTurn = 0;
			minElev = -10;
			maxElev = 90;
			initElev = 0;
			maxXRotSpeed = 0.3;
			maxYRotSpeed = 0.3;
			pilotOpticsShowCursor = 1;
			controllable = 1;
      };
      memoryPointDriverOptics = "positionlight_red_1_pos";
    };
};
