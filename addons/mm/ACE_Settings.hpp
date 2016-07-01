class ACE_Settings {
    class GVAR(enableColorCorrectionsEffect) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        category = CSTRING(Settings_Category_Effects);
        displayName = CSTRING(Settings_EnableColorCorrectionsEffect_DisplayName);
    };
    class GVAR(enableFogEffect) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        category = CSTRING(Settings_Category_Effects);
        displayName = CSTRING(Settings_EnableFogEffect_DisplayName);
    };
};
