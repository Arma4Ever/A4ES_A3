class GVAR(module_genFire): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_GenFire_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_genFire));

    class Attributes: AttributesBase {
        class duration: Edit {
            displayName = CSTRING(Module_GenFire_Duration_DisplayName);
            tooltip = CSTRING(Module_GenFire_Duration_Description);
            property = QGVAR(module_genFire_duration);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class colorR: Edit {
            displayName = CSTRING(Module_GenFire_ColorR_DisplayName);
            tooltip = CSTRING(Module_GenFire_ColorR_Description);
            property = QGVAR(module_genFire_colorR);
            typeName = "NUMBER";
            defaultValue = 0.5;
        };
        class colorG: Edit {
            displayName = CSTRING(Module_GenFire_ColorG_DisplayName);
            tooltip = CSTRING(Module_GenFire_ColorG_Description);
            property = QGVAR(module_genFire_colorG);
            typeName = "NUMBER";
            defaultValue = 0.5;
        };
        class colorB: Edit {
            displayName = CSTRING(Module_GenFire_ColorB_DisplayName);
            tooltip = CSTRING(Module_GenFire_ColorB_Description);
            property = QGVAR(module_genFire_colorB);
            typeName = "NUMBER";
            defaultValue = 0.5;
        };
        class damage: Edit {
            displayName = CSTRING(Module_GenFire_Damage_DisplayName);
            tooltip = CSTRING(Module_GenFire_Damage_Description);
            property = QGVAR(module_genFire_damage);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class effectSize: Edit {
            displayName = CSTRING(Module_GenFire_EffectSize_DisplayName);
            tooltip = CSTRING(Module_GenFire_EffectSize_Description);
            property = QGVAR(module_genFire_effectSize);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class particleDensity: Edit {
            displayName = CSTRING(Module_GenFire_ParticleDensity_DisplayName);
            tooltip = CSTRING(Module_GenFire_ParticleDensity_Description);
            property = QGVAR(module_genFire_particleDensity);
            typeName = "NUMBER";
            defaultValue = 25;
        };
        class particleLifetime: Edit {
            displayName = CSTRING(Module_GenFire_ParticleLifetime_DisplayName);
            tooltip = CSTRING(Module_GenFire_ParticleLifetime_Description);
            property = QGVAR(module_genFire_particleLifetime);
            typeName = "NUMBER";
            defaultValue = 0.6;
        };
        class particleSize: Edit {
            displayName = CSTRING(Module_GenFire_ParticleSize_DisplayName);
            tooltip = CSTRING(Module_GenFire_ParticleSize_Description);
            property = QGVAR(module_genFire_particleSize);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class particleSpeed: Edit {
            displayName = CSTRING(Module_GenFire_ParticleSpeed_DisplayName);
            tooltip = CSTRING(Module_GenFire_ParticleSpeed_Description);
            property = QGVAR(module_genFire_particleSpeed);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class particleDir: Edit {
            displayName = CSTRING(Module_GenFire_ParticleDir_DisplayName);
            tooltip = CSTRING(Module_GenFire_ParticleDir_Description);
            property = QGVAR(module_genFire_particleDir);
            typeName = "NUMBER";
            defaultValue = 0;
        };

        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        position = 1;
        description = CSTRING(Module_GenFire_Description);
    };
};
