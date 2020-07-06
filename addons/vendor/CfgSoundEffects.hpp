
class CfgSoundEffects {
    class WeaponsEffects {
        class Default;
        class DefaultDMRLaser {
            class Begin: Default {};
            class Middle: Default {
                distance = 100;
                frequency = 0.9;
                gain[] = {1,1,0.39810717,0.25118864};
                threshold = 0.1;
                ratio = 0.1;
                attack = 0;
            };
            class End: Default {
                distance = 200;
                frequency = 0.85;
                gain[] = {1,0.56234133,0.12589253,0.12589253};
                threshold = 0.1;
                ratio = 0.1;
                attack = 0;
            };
        };
    };
};
