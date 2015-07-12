
class CfgWeapons
{
    class GrenadeLauncher;
    class UGL_F: GrenadeLauncher {
        magazines[] += {"ACE_HuntIR_M203"};
    };

    class Pistol_Base_F;
    class Rifle_Base_F;
    class srifle_EBR_F;
    class launch_O_Titan_F;

    class rhs_weap_XM2010_Base_F: Rifle_Base_F {
        ACE_barrelTwist=254.0;
        ACE_barrelLength=609.6;
    };
    class arifle_MX_Base_F;
    class rhs_weap_m4_Base: arifle_MX_Base_F {
        ACE_barrelTwist=177.8;
        ACE_barrelLength=368.3;
        class M203_GL: UGL_F
        {
            magazines[] += {"ACE_HuntIR_M203"};
        };
        class M320_GL: M203_GL
        {
            magazines[] += {"ACE_HuntIR_M203"};
        };
    };
    class rhs_weap_m4a1;
    class rhs_weap_mk18: rhs_weap_m4a1 {
        ACE_barrelTwist=177.8;
        ACE_barrelLength=261.62;
    };
    class rhs_weap_m16a4: rhs_weap_m4_Base {
        ACE_barrelTwist=177.8;
        ACE_barrelLength=508.0;
    };
    class rhs_weap_m240_base;
    class rhs_weap_m240B: rhs_weap_m240_base {
        ACE_barrelTwist=304.8;
        ACE_barrelLength=629.92;
    };
    class rhs_weap_m14ebrri: srifle_EBR_F {
        ACE_barrelTwist=304.8;
        ACE_barrelLength=558.8;
    };
    class rhs_weap_sr25: rhs_weap_m14ebrri {
        ACE_barrelTwist=285.75;
        ACE_barrelLength=609.6;
    };
    class rhs_weap_sr25_ec: rhs_weap_sr25 {
        ACE_barrelTwist=285.75;
        ACE_barrelLength=508.0;
    };
    class rhs_weap_M590_5RD: Rifle_Base_F {
        ACE_barrelTwist=0.0;
        ACE_twistDirection=0;
        ACE_barrelLength=469.9;
    };
    class rhs_weap_M590_8RD: rhs_weap_M590_5RD {
        ACE_barrelTwist=0.0;
        ACE_twistDirection=0;
        ACE_barrelLength=508.0;
    };
    class hgun_ACPC2_F;
    class rhsusf_weap_m1911a1: hgun_ACPC2_F {
        ACE_barrelTwist=406.4;
        ACE_barrelLength=127.0;
    };
    class rhsusf_acc_sniper_base;
    class rhsusf_acc_LEUPOLDMK4: rhsusf_acc_sniper_base {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
    };
    class rhsusf_acc_LEUPOLDMK4_2: rhsusf_acc_sniper_base {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
    };
    class rhs_weap_fgm148 : launch_O_Titan_F {
        ace_javelin_enabled = 1;
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = "\z\ace\addons\javelin\data\reticle_titan.p3d";

        canLock = 0;
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };

    class rhs_weap_M320_Base_F;
    class rhs_weap_M320: rhs_weap_M320_Base_F
    {
        magazines[] += {"ACE_HuntIR_M203"};
    };

    class Launcher_Base_F;
    class rhs_weap_M136: Launcher_Base_F
    {
        scope = 2;
        author = "$STR_RHSUSF_AUTHOR_FULL";
        displayName = "M136 (HEAT)";
        rhs_disposable = 0;
        ACE_UsedTube = "rhs_weap_M136_used";
        magazines[] = {"rhs_m136_mag"};
        ace_overpressure_angle = 30;
        ace_overpressure_range = 2;
        ace_overpressure_damage = 0.6;
    };
    class rhs_weap_M136_hedp: rhs_weap_M136
    {
        displayName = "M136 (HEDP)";
        ACE_UsedTube = "rhs_weap_M136_hedp_used";
        magazines[] = {"rhs_m136_hedp_mag"};
        ace_overpressure_angle = 30;
        ace_overpressure_range = 2;
        ace_overpressure_damage = 0.6;
    };
    class rhs_weap_M136_hp: rhs_weap_M136
    {
        displayName = "M136 (HP)";
        ACE_UsedTube = "rhs_weap_M136_hp_used";
        magazines[] = {"rhs_m136_hp_mag"};
        ace_overpressure_angle = 30;
        ace_overpressure_range = 2;
        ace_overpressure_damage = 0.6;
    };
    class rhs_weap_M136_used: rhs_weap_M136
    {
        scope = 1;
        weaponPoolAvailable = 0;
        displayName = "Zuzyta wyrzutnia";
        descriptionShort = "Zuzyta wyrzutnia";
        ACE_isUsedLauncher = 1;
        magazines[] = {"rhs_m136_mag_fired"};
    };
    class rhs_weap_M136_hedp_used: rhs_weap_M136_hedp
    {
        scope = 1;
        weaponPoolAvailable = 0;
        displayName = "Zuzyta wyrzutnia";
        descriptionShort = "Zuzyta wyrzutnia";
        ACE_isUsedLauncher = 1;
        magazines[] = {"rhs_m136_hedp_mag_fired"};
    };
    class rhs_weap_M136_hp_used: rhs_weap_M136_hp
    {
        scope = 1;
        weaponPoolAvailable = 0;
        displayName = "Zuzyta wyrzutnia";
        descriptionShort = "Zuzyta wyrzutnia";
        ACE_isUsedLauncher = 1;
        magazines[] = {"rhs_m136_hp_mag_fired"};
    };
};
