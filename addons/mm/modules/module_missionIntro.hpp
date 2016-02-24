class GVAR(module_missionIntro): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_MissionIntro_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_missionIntro));
    isTriggerActivated = 0;

    class Attributes: AttributesBase {
        class enable: CheckboxNumber {
            displayName = CSTRING(Module_MissionIntro_Enable_DisplayName);
            tooltip = CSTRING(Module_MissionIntro_Enable_Description);
            property = QGVAR(module_missionIntro_enable);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class enableInSP: CheckboxNumber {
            displayName = CSTRING(Module_MissionIntro_EnableInSP_DisplayName);
            tooltip = CSTRING(Module_MissionIntro_EnableInSP_Description);
            property = QGVAR(module_missionIntro_enableInSP);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_MissionIntro_Description);
    };
};
