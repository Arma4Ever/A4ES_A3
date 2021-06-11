
class GVAR(playSoundSettingsSubCategory): GVAR(moduleSubCategory) {
    displayName = CSTRING(Attributes_playSoundSettingsSubCategory);
    property = QGVAR(playSoundSettingsSubCategory);
};

#ifndef MODULE_PLAYSOUND
    #define PLAYSOUND_COND ((_this getVariable QQGVAR(playSound)) isEqualTo true)
    class GVAR(playSound): GVAR(dynamicCheckbox) {
        displayName = CSTRING(Attributes_playSound);
        tooltip = CSTRING(Attributes_playSound_tooltip);
        property = QGVAR(playSound);
        ATTRIBUTE_LOCAL;
    };
#else
    #define PLAYSOUND_COND (true)
#endif

class GVAR(soundFilePath): GVAR(dynamicEdit) {
    displayName = CSTRING(Attributes_soundFilePath);
    tooltip = CSTRING(Attributes_soundFilePath_tooltip);
    property = QGVAR(soundFilePath);
    defaultValue = "''";
    GVAR(description) = CSTRING(Attributes_soundFilePath_desc);
    #ifndef MODULE_PLAYSOUND
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND);
    #endif
    ATTRIBUTE_LOCAL;
};

class GVAR(soundFromMission): GVAR(dynamicCheckbox) {
    displayName = CSTRING(Attributes_soundFromMission);
    tooltip = CSTRING(Attributes_soundFromMission_tooltip);
    property = QGVAR(soundFromMission);
    GVAR(description) = CSTRING(Attributes_soundFromMission_desc);
    #ifndef MODULE_PLAYSOUND
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND);
    #endif
    ATTRIBUTE_LOCAL;
};

class GVAR(soundSource): GVAR(dynamicEdit) {
    displayName = CSTRING(Attributes_soundSource);
    tooltip = CSTRING(Attributes_soundSource_tooltip);
    property = QGVAR(soundSource);
    defaultValue = "''";
    validate = "variable";
    #ifndef MODULE_PLAYSOUND
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND);
    #endif
    ATTRIBUTE_LOCAL;
};

class GVAR(soundIsInside): GVAR(dynamicCheckbox) {
    displayName = CSTRING(Attributes_soundIsInside);
    tooltip = CSTRING(Attributes_soundIsInside_tooltip);
    property = QGVAR(soundIsInside);
    #ifndef MODULE_PLAYSOUND
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND);
    #endif
    ATTRIBUTE_LOCAL;
};

class GVAR(soundVolume): GVAR(dynamicSliderPercent) {
    displayName = CSTRING(Attributes_soundVolume);
    tooltip = CSTRING(Attributes_soundVolume_tooltip);
    property = QGVAR(soundVolume);
    defaultValue = "1";
    GVAR(range[]) = {0, 500};
    #ifndef MODULE_PLAYSOUND
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND);
    #endif
};

class GVAR(soundPitch): GVAR(dynamicSliderPercent) {
    displayName = CSTRING(Attributes_soundPitch);
    tooltip = CSTRING(Attributes_soundPitch_tooltip);
    property = QGVAR(soundPitch);
    defaultValue = "1";
    GVAR(range[]) = {0, 200};
    GVAR(description) = CSTRING(Attributes_soundPitch_desc);
    #ifndef MODULE_PLAYSOUND
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND);
    #endif
};

class GVAR(soundDistance): GVAR(dynamicEdit) {
    displayName = CSTRING(Attributes_soundDistance);
    tooltip = CSTRING(Attributes_soundDistance_tooltip);
    property = QGVAR(soundDistance);
    defaultValue = "'100'";
    typeName = "NUMBER";
    validate = "number";
    #ifndef MODULE_PLAYSOUND
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND);
    #endif
    ATTRIBUTE_LOCAL;
};

class GVAR(soundOffset): GVAR(dynamicEdit) {
    displayName = CSTRING(Attributes_soundOffset);
    tooltip = CSTRING(Attributes_soundOffset_tooltip);
    property = QGVAR(soundOffset);
    defaultValue = "'0'";
    typeName = "NUMBER";
    validate = "number";
    #ifndef MODULE_PLAYSOUND
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND);
    #endif
    ATTRIBUTE_LOCAL;
};

class GVAR(playSoundDelay): GVAR(dynamicEdit) {
    displayName = CSTRING(Attributes_playSoundDelay);
    tooltip = CSTRING(Attributes_playSoundDelay_tooltip);
    property = QGVAR(playSoundDelay);
    typeName = "NUMBER";
    defaultValue = "0";
    validate = "number";
    #ifndef MODULE_PLAYSOUND
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND);
    #endif
    ATTRIBUTE_LOCAL;
};

class GVAR(soundRepeat): GVAR(dynamicCheckbox) {
    displayName = CSTRING(Attributes_soundRepeat);
    tooltip = CSTRING(Attributes_soundRepeat_tooltip);
    property = QGVAR(soundRepeat);
    #ifndef MODULE_PLAYSOUND
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND);
    #endif
    ATTRIBUTE_LOCAL;
};

class GVAR(soundRepeatMode): GVAR(dynamicToolboxSoundRepeatMode) {
    displayName = CSTRING(Attributes_soundRepeatMode);
    tooltip = CSTRING(Attributes_soundRepeatMode_tooltip);
    property = QGVAR(soundRepeatMode);
    defaultValue = "0";
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND && {(_this getVariable QQGVAR(soundRepeat)) isEqualTo true});
    ATTRIBUTE_LOCAL;
};

class GVAR(soundRepeatCount): GVAR(dynamicEdit) {
    displayName = CSTRING(Attributes_soundRepeatCount);
    tooltip = CSTRING(Attributes_soundRepeatCount_tooltip);
    property = QGVAR(soundRepeatCount);
    typeName = "NUMBER";
    defaultValue = "2";
    validate = "number";
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND && {(_this getVariable QQGVAR(soundRepeat)) isEqualTo true} && {(_this getVariable QQGVAR(soundRepeatMode)) isEqualTo 0});
    ATTRIBUTE_LOCAL;
};

class GVAR(soundRepeatLogicFlags): GVAR(dynamicLogicFlagCond) {
    displayName = CSTRING(Attributes_soundRepeatLogicFlags);
    tooltip = CSTRING(Attributes_soundRepeatLogicFlags_Tooltip);
    property = QGVAR(soundRepeatLogicFlags);
    defaultValue = "'[]'";
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND && {(_this getVariable QQGVAR(soundRepeat)) isEqualTo true} && {(_this getVariable QQGVAR(soundRepeatMode)) isEqualTo 1});
    ATTRIBUTE_LOCAL;
};

class GVAR(soundRepeatCondition): GVAR(dynamicEditCodeMulti5) {
    displayName = CSTRING(Attributes_soundRepeatCondition);
    tooltip = CSTRING(Attributes_soundRepeatCondition_tooltip);
    property = QGVAR(soundRepeatCondition);
    defaultValue = "'true'";
    typeName = "STRING";
    validate = "condition";
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND && {(_this getVariable QQGVAR(soundRepeat)) isEqualTo true} && {(_this getVariable QQGVAR(soundRepeatMode)) isEqualTo 2});
    ATTRIBUTE_LOCAL;
};

class GVAR(soundRepeatDelay): GVAR(dynamicEdit) {
    displayName = CSTRING(Attributes_soundRepeatDelay);
    tooltip = CSTRING(Attributes_soundRepeatDelay_tooltip);
    property = QGVAR(soundRepeatDelay);
    typeName = "NUMBER";
    defaultValue = "0";
    validate = "number";
    GVAR(conditionActive) = QUOTE(PLAYSOUND_COND && {(_this getVariable QQGVAR(soundRepeat)) isEqualTo true});
    ATTRIBUTE_LOCAL;
};

#undef PLAYSOUND_COND
