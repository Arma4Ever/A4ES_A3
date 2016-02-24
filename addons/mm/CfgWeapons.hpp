class CfgWeapons {
    class VestItem;
    class Vest_NoCamo_Base;
    class a3cs_dummyVest: Vest_NoCamo_Base {
        author = "$STR_A3_Bohemia_Interactive";
        scope = 2;
        scopeArsenal = 0;
        displayName = "$STR_A3CS_MM_displayName_dummyVest";
        picture = "\A3\Characters_F\data\ui\icon_V_Belt_CA.paa";
        model = "\A3\Weapons_F\DummyVest";
        class ItemInfo: VestItem {
            uniformModel = "\A3\Weapons_F\DummyVest";
            containerClass = "Supply80";
            mass = 10;
            armor = 0;
            passThrough = 1;
        };
    };
};
