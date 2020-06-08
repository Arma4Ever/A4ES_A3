#define COMPONENT api
#define COMPONENT_BEAUTIFIED API
#include "\z\a3cs\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_API
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_API
    #define DEBUG_SETTINGS DEBUG_SETTINGS_API
#endif

#include "\z\a3cs\addons\main\script_macros.hpp"

#define API_FNC(func) class func {\
    file = QPATHTOF(functions\DOUBLES(fnc,func).sqf);\
}
