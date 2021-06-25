
class GVAR(setLogicFlagValueSettingsSubCategory): GVAR(moduleSubCategory) {
    displayName = CSTRING(Attributes_setLogicFlagValueSettingsSubCategory);
    property = QGVAR(setLogicFlagValueSettingsSubCategory);
};

#ifndef MODULE_SETLOGICFLAGVALUE
    #define SETLOGICFLAGVALUE_COND ((_this getVariable QQGVAR(setLogicFlagValue)) isEqualTo true)
    class GVAR(setLogicFlagValue): GVAR(dynamicCheckbox) {
        displayName = CSTRING(Attributes_setLogicFlagValue);
        tooltip = CSTRING(Attributes_setLogicFlagValue_tooltip);
        property = QGVAR(setLogicFlagValue);
        defaultValue = "false";
        ATTRIBUTE_LOCAL;
    };
#else
    #define SETLOGICFLAGVALUE_COND (true)
#endif

class GVAR(logicFlag): GVAR(dynamicCombo) {
    displayName = CSTRING(Attributes_logicFlag);
    tooltip = CSTRING(Attributes_logicFlag_tooltip);
    property = QGVAR(logicFlag);
    typeName = "STRING";
    defaultValue = "''";
    GVAR(insertValues) = QFUNC(setLogicFlagValue_logicFlag_insertValues);
    #ifndef MODULE_SETLOGICFLAGVALUE
    GVAR(conditionActive) = QUOTE(SETLOGICFLAGVALUE_COND);
    #endif
    ATTRIBUTE_LOCAL;
};

class GVAR(logicFlagValue): GVAR(dynamicCombo) {
    displayName = CSTRING(Attributes_logicFlagValue);
    tooltip = CSTRING(Attributes_logicFlagValue_tooltip);
    property = QGVAR(logicFlagValue);
    typeName = "NUMBER";
    defaultValue = "0";
    #ifndef MODULE_SETLOGICFLAGVALUE
    GVAR(conditionActive) = QUOTE(SETLOGICFLAGVALUE_COND);
    #endif
    ATTRIBUTE_LOCAL;
    class values {
        class valueFalse {
            name = ECSTRING(common,False);
            value = 0;
            default = 1;
        };
        class valueTrue {
            name = ECSTRING(common,True);
            value = 1;
        };
    };
};

#undef SETLOGICFLAGVALUE_COND
#ifdef MODULE_SETLOGICFLAGVALUE
    #undef MODULE_SETLOGICFLAGVALUE
#endif
