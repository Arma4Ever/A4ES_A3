class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class A3CS_dressingSet: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(main,Author);
        model = "a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d";
        picture = QPATHTOF(data\dressing_set_inventory_ca.paa);
        displayName = CSTRING(DressingSet_Display);
        descriptionShort = CSTRING(DressingSet_Desc_Short);
        descriptionUse = CSTRING(DressingSet_Desc_Use);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 16;
        };
    };

    class A3CS_painkillers: ACE_ItemCore {
        scope = 2;
        author = "Alganthe";
        model = "\A3\Structures_F_EPA\Items\Medical\PainKillers_F.p3d";
        picture = QPATHTOF(data\painkillers_inventory_ca.paa);
        displayName = CSTRING(Painkillers_DisplayName);
        descriptionShort = "$STR_ACE_Medical_Morphine_Desc_Short";
        descriptionUse = "$STR_ACE_Medical_Morphine_Desc_Use";

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
