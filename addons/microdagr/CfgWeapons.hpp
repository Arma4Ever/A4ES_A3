class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;
    class A4ES_simpleGPS: ACE_ItemCore {
        author = "Krzyciu";
        scope = 2;
        displayName = CSTRING(simpleGPS);
        descriptionShort = CSTRING(simpleGPS_Description);
        picture = QPATHTOF(data\icon_simpleGPS.paa);
        model = "\a3\Props_F_Enoch\Military\Equipment\BatteryPack_01_battery_F.p3d";
        ACE_isTool = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};