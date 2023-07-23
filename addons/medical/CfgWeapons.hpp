class CfgWeapons {
    class ACE_bloodIV;
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class A4ES_dressingSet: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(main,Author);
        model = "a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d";
        picture = QPATHTOF(data\dressing_set_inventory_ca.paa);
        displayName = CSTRING(DressingSet_Display);
        descriptionShort = CSTRING(DressingSet_Desc_Short);
        descriptionUse = CSTRING(DressingSet_Desc_Use);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 22;
        };
    };

    class A4ES_painkillers: ACE_ItemCore {
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

    class A4ES_emptyBloodBag: ACE_ItemCore {
        scope = 2;
        author = "SzwedzikPL";
        model = "z\ace\addons\medical_treatment\data\IVBag_250ml.p3d";
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {QPATHTOF(data\emptybloodbag_model_ca.paa)};
        picture = QPATHTOF(data\emptybloodbag_inventory_ca.paa);
        displayName = CSTRING(EmptyBloodBag_DisplayName);
        descriptionShort = CSTRING(EmptyBloodBag_Desc_Short);
        descriptionUse = CSTRING(EmptyBloodBag_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class A4ES_usedBloodBag: ACE_ItemCore {
        scope = 2;
        author = "SzwedzikPL";
        model = "z\ace\addons\medical_treatment\data\IVBag_250ml.p3d";
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {QPATHTOF(data\emptybloodbag_model_ca.paa)};
        picture = QPATHTOF(data\emptybloodbag_inventory_ca.paa);
        displayName = CSTRING(UsedBloodBag_DisplayName);
        descriptionShort = CSTRING(UsedBloodBag_Desc_Short);
        descriptionUse = CSTRING(UsedBloodBag_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class A4ES_clottedBloodBag: ACE_ItemCore {
        scope = 2;
        author = "SzwedzikPL";
        model = "z\ace\addons\medical_treatment\data\IVBag_250ml.p3d";
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"z\ace\addons\medical_treatment\data\IVBag_blood_250ml_ca.paa"};
        picture = QPATHTOF(data\clottedbloodbag_inventory_ca.paa);
        displayName = CSTRING(ClottedBloodBag_DisplayName);
        descriptionShort = CSTRING(ClottedBloodBag_Desc_Short);
        descriptionUse = CSTRING(ClottedBloodBag_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class ACE_bodyBag: ACE_ItemCore {
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
