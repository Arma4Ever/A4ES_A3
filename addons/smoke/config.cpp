#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_main", "a3cs_common"};
        version = A3CS_VERSION;
        versionStr = QUOTE(A3CS_VERSION);
        versionAr[] = A3CS_VERSION_ARRAY;
        author[] = {"SzwedzikPL", "ACE3 Team"};
        authorUrl = "http://arma3coop.pl";
    };
};

class CfgCloudlets {
    class Default;
    class SmokeShellWhite: Default {
        animationSpeedCoef = 1;
        colorCoef[] = {"colorR","colorG","colorB","colorA"};
        sizeCoef = 1;
        position[] = {0,0,0};
        interval = 0.018; //oryginal: 0.03 last: 0.01
        circleRadius = 0;
        circleVelocity[] = {0,0,0};
        particleShape = "\A3\data_f\ParticleEffects\Universal\Universal";
        particleFSNtieth = 16;
        particleFSIndex = 7;
        particleFSFrameCount = 48;
        particleFSLoop = 1;
        angleVar = 0.1;
        animationName = "";
        particleType = "Billboard";
        timerPeriod = 1;
        lifeTime = 21;
        moveVelocity[] = {0.01,0.32,0};
        rotationVelocity = 1;
        weight = 1.2777;
        volume = 1;
        rubbing = 0.12;
        size[] = {0.1,2,6};
        color[] = {{ 0.6,0.6,0.6,0.2 },{ 0.6,0.6,0.6,0.05 },{ 0.6,0.6,0.6,0 }};
        animationSpeed[] = {1.5,0.5};
        randomDirectionPeriod = 1;
        randomDirectionIntensity = 0.04;
        onTimerScript = "";
        beforeDestroyScript = "";
        destroyOnWaterSurface = 1;
        destroyOnWaterSurfaceOffset = -0.6;
        lifeTimeVar = 2;
        positionVar[] = {0,0,0};
        MoveVelocityVar[] = {0.25,0.25,0.25};
        rotationVelocityVar = 20;
        sizeVar = 0.5;
        colorVar[] = {0,0,0,0.35};
        randomDirectionPeriodVar = 0;
        randomDirectionIntensityVar = 0;
        blockAIVisibility=1;
    };
};
