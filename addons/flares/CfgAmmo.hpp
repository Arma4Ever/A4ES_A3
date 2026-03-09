class CfgAmmo {
    class FlareCore;
    class FlareBase: FlareCore {};

    class F_40mm_White: FlareBase {
        intensity = 500000; // 10000
        timeToLive = 50; // 25
        coefGravity = 0.2; // 1
    };

    class Flare_82mm_AMOS_White: FlareCore {
        intensity = 150000; // 10000
    };
};