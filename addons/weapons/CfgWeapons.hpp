class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    
     class optic_SOS: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip;
                class Iron;
            };
        };
    };
    class optic_SOS_NVG: optic_SOS {
        displayName = "MOS (NVG)";
        ACE_NightVision_radBlur=0;
		ACE_NightVision_blur=0;
        ACE_NightVision_grain=0;
        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    visionMode[] = {};
                };
                class Iron: Iron {};
            };
        };
    };

    class optic_DMS: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip;
                class Iron;
            };
        };
    };
    class optic_DMS_NVG: optic_DMS {
        displayName = "Burris XTR II (NVG)";
        ACE_NightVision_radBlur=0;
		ACE_NightVision_blur=0;
        ACE_NightVision_grain=0;
        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    visionMode[] = {};
                };
                class Iron: Iron {};
            };
        };
    };

     class optic_LRPS: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip;
            };
        };
    };
    class optic_LRPS_NVG: optic_LRPS {
        displayName = "Nightforce NXS (NVG)";
        ACE_NightVision_radBlur=0;
		ACE_NightVision_blur=0;
        ACE_NightVision_grain=0;
        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    visionMode[] = {};
                };
            };
        };
    };

    class optic_KHS_base: ItemCore {
         class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class KHS;
                class Iron;
            };
        };
    };
    class optic_KHS_blk: optic_KHS_base {};
    class optic_KHS_blk_NVG: optic_KHS_blk {
        displayName = "KAHLES Helia (NVG)";
        ACE_NightVision_radBlur=0;
		ACE_NightVision_blur=0;
        ACE_NightVision_grain=0;
        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class KHS: KHS {
                    visionMode[] = {};
                };
                class Iron: Iron {};
            };
        };
    };

    class optic_AMS_base: ItemCore {
         class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class AMS;
                class Iron;
            };
        };
    };
    class optic_AMS: optic_AMS_base {};
    class optic_AMS_NVG: optic_AMS {
        displayName = "US Optics MR-10 (NVG)";
        ACE_NightVision_radBlur=0;
		ACE_NightVision_blur=0;
        ACE_NightVision_grain=0;
        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class AMS: AMS {
                    visionMode[] = {};
                };
                class Iron: Iron {};
            };
        };
    };
};

class asdg_OpticRail;
class asdg_OpticRail1913: asdg_OpticRail {
    class compatibleItems {
        optic_SOS_NVG = 1;
        optic_DMS_NVG = 1;
        optic_LRPS_NVG = 1;
        optic_KHS_blk_NVG = 1;
        optic_AMS_NVG = 1;
    };
};