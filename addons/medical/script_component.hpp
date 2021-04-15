#define COMPONENT medical
#define COMPONENT_BEAUTIFIED Medical
#include "\z\a3cs\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#include "\z\a3cs\addons\main\script_macros.hpp"

#define ACE_MEDICAL_CHECK(var1,var2) class DOUBLES(ace,var1) { \
    init = QUOTE(if !(getMissionConfigValue [ARR_2(QQGVAR(disableSystem),false)]) then {call COMPILE_ACE_FILE(var1,var2);};); \
}

#define ACE_MEDICAL_OVERRIDE(var1,var2) class DOUBLES(ace,var1) { \
    init = QUOTE(call COMPILE_FILE(DOUBLES(ace,var1)\var2);); \
}
