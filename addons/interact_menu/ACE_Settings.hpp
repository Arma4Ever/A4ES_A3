class ACE_Settings {
    class GVAR(useFlexiMenu) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        category = "$STR_ACE_Interact_Menu_Category_InteractionMenu";
        displayName = CSTRING(Settings_UseFlexiMenu_DisplayName);
    };
    class GVAR(moveMainInteractionToCursor) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        category = "$STR_ACE_Interact_Menu_Category_InteractionMenu";
        displayName = CSTRING(Settings_MoveMainInteractionToCursor_DisplayName);
    };
};
