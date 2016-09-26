class CfgMovesFatigue {
    //Reference https://community.bistudio.com/wiki/CfgMovesFatigue
    staminaDuration = 260;//(default 60) total amount of stamina
    staminaCooldown = 5; //(default 10) when you run out of stamina the sprinting is disabled for this duration
    staminaRestoration = 15; //(default 30) time required for your current stamina pool (total stamina - inventory load) to restore
    aimPrecisionSpeedCoef = 0;  //(default 5) aimPrecision adjusting rate coefficient
    terrainDrainSprint = 0;  //(default -1) when terrain gradient disable sprint, this stamina value is added to every animation state
    terrainDrainRun = 0;  //(default -1) when terrain gradient enable force walk, this stamina value is added to every animation state
    terrainSpeedCoef = 1;  //(default 0.9) when terrain gradient disable sprint, animation speed is multiplied by this value
};