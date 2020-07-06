
class CfgLights {
    class Light_RedLaser {
        color[] = {1,0,0.025,1};
        ambient[] = {0,0,0,0};
        brightness = 1;
        intensity = 4000;
        drawLight = 0;
        class Attenuation {
            start = 0;
            constant = 1;
            linear = 0;
            quadratic = 40;
        };
        position[] = {0,0.2,0};
        diffuse[] = {0.1,0,0.0025};
    };
};
