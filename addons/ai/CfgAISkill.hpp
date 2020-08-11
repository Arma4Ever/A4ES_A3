
class CfgAISkill {
	// Values of 0 causes AI to shoot at their feet
	// 0.1 seems like a good value, not too easy, not too hard. They shoot like they're out of breath and injured
	// 0.05 is the value that people tend to like, it's super inaccurate - takes a while for AI groups to kill each other
    aimingAccuracy[] = {0, 0.075, 1, 0.4};

    aimingShake[] = {0, 0.15, 1, 0.5};
    aimingSpeed[] = {0, 0.4, 1, 0.75};
    spotDistance[] = {0, 0.75, 1, 1};

    // Static vars
    commanding[] = {0, 1, 1, 1};
    courage[] = {0, 1, 1, 1};
    endurance[] = {0, 1, 1, 1};
    general[] = {0, 1, 1, 1};
    reloadSpeed[] = {0, 1, 1, 1};
    spotTime[] = {0, 1, 1, 1};
};
