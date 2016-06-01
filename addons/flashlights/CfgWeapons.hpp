class CfgWeapons {
    class ItemCore;
    class ACE_ItemCore;

    class ACE_Flashlight_MX991: ACE_ItemCore {
        descriptionShort = CSTRING(MX991_Description);
        ACE_Attachable = QGVAR(personalFlashlight_red);
    };

    class ACE_Flashlight_KSF1: ACE_ItemCore {
        descriptionShort = CSTRING(KSF1_Description);
        ACE_Attachable = QGVAR(personalFlashlight_red);
    };

    class ACE_Flashlight_XL50: ACE_ItemCore {
        descriptionShort = CSTRING(XL50_Description);
        ACE_Attachable = QGVAR(personalFlashlight_white);
    };
};
