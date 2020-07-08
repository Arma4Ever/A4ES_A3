class Cfg3DEN {
	class Object {
        class AttributeCategories {
            class StateSpecial {
    			class Attributes {
                    class GVAR(disableTransfer) {
    					property = QGVAR(disableTransfer);
    					control = "Checkbox";
    					displayName = CSTRING(Attributes_disableTransfer);
    					tooltip = CSTRING(Attributes_disableTransfer_object_tooltip);
                        condition = "objectControllable + objectVehicle";
                        // Save this var only on server because only server manages transfers
                        expression = "_this setVariable ['%s', _value];";
                        defaultValue = "false";
    				};
    			};
    		};
        };
	};
    class Group {
        class AttributeCategories {
            class State {
    			class Attributes {
                    class GVAR(disableTransfer) {
    					property = QGVAR(disableTransfer);
    					control = "Checkbox";
    					displayName = CSTRING(Attributes_disableTransfer);
    					tooltip = CSTRING(Attributes_disableTransfer_group_tooltip);
                        // Save this var only on server becouse only server manages transfers
                        expression = "_this setVariable ['%s', _value];";
                        defaultValue = "false";
    				};
    			};
    		};
        };
	};
};
