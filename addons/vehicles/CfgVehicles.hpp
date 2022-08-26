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
    class A3CS_Plane_Su35: O_Plane_Fighter_02_F {
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
    class A3CS_Plane_J10: I_Plane_Fighter_04_F {
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
    class A3CS_Plane_Jak135: O_Plane_CAS_02_dynamicLoadout_F {
        maxSpeed = 1100;
        acceleration=200;
        displayName="Jak-135";
    };
};
