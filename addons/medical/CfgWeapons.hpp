class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;
    class ACE_personalAidKit: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(PAK_displayName);
        class ItemInfo: InventoryItem_Base_F {
            mass = 30;
        };
    };
};
