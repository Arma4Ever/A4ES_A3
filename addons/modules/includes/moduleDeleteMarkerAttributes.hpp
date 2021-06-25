
class GVAR(deleteMarkerSettingsSubCategory): GVAR(moduleSubCategory) {
    displayName = CSTRING(Attributes_deleteMarkerSettingsSubCategory);
    property = QGVAR(deleteMarkerSettingsSubCategory);
};

#ifndef MODULE_DELETEMARKER
    #define DELETEMARKER_COND ((_this getVariable QQGVAR(deleteMarker)) isEqualTo true)
    class GVAR(deleteMarker): GVAR(dynamicCheckbox) {
        displayName = CSTRING(Attributes_deleteMarker);
        tooltip = CSTRING(Attributes_deleteMarker_tooltip);
        property = QGVAR(deleteMarker);
        defaultValue = "false";
        ATTRIBUTE_LOCAL;
    };
#else
    #define DELETEMARKER_COND (true)
#endif

class GVAR(deleteMarkerName): GVAR(dynamicEdit) {
    displayName = CSTRING(Attributes_deleteMarkerName);
    tooltip = CSTRING(Attributes_deleteMarkerName_tooltip);
    GVAR(description) = CSTRING(Attributes_deleteMarkerName_desc);
    property = QGVAR(deleteMarkerName);
    defaultValue = "''";
    #ifndef MODULE_DELETEMARKER
    GVAR(conditionActive) = QUOTE(DELETEMARKER_COND);
    #endif
    ATTRIBUTE_LOCAL;
};

#undef DELETEMARKER_COND
#ifdef MODULE_DELETEMARKER
    #undef MODULE_DELETEMARKER
#endif
