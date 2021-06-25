
class GVAR(showMessageSettingsSubCategory): GVAR(moduleSubCategory) {
    displayName = CSTRING(Attributes_showMessageSettingsSubCategory);
    property = QGVAR(showMessageSettingsSubCategory);
};

#ifndef MODULE_SHOWMESSAGE
    #define SHOWMESSAGE_COND ((_this getVariable QQGVAR(showMessage)) isEqualTo true)
    class GVAR(showMessage): GVAR(dynamicCheckbox) {
        displayName = CSTRING(Attributes_showMessage);
        tooltip = CSTRING(Attributes_showMessage_tooltip);
        property = QGVAR(showMessage);
        defaultValue = "false";
        ATTRIBUTE_LOCAL;
    };
#else
    #define SHOWMESSAGE_COND (true)
#endif

class GVAR(messageTarget): GVAR(dynamicCombo) {
    displayName = CSTRING(Attributes_messageTarget);
    tooltip = CSTRING(Attributes_messageTarget_tooltip);
    property = QGVAR(messageTarget);
    typeName = "NUMBER";
    defaultValue = "0";
    GVAR(insertValues) = QFUNC(showMessage_messageTarget_insertValues);
    #ifndef MODULE_SHOWMESSAGE
    GVAR(conditionActive) = QUOTE(SHOWMESSAGE_COND);
    #endif
    ATTRIBUTE_LOCAL;
};

class GVAR(messageType): GVAR(dynamicCombo) {
    displayName = CSTRING(Attributes_messageType);
    tooltip = CSTRING(Attributes_messageType_tooltip);
    property = QGVAR(messageType);
    typeName = "NUMBER";
    defaultValue = "0";
    #ifndef MODULE_SHOWMESSAGE
    GVAR(conditionActive) = QUOTE(SHOWMESSAGE_COND);
    #endif
    ATTRIBUTE_LOCAL;
    class values {
        class hint {
            name = CSTRING(Attributes_messageType_hint);
            tooltip = CSTRING(Attributes_messageType_hint_tooltip);
            value = 0;
            default = 1;
        };
        class typedTextBottom {
            name = CSTRING(Attributes_messageType_typedTextBottom);
            tooltip = CSTRING(Attributes_messageType_typedTextBottom_tooltip);
            value = 1;
        };
        class typedTextTop {
            name = CSTRING(Attributes_messageType_typedTextTop);
            tooltip = CSTRING(Attributes_messageType_typedTextTop_tooltip);
            value = 2;
        };
        class subtitle {
            name = CSTRING(Attributes_messageType_subtitle);
            tooltip = CSTRING(Attributes_messageType_subtitle_tooltip);
            value = 3;
        };
        class confirmBox {
            name = CSTRING(Attributes_messageType_confirmBox);
            tooltip = CSTRING(Attributes_messageType_confirmBox_tooltip);
            value = 4;
        };
    };
};

class GVAR(messageTitle): GVAR(dynamicEdit) {
    displayName = CSTRING(Attributes_messageTitle);
    tooltip = CSTRING(Attributes_messageTitle_tooltip);
    property = QGVAR(messageTitle);
    defaultValue = "''";
    GVAR(conditionActive) = QUOTE(SHOWMESSAGE_COND && {(_this getVariable QQGVAR(messageType)) isEqualTo 4});
    ATTRIBUTE_LOCAL;
};

class GVAR(messageName): GVAR(dynamicEdit) {
    displayName = CSTRING(Attributes_messageName);
    tooltip = CSTRING(Attributes_messageName_tooltip);
    property = QGVAR(messageName);
    defaultValue = "''";
    GVAR(conditionActive) = QUOTE(SHOWMESSAGE_COND && {(_this getVariable QQGVAR(messageType)) isEqualTo 3});
    ATTRIBUTE_LOCAL;
};

class GVAR(messageText): GVAR(dynamicEditMulti5) {
    displayName = CSTRING(Attributes_messageText);
    tooltip = CSTRING(Attributes_messageText_tooltip);
    property = QGVAR(messageText);
    defaultValue = "''";
    #ifndef MODULE_SHOWMESSAGE
    GVAR(conditionActive) = QUOTE(SHOWMESSAGE_COND);
    #endif
    ATTRIBUTE_LOCAL;
};

class GVAR(messagePlaySound): GVAR(dynamicCheckbox) {
    displayName = CSTRING(Attributes_messagePlaySound);
    tooltip = CSTRING(Attributes_messagePlaySound_tooltip);
    property = QGVAR(messagePlaySound);
    GVAR(conditionActive) = QUOTE(SHOWMESSAGE_COND && {(_this getVariable QQGVAR(messageType)) in [ARR_3(0,1,2)]});
    ATTRIBUTE_LOCAL;
};

#undef SHOWMESSAGE_COND
#ifdef MODULE_SHOWMESSAGE
    #undef MODULE_SHOWMESSAGE
#endif
