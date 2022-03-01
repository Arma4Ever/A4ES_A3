class CfgCloudlets {
    class Default;
    class GVAR(thermalEffect): Default {
        interval = 2; //0.001
        circleRadius = 0;
        circleVelocity[] = {0,0,0};
        particleShape = "\A3\data_f\ParticleEffects\Universal\Universal";
        particleFSNtieth = 16;
        particleFSIndex = 3;
        particleFSFrameCount = 1;
        particleFSLoop = 0;
        angleVar = 0.5;
        animationName = "";
        particleType = "Billboard";
        timerPeriod = 1;
        lifeTime = 0.05; //0.08
        moveVelocity[] = {"parentSpeedX","parentSpeedY","parentSpeedZ"};
        rotationVelocity = 1;
        weight = 1.275;
        volume = 1;
        rubbing = 0;
        size[] = {0.25,0.6};
        sizeCoef = 1;
        color[] = {{0.4,0.4,0.4,-2},{0.4,0.4,0.4,-1},{0.4,0.4,0.4,-0.6},{0.4,0.4,0.4,-0.4},{0.4,0.4,0.4,0}};
        colorCoef[] = {1,1,1,1};
        animationSpeed[] = {1000};
        animationSpeedCoef = 1;
        randomDirectionPeriod = 1;
        randomDirectionIntensity = 0;
        onTimerScript = "";
        beforeDestroyScript = "";
        lifeTimeVar = 0.1;
        position[] = {0,0,-1.35};
        positionVar[] = {0.05,0.05,0.05};
        MoveVelocityVar[] = {0.2,0.2,0.2};
        rotationVelocityVar = 20;
        sizeVar = 0.2;
        colorVar[] = {0,0,0,0};
        randomDirectionPeriodVar = 0;
        randomDirectionIntensityVar = 0;
    };
};
