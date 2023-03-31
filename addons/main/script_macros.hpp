#define DEBUG_SYNCHRONOUS
#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"
#if __has_include("\z\a4es\addons\main\script_input.hpp")
#include "\z\a4es\addons\main\script_input.hpp"
#endif

//#include "script_input.hpp"

#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)
#define DEFUNC(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),fnc,var2)

#undef QFUNC
#undef QEFUNC
#define QFUNC(var1) QUOTE(DFUNC(var1))
#define QEFUNC(var1,var2) QUOTE(DEFUNC(var1,var2))

#ifdef DEBUG_MODE_FULL
#define TRACE_WARNING_1(MESSAGE,A) LOG_SYS_FILELINENUMBERS('WARNING',PFORMAT_1(str diag_frameNo + ' ' + (MESSAGE),A))
#define TRACE_WARNING_2(MESSAGE,A,B) LOG_SYS_FILELINENUMBERS('WARNING',PFORMAT_2(str diag_frameNo + ' ' + (MESSAGE),A,B))
#define TRACE_WARNING_3(MESSAGE,A,B,C) LOG_SYS_FILELINENUMBERS('WARNING',PFORMAT_3(str diag_frameNo + ' ' + (MESSAGE),A,B,C))
#define TRACE_WARNING_4(MESSAGE,A,B,C,D) LOG_SYS_FILELINENUMBERS('WARNING',PFORMAT_4(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D))
#define TRACE_WARNING_5(MESSAGE,A,B,C,D,E) LOG_SYS_FILELINENUMBERS('WARNING',PFORMAT_5(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E))
#define TRACE_WARNING_6(MESSAGE,A,B,C,D,E,F) LOG_SYS_FILELINENUMBERS('WARNING',PFORMAT_6(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F))
#define TRACE_WARNING_7(MESSAGE,A,B,C,D,E,F,G) LOG_SYS_FILELINENUMBERS('WARNING',PFORMAT_7(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F,G))
#define TRACE_WARNING_8(MESSAGE,A,B,C,D,E,F,G,H) LOG_SYS_FILELINENUMBERS('WARNING',PFORMAT_8(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F,G,H))
#define TRACE_WARNING_9(MESSAGE,A,B,C,D,E,F,G,H,I) LOG_SYS_FILELINENUMBERS('WARNING',PFORMAT_9(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F,G,H,I))
#define TRACE_ERROR_1(MESSAGE,A) LOG_SYS_FILELINENUMBERS('ERROR',PFORMAT_1(str diag_frameNo + ' ' + (MESSAGE),A))
#define TRACE_ERROR_2(MESSAGE,A,B) LOG_SYS_FILELINENUMBERS('ERROR',PFORMAT_2(str diag_frameNo + ' ' + (MESSAGE),A,B))
#define TRACE_ERROR_3(MESSAGE,A,B,C) LOG_SYS_FILELINENUMBERS('ERROR',PFORMAT_3(str diag_frameNo + ' ' + (MESSAGE),A,B,C))
#define TRACE_ERROR_4(MESSAGE,A,B,C,D) LOG_SYS_FILELINENUMBERS('ERROR',PFORMAT_4(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D))
#define TRACE_ERROR_5(MESSAGE,A,B,C,D,E) LOG_SYS_FILELINENUMBERS('ERROR',PFORMAT_5(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E))
#define TRACE_ERROR_6(MESSAGE,A,B,C,D,E,F) LOG_SYS_FILELINENUMBERS('ERROR',PFORMAT_6(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F))
#define TRACE_ERROR_7(MESSAGE,A,B,C,D,E,F,G) LOG_SYS_FILELINENUMBERS('ERROR',PFORMAT_7(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F,G))
#define TRACE_ERROR_8(MESSAGE,A,B,C,D,E,F,G,H) LOG_SYS_FILELINENUMBERS('ERROR',PFORMAT_8(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F,G,H))
#define TRACE_ERROR_9(MESSAGE,A,B,C,D,E,F,G,H,I) LOG_SYS_FILELINENUMBERS('ERROR',PFORMAT_9(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F,G,H,I))
#else
#define TRACE_WARNING_1(MESSAGE,A) /* disabled */
#define TRACE_WARNING_2(MESSAGE,A,B) /* disabled */
#define TRACE_WARNING_3(MESSAGE,A,B,C) /* disabled */
#define TRACE_WARNING_4(MESSAGE,A,B,C,D) /* disabled */
#define TRACE_WARNING_5(MESSAGE,A,B,C,D,E) /* disabled */
#define TRACE_WARNING_6(MESSAGE,A,B,C,D,E,F) /* disabled */
#define TRACE_WARNING_7(MESSAGE,A,B,C,D,E,F,G) /* disabled */
#define TRACE_WARNING_8(MESSAGE,A,B,C,D,E,F,G,H) /* disabled */
#define TRACE_WARNING_9(MESSAGE,A,B,C,D,E,F,G,H,I) /* disabled */
#define TRACE_ERROR_1(MESSAGE,A) /* disabled */
#define TRACE_ERROR_2(MESSAGE,A,B) /* disabled */
#define TRACE_ERROR_3(MESSAGE,A,B,C) /* disabled */
#define TRACE_ERROR_4(MESSAGE,A,B,C,D) /* disabled */
#define TRACE_ERROR_5(MESSAGE,A,B,C,D,E) /* disabled */
#define TRACE_ERROR_6(MESSAGE,A,B,C,D,E,F) /* disabled */
#define TRACE_ERROR_7(MESSAGE,A,B,C,D,E,F,G) /* disabled */
#define TRACE_ERROR_8(MESSAGE,A,B,C,D,E,F,G,H) /* disabled */
#define TRACE_ERROR_9(MESSAGE,A,B,C,D,E,F,G,H,I) /* disabled */
#endif

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

#ifdef DISABLE_COMPILE_CACHE
    #define PREP_MODULE(moduleName,fncName) DFUNC(DOUBLES(moduleName,fncName) = compileScript [QPATHTOF(modules\moduleName\functions\DOUBLES(fnc,fncName).sqf)]
#else
    #define PREP_MODULE(moduleName,fncName) [QPATHTOF(modules\moduleName\functions\DOUBLES(fnc,fncName).sqf), QFUNC(DOUBLES(moduleName,fncName))] call CBA_fnc_compileFunction
#endif

#include "script_debug.hpp"
