
#define A3CS_GRENADE(CNAME, PNAME) \
    class ##CNAME##: ##PNAME## \
    { \
        aiAmmoUsageFlags = 32; \
        allowAgainstInfantry = 0; \
        cost = 1000000; \
    }
