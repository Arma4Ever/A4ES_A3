#define COMPONENT containers
#define COMPONENT_BEAUTIFIED Containers
#include "\z\a3cs\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#include "\z\a3cs\addons\main\script_macros.hpp"

#define A3CS_CONTAINER(CLASSNAME,SIZE,SUBCAT) \
class CLASSNAME; \
class GVAR(CLASSNAME): CLASSNAME { \
    editorCategory = QGVAR(edCat); \
    editorSubcategory = QGVAR(SUBCAT); \
    transportMaxBackpacks = SIZE; \
    transportMaxMagazines = SIZE; \
    transportMaxWeapons = SIZE; \
    maximumLoad = SIZE; \
}
