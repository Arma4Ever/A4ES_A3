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

        class GVAR(dynamicCombo): Combo {
			attributeLoad = QUOTE(_this call FUNC(dynamicCombo_attributeLoad));
		};

        class GVAR(dynamicEdit): Edit {
			attributeLoad = QUOTE(_this call FUNC(dynamicEdit_attributeLoad));
		};

        class GVAR(moduleDescription): ModuleInfo {
            attributeLoad = "[_this,_config] call bis_fnc_3DENModuleDescription;";
        };
	};
};
