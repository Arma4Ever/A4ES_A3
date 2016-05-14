
#define A3CS_GRENADE(CNAME, PNAME) \
    class ##CNAME##: ##PNAME## \
    { \
        aiAmmoUsageFlags = 32; \
        allowAgainstInfantry = 0; \
        cost = 1000000; \
    }

#define A3CS_DISPERSION 0.001
#define A3CS_MODESINGLE_COUNT "1"
#define A3CS_MODEBURST_COUNT "3 + round random 3"
#define A3CS_MODEBURSTMG_COUNT "12 + round random 6"
#define A3CS_MODEFULL_COUNT "6 + round random 3"

#define A3CS_RIFLE_FULLAUTO \
    showToPlayer = 0;
    aiDispersionCoefX = 35; \
    aiDispersionCoefY = 30; \
    aiRateOfFire = 0.5; \
    aiRateOfFireDistance = 500; \
    minRange = 0; \
    minRangeProbab = 0.89999998; \
    midRange = 250; \
    midRangeProbab = 0.80000001; \
    maxRange = 500; \
    maxRangeProbab = 0.30000001; \
    burst = A3CS_MODEFULL_COUNT; \
    dispersion = A3CS_DISPERSION

#define A3CS_RIFLE_BURST \
    showToPlayer = 0;
    aiDispersionCoefX = 35; \
    aiDispersionCoefY = 30; \
    aiRateOfFire = 0.5; \
    aiRateOfFireDistance = 1000; \
    minRange = 0; \
    minRangeProbab = 0.89999998; \
    midRange = 500; \
    midRangeProbab = 0.80000001; \
    maxRange = 1000; \
    maxRangeProbab = 0.30000001; \
    burst = A3CS_MODEBURST_COUNT; \
    dispersion = A3CS_DISPERSION

#define A3CS_SRIFLE_SINGLE \
    showToPlayer = 0;
    aiDispersionCoefX = 22; \
    aiDispersionCoefY = 22; \
    aiRateOfFire = 1; \
    aiRateOfFireDistance = 1400; \
    minRange = 0; \
    minRangeProbab = 0.89999998; \
    midRange = 700; \
    midRangeProbab = 0.80000001; \
    maxRange = 1400; \
    maxRangeProbab = 0.30000001; \
    burst = A3CS_MODESINGLE_COUNT; \
    dispersion = A3CS_DISPERSION

#define A3CS_DMR_SINGLE \
    showToPlayer = 0;
    aiDispersionCoefX = 32; \
    aiDispersionCoefY = 28; \
    aiRateOfFire = 1; \
    aiRateOfFireDistance = 1200; \
    minRange = 0; \
    minRangeProbab = 0.89999998; \
    midRange = 600; \
    midRangeProbab = 0.80000001; \
    maxRange = 1200; \
    maxRangeProbab = 0.30000001; \
    burst = A3CS_MODESINGLE_COUNT; \
    dispersion = A3CS_DISPERSION

#define A3CS_SMG_FULLAUTO \
    showToPlayer = 0;
    aiDispersionCoefX = 32; \
    aiDispersionCoefY = 28; \
    aiRateOfFire = 1; \
    aiRateOfFireDistance = 250; \
    minRange = 0; \
    minRangeProbab = 0.89999998; \
    midRange = 150; \
    midRangeProbab = 0.80000001; \
    maxRange = 250; \
    maxRangeProbab = 0.30000001; \
    burst = A3CS_MODEFULL_COUNT; \
    dispersion = A3CS_DISPERSION

#define A3CS_SMG_BURST \
    showToPlayer = 0;
    aiDispersionCoefX = 36; \
    aiDispersionCoefY = 30; \
    aiRateOfFire = 0.5; \
    aiRateOfFireDistance = 600; \
    minRange = 251; \
    minRangeProbab = 0.80000001; \
    midRange = 400; \
    midRangeProbab = 0.69999999; \
    maxRange = 600; \
    maxRangeProbab = 0.4; \
    burst = A3CS_MODEBURST_COUNT; \
    dispersion = A3CS_DISPERSION

#define A3CS_MG_BURST \
    showToPlayer = 0;
    aiDispersionCoefX = 35; \
    aiDispersionCoefY = 35; \
    aiRateOfFire = 1; \
    aiRateOfFireDistance = 1200; \
    minRange = 0; \
    minRangeProbab = 0.89999998; \
    midRange = 600; \
    midRangeProbab = 0.80000001; \
    maxRange = 1200; \
    maxRangeProbab = 0.30000001; \
    burst = A3CS_MODEBURSTMG_COUNT; \
    dispersion = A3CS_DISPERSION
