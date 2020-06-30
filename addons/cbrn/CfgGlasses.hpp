
class CfgGlasses {
	class None;
    class G_Balaclava_blk: None {};
    class G_Combat: None {};

    class G_Bandanna_blk: G_Balaclava_blk {
        GVAR(airFilter) = 1;
    };
    class G_Respirator_base_F: None {
        GVAR(airFilter) = 2;
    };
    class G_AirPurifyingRespirator_01_base_F: None {
        GVAR(airFilter) = 3;
        GVAR(protectedParts[]) = {"face"};
    };
    class G_RegulatorMask_base_F: None {
        GVAR(airFilter) = 3;
        GVAR(protectedParts[]) = {"face"};
    };
    class G_Balaclava_TI_blk_F: None {
        GVAR(airFilter) = 1;
    };

	class JSHK_contam_mask_base: G_Combat {
        GVAR(airFilter) = 3;
    };
	class JSHK_contam_mask_m50_hoodless: JSHK_contam_mask_base {
        GVAR(protectedParts[]) = {"face"};
    };
	class JSHK_contam_mask_m04_hoodless: JSHK_contam_mask_base {
        GVAR(protectedParts[]) = {"face"};
    };
	class JSHK_contam_mask_s10_mtp: JSHK_contam_mask_base {
        GVAR(protectedParts[]) = {"face", "head"};
    };
	class JSHK_contam_mask_m50_mtp_hood: JSHK_contam_mask_m50_hoodless {
        GVAR(protectedParts[]) = {"face", "head"};
    };
	class JSHK_contam_mask_m50_orange_hood: JSHK_contam_mask_m50_hoodless {
        GVAR(protectedParts[]) = {"face", "head"};
    };
	class JSHK_contam_mask_m50_gray_hood: JSHK_contam_mask_m50_hoodless {
        GVAR(protectedParts[]) = {"face", "head"};
    };
	class JSHK_contam_mask_m50_blue_hood: JSHK_contam_mask_m50_hoodless {
        GVAR(protectedParts[]) = {"face", "head"};
    };
	class JSHK_contam_mask_m50_blk_hood: JSHK_contam_mask_m50_hoodless {
        GVAR(protectedParts[]) = {"face", "head"};
    };
	class JSHK_contam_mask_m04_mtp_hood: JSHK_contam_mask_m04_hoodless {
        GVAR(protectedParts[]) = {"face", "head"};
    };
	class JSHK_contam_mask_m04_orange_hood: JSHK_contam_mask_m04_hoodless {
        GVAR(protectedParts[]) = {"face", "head"};
    };
	class JSHK_contam_mask_m04_gray_hood: JSHK_contam_mask_m04_hoodless {
        GVAR(protectedParts[]) = {"face", "head"};
    };
	class JSHK_contam_mask_m04_blue_hood: JSHK_contam_mask_m04_hoodless {
        GVAR(protectedParts[]) = {"face", "head"};
    };
	class JSHK_contam_mask_m04_blk_hood: JSHK_contam_mask_m04_hoodless {
        GVAR(protectedParts[]) = {"face", "head"};
    };
};
