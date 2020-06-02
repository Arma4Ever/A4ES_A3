class Cfg3DEN {
	class Attributes {
		class Default;
		class Title: Default {
			class Controls {
				class Title;
			};
		};
        class Combo: Title {};
        class Edit: Title {};
        class ModuleInfo: Default {};

        class GVAR(moduleShortDescription): ModuleInfo {
            attributeLoad = QUOTE(_this call FUNC(moduleShortDescription_attributeLoad));
        };

        class GVAR(moduleWarnings): ModuleInfo {
            attributeLoad = QUOTE(_this call FUNC(moduleWarnings_attributeLoad));
        };

        class GVAR(dynamicCombo): Combo {
			attributeLoad = QUOTE(_this call FUNC(dynamicCombo_attributeLoad));
        };

        class GVAR(dynamicEdit): Edit {
			attributeLoad = QUOTE(_this call FUNC(dynamicEdit_attributeLoad));
		};

        class GVAR(moduleDescription): ModuleInfo {
            attributeLoad = QUOTE(_this call FUNC(moduleDescription_attributeLoad));
        };
	};
    class EventHandlers {
        class ADDON {
			onMissionNew = QUOTE(call FUNC(initWarnings));
			onMissionLoad = QUOTE(call FUNC(initWarnings));
            onMissionPreviewEnd = QUOTE(call FUNC(initWarnings));
        };
	};
};
