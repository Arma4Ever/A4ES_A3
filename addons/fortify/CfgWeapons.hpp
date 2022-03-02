class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_Fortify: ACE_ItemCore {
        displayName = CSTRING(FortifyItem_DisplayName);
        descriptionShort = CSTRING(FortifyItem_Desc_Short);
		model = "\A3\Weapons_F\Items\Toolkit";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 80;
        };
    };
};
