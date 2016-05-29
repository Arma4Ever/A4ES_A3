class GVAR(module_skipTime): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_SkipTime_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_skipTime));
    portrait = "\a3\Modules_F_Curator\Data\portraitSkiptime_ca.paa";

    class Attributes: AttributesBase {
        class time: Edit {
            displayName = CSTRING(Module_SkipTime_Time_DisplayName);
            tooltip = CSTRING(Module_SkipTime_Time_Description);
            property = QGVAR(module_skipTime_time);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class notification: CheckboxNumber {
            displayName = CSTRING(Module_SkipTime_Notification_DisplayName);
            tooltip = CSTRING(Module_SkipTime_Notification_Description);
            property = QGVAR(module_skipTime_notification);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_SkipTime_Description);
    };
};
