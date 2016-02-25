class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;
    class ACE_simpleGPS: ACE_ItemCore {
        author = ECSTRING(common,A3C);
        scope = 2;
        scopeArsenal = 2;
        displayName = CSTRING(ACE_simpleGPS_DisplayName);
        descriptionShort = CSTRING(ACE_simpleGPS_DisplayName);
        picture = PATHTOF(data\icon_simpleGPS.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
};
