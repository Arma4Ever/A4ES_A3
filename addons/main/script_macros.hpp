#define DEBUG_SYNCHRONOUS
#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)
#define DEFUNC(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),fnc,var2)

#undef QFUNC
#undef QEFUNC
#define QFUNC(var1) QUOTE(DFUNC(var1))
#define QEFUNC(var1,var2) QUOTE(DEFUNC(var1,var2))

#define MACRO_ADDWEAPON(WEAPON,COUNT) class _xx_##WEAPON { \
    weapon = #WEAPON; \
    count = COUNT; \
}

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
    name = #ITEM; \
    count = COUNT; \
}

#define MACRO_ADDMAGAZINE(MAGAZINE,COUNT) class _xx_##MAGAZINE { \
    magazine = #MAGAZINE; \
    count = COUNT; \
}

#define MACRO_ADDBACKPACK(BACKPACK,COUNT) class _xx_##BACKPACK { \
    backpack = #BACKPACK; \
    count = COUNT; \
}

#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compileScript [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)]
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

#define QQPATHTOF(var1) QUOTE(QPATHTOF(var1))
#define QQPATHTOEF(var1,var2) QUOTE(QPATHTOEF(var1,var2))

#define ACE_PREFIX ace
#define COMPILE_ACE_FILE(var1,var2) COMPILE_FILE_SYS(ACE_PREFIX,var1,var2)
#define ACEGVAR(moduleName,varNmae) TRIPLES(ACE_PREFIX,moduleName,varNmae)
#define QACEGVAR(moduleName,varNmae) QUOTE(ACEGVAR(moduleName,varNmae))
#define ACEFUNC(moduleName,fncName) TRIPLES(DOUBLES(ACE_PREFIX,moduleName),fnc,fncName)
#define QACEFUNC(moduleName,fncName) QUOTE(ACEFUNC(moduleName,fncName))

#include "script_debug.hpp"
