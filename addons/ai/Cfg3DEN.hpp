
class Cfg3DEN {
	class Attributes {
        class Default;
        class Title: Default {
			class Controls {
				class Title: ctrlStatic {};
                class EGVAR(modules,description): ctrlStructuredText {};
			};
		};
        class Slider: Title {
			class Controls: Controls {
				class Title: Title {};
				class Value: ctrlXSliderH {};
				class Edit: ctrlEdit {};
                class EGVAR(modules,description): EGVAR(modules,description) {};
			};
		};
        class Skill: Slider {
            attributeLoad = QUOTE(_this call FUNC(skill_attributeLoad););
            h = "10 * (pixelH * pixelGrid * 0.50)";

            class Controls: Controls {
                class Title: Title {};
                class Value: Value {
                    sliderRange[] = {0, 1};
                };
                class Edit: Edit {};
                class EGVAR(modules,description): EGVAR(modules,description) {
                    idc = 105;
                    y = "5.5 * (pixelH * pixelGrid * 0.50)";
                    h = "4.5 * (pixelH * pixelGrid * 0.50)";
                };
            };
        };
    };
    class Object {
        class AttributeCategories {
            class lambs_danger_attributes {
                class Attributes {
                    delete lambs_WP_Editor_IsArtillery;
                };
            };
            class State {
                class Attributes {
                    delete Skill;

                    class GVAR(skill) {
						displayName = CSTRING(skill_displayName);
						tooltip = CSTRING(skill_tooltip);
                        control = "Skill";
                        property = QGVAR(skill);
                        typeName = "NUMBER";
                        defaultValue = "0.5";
                        expression = "_this setSkill _value;";
                        condition = "objectBrain";
					};

                    class GVAR(defenderBehaviour) {
						displayName = CSTRING(defenderBehaviour_displayName);
						tooltip = CSTRING(defenderBehaviour_tooltip);
                        control = "Combo";
                        property = QGVAR(defenderBehaviour);
                        typeName = "NUMBER";
                        defaultValue = "0";
                        expression = QUOTE(if (_value > 0) then {_this setVariable [ARR_3(QQGVAR(defenderBehaviour),_value,true)];_this call FUNC(defenderBehaviour);};);
                        condition = "objectBrain";

                        class values {
                            class disabled {
                                name = CSTRING(defenderBehaviour_Attributes_disabled_name);
                                tooltip = CSTRING(defenderBehaviour_Attributes_disabled_tooltip);
                                value = 0;
                                default = 1;
                            };
                            class up {
                                name = CSTRING(defenderBehaviour_Attributes_up_name);
                                tooltip = CSTRING(defenderBehaviour_Attributes_up_tooltip);
                                value = 1;
                            };
                            class middle {
                                name = CSTRING(defenderBehaviour_Attributes_middle_name);
                                tooltip = CSTRING(defenderBehaviour_Attributes_middle_tooltip);
                                value = 2;
                            };
                        };
					};
                };
            };
        };
    };
};
