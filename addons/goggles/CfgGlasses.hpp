class CfgGlasses {
	class None;
	class G_Combat: None {};
	class JSHK_contam_mask_base: G_Combat {
        ACE_Resistance = 2;
        ACE_Protection = 1;
    };
	class JSHK_contam_mask_m50_hoodless: JSHK_contam_mask_base {
        ACE_Overlay = "\z\ace\addons\goggles\textures\HUD\DivingGoggles.paa";
        ACE_OverlayCracked = "\z\ace\addons\goggles\textures\HUD\DivingGogglesCracked.paa";
    };
	class JSHK_contam_mask_m04_hoodless: JSHK_contam_mask_base {
        ACE_Overlay = QPATHTOF(data\roundGoggles.paa);
        ACE_OverlayCracked = QPATHTOF(data\roundGogglesCracked.paa);
    };
	class JSHK_contam_mask_s10_mtp: JSHK_contam_mask_base {
        ACE_Overlay = QPATHTOF(data\roundGoggles.paa);
        ACE_OverlayCracked = QPATHTOF(data\roundGogglesCracked.paa);
    };
    class G_AirPurifyingRespirator_01_base_F: None {
        ACE_Resistance = 2;
        ACE_Protection = 1;
        ACE_Overlay = "\z\ace\addons\goggles\textures\HUD\DivingGoggles.paa";
        ACE_OverlayCracked = "\z\ace\addons\goggles\textures\HUD\DivingGogglesCracked.paa";
    };
    class G_RegulatorMask_base_F: None {
        ACE_Resistance = 2;
        ACE_Protection = 1;
        ACE_Overlay = "\z\ace\addons\goggles\textures\HUD\DivingGoggles.paa";
        ACE_OverlayCracked = "\z\ace\addons\goggles\textures\HUD\DivingGogglesCracked.paa";
    };

    class avon_fm12: None {
        ACE_Overlay = QPATHTOF(data\roundGoggles.paa);
        ACE_OverlayCracked = QPATHTOF(data\roundGogglesCracked.paa);
        identityTypes[] = {};
	};
	class avon_fm12_strapless: None {
        ACE_Overlay = QPATHTOF(data\roundGoggles.paa);
        ACE_OverlayCracked = QPATHTOF(data\roundGogglesCracked.paa);
        identityTypes[] = {};
	};
	class avon_ct12: None {
        ACE_Overlay = QPATHTOF(data\roundGoggles.paa);
        ACE_OverlayCracked = QPATHTOF(data\roundGogglesCracked.paa);
        identityTypes[] = {};
	};
	class avon_ct12_strapless: None {
        ACE_Overlay = QPATHTOF(data\roundGoggles.paa);
        ACE_OverlayCracked = QPATHTOF(data\roundGogglesCracked.paa);
        identityTypes[] = {};
	};
	class avon_SF12: None {
        ACE_Overlay = QPATHTOF(data\roundGoggles.paa);
        ACE_OverlayCracked = QPATHTOF(data\roundGogglesCracked.paa);
        identityTypes[] = {};
	};
	class avon_SF12_strapless: None {
        ACE_Overlay = QPATHTOF(data\roundGoggles.paa);
        ACE_OverlayCracked = QPATHTOF(data\roundGogglesCracked.paa);
        identityTypes[] = {};
	};
};
