#ifdef DISABLE_COMPILE_CACHE
    #define PREP_OVERRIDDEN(var1,fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QUOTE(\z\a4es\addons\var1\ADDON\functions\DOUBLES(fnc,fncName).sqf)
#else
    #define PREP_OVERRIDDEN(var1,fncName) [QUOTE(\z\a4es\addons\var1\ADDON\functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif
