
class CfgAmmo {
    class ammo_Bomb_LaserGuidedBase;
    class Bo_GBU12_LGB: ammo_Bomb_LaserGuidedBase {};
    class GVAR(manual_GBU12): Bo_GBU12_LGB {
        manualControl = 1;
        maxControlRange = 6000;
        missileManualControlCone = 120;
    };
};
