class GVAR(module_colorCorrections): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_ColorCorrections_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_colorCorrections));
    portrait = "\a3\Modules_F_Curator\Data\portraitPostprocess_ca.paa";
    isTriggerActivated = 0;
    execIn3DEN = 1;

    class Attributes: AttributesBase {
        class effecttype: Combo {
            displayName = CSTRING(Module_ColorCorrections_EffectType_DisplayName);
            tooltip = CSTRING(Module_ColorCorrections_EffectType_Description);
            property = QGVAR(module_colorCorrections_effectType);
            defaultValue = "'dayzsa'";
            class values {
                class dayzsa {name = CSTRING(Module_ColorCorrections_EffectType_DayZSA_DisplayName); value = "dayzsa"; default = 1;};
                class ofp {name = CSTRING(Module_ColorCorrections_EffectType_OFP_DisplayName); value = "ofp"; default = 0;};
                class arma2 {name = CSTRING(Module_ColorCorrections_EffectType_Arma2_DisplayName); value = "arma2"; default = 0;};
                class arma2oa {name = CSTRING(Module_ColorCorrections_EffectType_Arma2OA_DisplayName); value = "arma2oa"; default = 0;};
                class winter {name = CSTRING(Module_ColorCorrections_EffectType_Winter_DisplayName); value = "winter"; default = 0;};
                class spring {name = CSTRING(Module_ColorCorrections_EffectType_Spring_DisplayName); value = "spring"; default = 0;};
                class autumn {name = CSTRING(Module_ColorCorrections_EffectType_Autumn_DisplayName); value = "autumn"; default = 0;};
                class sunnyday {name = CSTRING(Module_ColorCorrections_EffectType_SunnyDay_DisplayName); value = "sunnyday"; default = 0;};
                class rainyday {name = CSTRING(Module_ColorCorrections_EffectType_RainyDay_DisplayName); value = "rainyday"; default = 0;};
                class africa {name = CSTRING(Module_ColorCorrections_EffectType_Africa_DisplayName); value = "africa"; default = 0;};
                class desert {name = CSTRING(Module_ColorCorrections_EffectType_Desert_DisplayName); value = "desert"; default = 0;};
                class postapo {name = CSTRING(Module_ColorCorrections_EffectType_PostApo_DisplayName); value = "postapo"; default = 0;};
            };
        };
        class enableInEden: CheckboxNumber {
            displayName = CSTRING(Module_ColorCorrections_EnableInEden_DisplayName);
            tooltip = CSTRING(Module_ColorCorrections_EnableInEden_Description);
            property = QGVAR(module_colorCorrections_enableInEden);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_ColorCorrections_Description);
    };
};
