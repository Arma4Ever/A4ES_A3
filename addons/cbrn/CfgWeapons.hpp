
class CfgWeapons {
	class UniformItem;
	class Uniform_Base;
    class HelmetBase;
    class H_HelmetB;
	class JSHK_contam_suit_base: Uniform_Base {
        GVAR(protectedParts[]) = {"body"};
	};
    class U_C_CBRN_Suit_01_Blue_F: Uniform_Base {
        GVAR(protectedParts[]) = {"head", "body"};
    };
    class U_C_CBRN_Suit_01_White_F: Uniform_Base {
        GVAR(protectedParts[]) = {"head", "body"};
    };
    class U_B_CBRN_Suit_01_MTP_F: Uniform_Base {
        GVAR(protectedParts[]) = {"head", "body"};
    };
    class U_B_CBRN_Suit_01_Tropic_F: Uniform_Base {
        GVAR(protectedParts[]) = {"head", "body"};
    };
    class U_B_CBRN_Suit_01_Wdl_F: Uniform_Base {
        GVAR(protectedParts[]) = {"head", "body"};
    };
    class U_I_CBRN_Suit_01_AAF_F: Uniform_Base {
        GVAR(protectedParts[]) = {"head", "body"};
    };
    class U_I_E_CBRN_Suit_01_EAF_F: Uniform_Base {
        GVAR(protectedParts[]) = {"head", "body"};
    };
    class H_PilotHelmetFighter_B: H_HelmetB {
        GVAR(airFilter) = 3;
        GVAR(protectedParts[]) = {"face"};
    };
    class H_Shemag_khk: HelmetBase {
        GVAR(airFilter) = 1;
    };
    class H_ShemagOpen_khk: HelmetBase {
        GVAR(airFilter) = 1;
    };
    class H_HelmetO_ViperSP_hex_F: H_HelmetB {
        GVAR(airFilter) = 3;
        GVAR(protectedParts[]) = {"face", "head"};
    };
};
