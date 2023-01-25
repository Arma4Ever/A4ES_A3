class CfgWeapons {
	class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;

    class a4es_mobileArtilleryRadarItem: CBA_MiscItem {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = CSTRING(mobileArtilleryRadarItem_displayName);
		descriptionShort = CSTRING(mobileArtilleryRadarItem_descriptionShort);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 65;
        };
	};
};
