class ACE_Medical_Injuries {
    class damageTypes {
        class bullet {
            // bullets only create multiple wounds when the damage is very high
            thresholds[] = {{20, 3}, {9, 2}, {4.5, 1}, {3, 1}, {0, 1}}; // {{20, 10}, {4.5, 2}, {3, 1}, {0, 1}};

            class Avulsion {
                weighting[] = {{12, 1}, {1.7, 0}, {0.35, 0}};
            };

            class VelocityWound {
                weighting[] = {{5, 1}, {1.5, 0}, {1.5, 1}, {0.35, 1}, {0.35, 0}};
            };
        };
    };
};
