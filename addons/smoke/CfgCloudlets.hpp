class CfgCloudlets {
    class Default;

    class SmokeShellWhiteSmall;
    class GVAR(SmokeShellWhiteFilled): SmokeShellWhiteSmall {
        animationSpeedCoef = 0.75; //default 1
        colorCoef[] = {"colorR", "colorG", "colorB", 3}; //default 1.8
        sizeCoef = 2; //default 1
        interval = 0.125; //default 0.2
        lifeTime = 24; //default 14
        moveVelocity[] = {0,0.1,0}; //default {0,0.3,0}
        weight = 6.4; //default 1.26
        volume = 5; //default 1
        blockAIVisibility = 1;
    };

    class ObjectDestructionSmoke: Default {
        interval = 0.25; //0.18
    };
    class ObjectDestructionSmoke1_2: Default {
        interval = 0.29; //0.22
    };
    class ObjectDestructionSmokeSmall: Default {
        interval = 0.19; //0.12
    };
    class ObjectDestructionSmokeSmallx: Default {
        interval = 0.19; //0.12
    };
    class ObjectDestructionSmoke1_2Small: Default {
        interval = 0.24; //0.16
    };
    class ObjectDestructionSmoke1_2Smallx: Default {
        interval = 0.25; //0.16
    };
    class ObjectDestructionSmoke2: Default {
        interval = 0.1; //0.04
    };
};
