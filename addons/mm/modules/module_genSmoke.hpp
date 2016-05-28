class GVAR(module_genSmoke): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_GenSmoke_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_genSmoke));

    class Attributes: AttributesBase {
        class duration: Edit {
            displayName = CSTRING(Module_GenFire_Duration_DisplayName);
            tooltip = CSTRING(Module_GenFire_Duration_Description);
            property = QGVAR(module_genSmoke_duration);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class colorR: Edit {
            displayName = CSTRING(Module_GenFire_ColorR_DisplayName);
            tooltip = CSTRING(Module_GenFire_ColorR_Description);
            property = QGVAR(module_genSmoke_colorR);
            typeName = "NUMBER";
            defaultValue = 0.5;
        };
        class colorG: Edit {
            displayName = CSTRING(Module_GenFire_ColorG_DisplayName);
            tooltip = CSTRING(Module_GenFire_ColorG_Description);
            property = QGVAR(module_genSmoke_colorG);
            typeName = "NUMBER";
            defaultValue = 0.5;
        };
        class colorB: Edit {
            displayName = CSTRING(Module_GenFire_ColorB_DisplayName);
            tooltip = CSTRING(Module_GenFire_ColorB_Description);
            property = QGVAR(module_genSmoke_colorB);
            typeName = "NUMBER";
            defaultValue = 0.5;
        };
        class colorA: Edit {
            displayName = CSTRING(Module_GenSmoke_ColorA_DisplayName);
            tooltip = CSTRING(Module_GenSmoke_ColorA_Description);
            property = QGVAR(module_genSmoke_colorA);
            typeName = "NUMBER";
            defaultValue = 0.5;
        };
        class effectSize: Edit {
            displayName = CSTRING(Module_GenFire_EffectSize_DisplayName);
            tooltip = CSTRING(Module_GenFire_EffectSize_Description);
            property = QGVAR(module_genSmoke_effectSize);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class particleDensity: Edit {
            displayName = CSTRING(Module_GenFire_ParticleDensity_DisplayName);
            tooltip = CSTRING(Module_GenFire_ParticleDensity_Description);
            property = QGVAR(module_genSmoke_particleDensity);
            typeName = "NUMBER";
            defaultValue = 10;
        };
        class particleLifetime: Edit {
            displayName = CSTRING(Module_GenFire_ParticleLifetime_DisplayName);
            tooltip = CSTRING(Module_GenFire_ParticleLifetime_Description);
            property = QGVAR(module_genSmoke_particleLifetime);
            typeName = "NUMBER";
            defaultValue = 45;
        };
        class particleSize: Edit {
            displayName = CSTRING(Module_GenFire_ParticleSize_DisplayName);
            tooltip = CSTRING(Module_GenFire_ParticleSize_Description);
            property = QGVAR(module_genSmoke_particleSize);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class effectExpansion: Edit {
            displayName = CSTRING(Module_GenSmoke_EffectExpansion_DisplayName);
            tooltip = CSTRING(Module_GenSmoke_EffectExpansion_Description);
            property = QGVAR(module_genSmoke_effectExpansion);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class particleSpeed: Edit {
            displayName = CSTRING(Module_GenFire_ParticleSpeed_DisplayName);
            tooltip = CSTRING(Module_GenFire_ParticleSpeed_Description);
            property = QGVAR(module_genSmoke_particleSpeed);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class particleLifting: Edit {
            displayName = CSTRING(Module_GenSmoke_ParticleLifting_DisplayName);
            tooltip = CSTRING(Module_GenSmoke_ParticleLifting_Description);
            property = QGVAR(module_genSmoke_particleLifting);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class windEffect: Edit {
            displayName = CSTRING(Module_GenSmoke_WindEffect_DisplayName);
            tooltip = CSTRING(Module_GenSmoke_WindEffect_Description);
            property = QGVAR(module_genSmoke_windEffect);
            typeName = "NUMBER";
            defaultValue = 1;
        };

        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        position = 1;
        description = CSTRING(Module_GenSmoke_Description);
    };
};
