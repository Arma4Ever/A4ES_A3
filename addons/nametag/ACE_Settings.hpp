class ACE_Settings {
    class GVAR(enableTacticalHud) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(Settings_EnableTacticalHud_DisplayName);
        category = CSTRING(Settings_Category);
    };
    class GVAR(enableTacticalHudBackground) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(Settings_EnableTacticalHudBackground_DisplayName);
        category = CSTRING(Settings_Category);
    };
    class GVAR(enableTacticalHudLists) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(Settings_EnableTacticalHudList_DisplayName);
        category = CSTRING(Settings_Category);
    };
    class GVAR(enableCursorNametag) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(Settings_EnableCursorNametag_DisplayName);
        description = CSTRING(Settings_EnableCursorNametag_Description);
        category = CSTRING(Settings_Category);
    };
    class GVAR(enable3dNametag) {
        value = 1;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(Settings_Enable3dNametag_DisplayName);
        values[] = {
            ECSTRING(common,No),
            CSTRING(Settings_Enable3dNametag_OnFreelook_DisplayName),
            CSTRING(Settings_Enable3dNametag_OnCursorTarget_DisplayName)
        };
        category = CSTRING(Settings_Category);
    };
    class GVAR(addSpecialItem) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(Settings_AddSpecialItem_DisplayName);
        category = CSTRING(Settings_Category);
    };
};
