class CfgWeapons {
    class SmokeLauncher;
    class CMFlareLauncher: SmokeLauncher {
        modes[] = {"Burst", "Single", "AIBurst", "Timed", "AITimed", "LongTimed"};

        class Single;
        class Burst;

        class Timed: Single {
            displayName = "Timed";
            burst = 8;
            reloadTime = 1.3;
        };
        class AITimed: Timed {
            showToPlayer = 0;
            minRange = 0;
            maxRange = 3000;
        };
        class LongTimed: Single {
            displayName = "Timed 16f/4s";
            burst = 8;
            reloadTime = 4;
        };
    };
};
