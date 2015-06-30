
class CfgWeapons
{
    class Rifle_Base_F;
    class GrenadeLauncher;
    class UGL_F: GrenadeLauncher {
        magazines[] += {"ACE_HuntIR_M203"};
    };
    class rhs_weap_ak74m_Base_F: Rifle_Base_F
    {
        class GP25Muzzle: UGL_F
        {
            magazines[] += {"ACE_HuntIR_M203"};
        };
    };

    class hgun_Rook40_F;
    class rhs_weap_pya: hgun_Rook40_F
    {
        ACE_barrelTwist=254.0;
        ACE_barrelLength=111.76;
    };
    class Pistol_Base_F;
    class rhs_weap_makarov_pmm: rhs_weap_pya
    {
        ACE_barrelTwist=240.03;
        ACE_barrelLength=93.472;
    };
    class rhs_weap_ak74m: rhs_weap_ak74m_Base_F
    {
        ACE_barrelTwist=199.898;
        ACE_barrelLength=414.02;
    };
    class rhs_weap_akm: rhs_weap_ak74m
    {
        ACE_barrelTwist=199.898;
        ACE_barrelLength=414.02;
    };
    class rhs_weap_aks74;
    class rhs_weap_aks74u: rhs_weap_aks74
    {
        ACE_barrelTwist=160.02;
        ACE_barrelLength=210.82;
    };
    class rhs_weap_svd: rhs_weap_ak74m
    {
        ACE_barrelTwist=238.76;
        ACE_barrelLength=619.76;
    };
    class rhs_weap_svdp;
    class rhs_weap_svds: rhs_weap_svdp
    {
        ACE_barrelTwist=238.76;
        ACE_barrelLength=563.88;
    };
    class rhs_pkp_base;
    class rhs_weap_pkp: rhs_pkp_base
    {
        ACE_barrelTwist=240.03;
        ACE_barrelLength=657.86;
    };
    class rhs_weap_pkm: rhs_weap_pkp
    {
        ACE_barrelTwist=240.03;
        ACE_barrelLength=645.16;
    };
    class rhs_weap_rpk74m: rhs_weap_pkp
    {
        ACE_barrelTwist=195.072;
        ACE_barrelLength=589.28;
    };

    class rhs_acc_sniper_base;
    class rhs_acc_pso1m2: rhs_acc_sniper_base {
        ACE_ScopeAdjust_Vertical[] = { 0, 0 };
        ACE_ScopeAdjust_Horizontal[] = { -10, 10 };
        ACE_ScopeAdjust_VerticalIncrement = 0.0;
        ACE_ScopeAdjust_HorizontalIncrement = 0.5;
    };
    class Launcher_Base_F;
    class rhs_weap_rpg7: Launcher_Base_F {
        ace_reloadlaunchers_enabled = 1;
    };

    class rhs_weap_rpg26: Launcher_Base_F
    {
        scope = 2;
        displayName = "RPG-26";
        descriptionShort = "72.5mm, jedno-strzalowy.";
        rhs_disposable = 0;
        ACE_UsedTube = "rhs_weap_rpg26_used";
        magazines[] = {"rhs_rpg26_mag"};
        ace_overpressure_angle = 30;
        ace_overpressure_range = 4;
        ace_overpressure_damage = 0.6;
    };
    class rhs_weap_rpg26_used: rhs_weap_rpg26
    {
        scope = 1;
        weaponPoolAvailable = 0;
        displayName = "Zuzyta wyrzutnia";
        descriptionShort = "Zuzyta wyrzutnia";
        ACE_isUsedLauncher = 1;
        magazines[] = {"rhs_rpg26_mag_fired"};
        model = "\rhsafrf\addons\rhs_weapons\rpg26\rpg26_unloaded";
    };
    class rhs_weap_rshg2: rhs_weap_rpg26
    {
        scope = 2;
        displayName = "RShG-2";
        descriptionShort = "72.5mm, jedno-strzalowy.";
        rhs_disposable = 0;
        ACE_UsedTube = "rhs_weap_rshg2_used";
        magazines[] = {"rhs_rshg2_mag"};
        ace_overpressure_angle = 30;
        ace_overpressure_range = 4;
        ace_overpressure_damage = 0.6;
    };
    class rhs_weap_rshg2_used: rhs_weap_rshg2
    {
        scope = 1;
        weaponPoolAvailable = 0;
        displayName = "Zuzyta wyrzutnia";
        descriptionShort = "Zuzyta wyrzutnia";
        ACE_isUsedLauncher = 1;
        magazines[] = {"rhs_rshg2_mag_fired"};
        model = "\rhsafrf\addons\rhs_weapons\rpg26\rshg2_unloaded";
    };

};