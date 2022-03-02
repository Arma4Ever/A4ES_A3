
class GVAR(showMarkerSettingsSubCategory): GVAR(moduleSubCategory) {
    displayName = CSTRING(Attributes_showMarkerSettingsSubCategory);
    property = QGVAR(showMarkerSettingsSubCategory);
};

#ifndef MODULE_SHOWMARKER
    #define SHOWMARKER_COND ((_this getVariable QQGVAR(showMarker)) isEqualTo true)
    class GVAR(showMarker): GVAR(dynamicCheckbox) {
        displayName = CSTRING(Attributes_showMarker);
        tooltip = CSTRING(Attributes_showMarker_tooltip);
        property = QGVAR(showMarker);
        defaultValue = "false";
        ATTRIBUTE_LOCAL;
    };
#else
    #define SHOWMARKER_COND (true)
#endif

class GVAR(showMarkerName): GVAR(dynamicEdit) {
    displayName = CSTRING(Attributes_showMarkerName);
    tooltip = CSTRING(Attributes_showMarkerName_tooltip);
    GVAR(description) = CSTRING(Attributes_showMarkerName_desc);
    property = QGVAR(showMarkerName);
    defaultValue = "''";
    #ifndef MODULE_SHOWMARKER
    GVAR(conditionActive) = QUOTE(SHOWMARKER_COND);
    #endif
    #ifdef MODULE_SHOWMARKER
    GVAR(observeValue) = 1;
    #endif
    ATTRIBUTE_LOCAL;
};

class GVAR(showMarkerAlpha): GVAR(dynamicSliderPercent) {
    displayName = CSTRING(Attributes_showMarkerAlpha);
    tooltip = CSTRING(Attributes_showMarkerAlpha_tooltip);
    property = QGVAR(showMarkerAlpha);
    defaultValue = "1";
    #ifndef MODULE_SHOWMARKER
    GVAR(conditionActive) = QUOTE(SHOWMARKER_COND);
    #endif
    ATTRIBUTE_LOCAL;
};

#undef SHOWMARKER_COND
#ifdef MODULE_SHOWMARKER
    #undef MODULE_SHOWMARKER
#endif
