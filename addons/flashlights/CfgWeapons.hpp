class CfgWeapons {
    class ItemCore;
    class ACE_ItemCore;

    class acc_flashlight: ItemCore {
        ACE_Attachable = QGVAR(colorWhite);
    };

    class acc_flashlight_smg_01: acc_flashlight {
        ACE_Attachable = QGVAR(colorWhite);
    };

    class acc_flashlight_pistol: ItemCore {
        ACE_Attachable = QGVAR(colorWhite);
    };

    class ACE_Flashlight_MX991: ACE_ItemCore {
        descriptionShort = CSTRING(MX991_Description);
        ACE_Attachable = QGVAR(colorRed);
    };

    class ACE_Flashlight_KSF1: ACE_ItemCore {
        descriptionShort = CSTRING(KSF1_Description);
        ACE_Attachable = QGVAR(colorRed);
    };

    class ACE_Flashlight_XL50: ACE_ItemCore {
        descriptionShort = CSTRING(XL50_Description);
        ACE_Attachable = QGVAR(colorWhite);
    };
};
