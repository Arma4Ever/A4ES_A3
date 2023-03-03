#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {
            "optic_AMS_NVG",
            "optic_KHS_blk_NVG",
            "optic_LRPS_NVG",
            "optic_DMS_NVG",
            "optic_SOS_NVG"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Weapons_F_Acc",
            "A3_Weapons_F_Mark_Acc",
            "a4es_common",
            "ace_advanced_ballistics",
            "ace_reload",
            "ace_overheating"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
/*
#include "CfgEventHandlers.hpp"

class GVAR(AB_weapons) {
    class CUP_arifle_ACR_DMR_blk_556 {};
    class CUP_arifle_ACR_DMR_blk_68 {};
    class CUP_arifle_ACR_DMR_snw_556 {};
    class CUP_arifle_ACR_DMR_snw_68 {};
    class CUP_arifle_ACR_DMR_wdl_556 {};
    class CUP_arifle_ACR_DMR_tan_556 {};
    class CUP_arifle_ACR_DMR_tan_68 {};
    class CUP_arifle_ACR_DMR_wdl_68 {};
    class PSZ_Alex338 {};
    class CUP_srifle_AS50 {};
    class srifle_DMR_04_F {};
    class srifle_DMR_04_Tan_F {};
    class PSZ_Bor {};
    class srifle_DMR_05_blk_F {};
    class srifle_DMR_05_hex_F {};
    class srifle_DMR_05_tan_f {};
    class CUP_srifle_CZ550 {};
    class CUP_srifle_CZ550_rail {};
    class CUP_srifle_CZ750 {};
    class ACM_NMA_Weapon_JCO18 {};
    class CUP_srifle_g22_wdl {};
    class CUP_srifle_G22_blk {};
    class CUP_srifle_G22_des {};
    class srifle_mas_chi_GM6_F {};
    class srifle_GM6_F {};
    class srifle_GM6_camo_F {};
    class srifle_GM6_ghex_F {};
    class CUP_arifle_HK417_20 {};
    class CUP_arifle_HK417_20_Desert {};
    class CUP_arifle_HK417_20_Wood {};
    class arifle_SPAR_03_blk_F {};
    class arifle_SPAR_03_khk_F {};
    class arifle_SPAR_03_snd_F {};
    class CUP_srifle_ksvk {};
    class CUP_srifle_AWM_wdl {};
    class CUP_srifle_AWM_blk {};
    class CUP_srifle_AWM_des {};
    class ACM_Mo18L_SPR {};
    class CUP_srifle_M107_Base {};
    class CUP_srifle_M107_Pristine {};
    class CUP_srifle_M107_Desert {};
    class CUP_srifle_M107_Snow {};
    class CUP_srifle_M107_Woodland {};
    class CUP_srifle_m110_kac_black {};
    class CUP_srifle_M110_black {};
    class CUP_srifle_M110 {};
    class CUP_srifle_M110_woodland {};
    class CUP_srifle_m110_kac {};
    class CUP_srifle_m110_kac_woodland {};
    class CUP_srifle_M14_DMR {};
    class CUP_srifle_Mosin_Nagant {};
    class srifle_LRR_F {};
    class srifle_LRR_camo_F {};
    class srifle_LRR_tna_F {};
    class CUP_srifle_M2010_blk {};
    class CUP_srifle_M2010_ctrgt {};
    class CUP_srifle_M2010_ctrg {};
    class CUP_srifle_M2010_dsrt {};
    class CUP_srifle_M2010_hex {};
    class CUP_srifle_M2010_winter {};
    class CUP_srifle_M2010_wdl {};
    class CUP_srifle_M24_wdl {};
    class CUP_srifle_M24_blk {};
    class CUP_srifle_M24_des {};
    class CUP_srifle_M40A3 {};
    class CUP_arifle_Mk20 {};
    class CUP_arifle_Mk20_black {};
    class CUP_arifle_Mk20_woodland {};
    class CFP_EBR_blk_F {};
    class CUP_srifle_Mk18_blk {};
    class CFP_EBR_des2_F {};
    class CUP_srifle_Mk18_des {};
    class CFP_EBR_des_F {};
    class CFP_EBR_sage_F {};
    class CFP_EBR_wdl_F {};
    class CUP_srifle_Mk18_wdl {};
    class srifle_EBR_F {};
    class arifle_MXM_F {};
    class arifle_MXM_Black_F {};
    class arifle_MXM_khk_F {};
    class CUP_srifle_LeeEnfield {};
    class CUP_srifle_LeeEnfield_rail {};
    class srifle_DMR_02_F {};
    class srifle_DMR_02_camo_F {};
    class srifle_DMR_02_sniper_F {};
    class arifle_mas_qbz95_csnp {};
    class arifle_mas_qbz95_snp {};
    class srifle_DMR_07_blk_F {};
    class srifle_DMR_07_ghex_F {};
    class srifle_DMR_07_hex_F {};
    class CUP_srifle_RSASS_Black {};
    class CUP_srifle_RSASS_Dazzle {};
    class CUP_srifle_RSASS_Jungle {};
    class CUP_srifle_RSASS_Sand {};
    class CUP_srifle_RSASS_Winter {};
    class CUP_srifle_RSASS_WDLNet {};
    class CUP_srifle_RSASS_WDL {};
    class CUP_srifle_Remington700 {};
    class CUP_arifle_DSA_SA58_DMR {};
    class srifle_DMR_03_F {};
    class srifle_DMR_03_multicam_F {};
    class srifle_DMR_03_khaki_F {};
    class srifle_DMR_03_tan_F {};
    class srifle_DMR_03_woodland_F {};
    class CUP_srifle_SVD {};
    class CUP_srifle_SVD_des {};
    class CUP_srifle_SVD_des_top_rail {};
    class CUP_srifle_SVD_top_rail {};
    class CUP_srifle_SVD_wdl {};
    class CUP_srifle_SVD_wdl_top_rail {};
    class PSZ_Tor {};
    class srifle_DMR_01_F {};
    class CUP_srifle_VSSVintorez {};
    class CUP_srifle_VSSVintorez_flash {};
    class CUP_srifle_VSSVintorez_VFG {};
    class CUP_srifle_VSSVintorez_top_rail {};
    class CUP_srifle_VSSVintorez_flash_top {};
    class CUP_srifle_VSSVintorez_VFG_top_rail {};
};
*/
