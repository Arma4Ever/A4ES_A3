class Cfg3DEN {
    class Object {
        class AttributeCategories {
            //delete special states
            class StateSpecial {
                class Attributes {
                    delete HideObject;
                    delete EnableSimulation;
                    delete AllowDamage;
                    delete EnableStamina;
                };
            };
        };
    };
    class Mission {
        class Scenario {
            class AttributeCategories {
                //delete description ext options
                delete States;
                //delete useless SP campaign system
                delete Unlock;
                //fix not saving author in sqm
                class Presentation {
                    class Attributes {
                        delete Author;
                        class MissionAuthor {
                            property = "MissionAuthor";
                            displayName = "$STR_3DEN_Scenario_Attribute_Author_displayName";
                            tooltip = "$STR_3DEN_Scenario_Attribute_Author_tooltip";
                            control = "Edit";
                            defaultValue = "profileNameSteam";
                            expression = "";
                            condition = "true";
                        };
                    };
                };
            };
        };
        class Multiplayer {
            class AttributeCategories {
                class Lobby {
                    class Attributes {
                        //delete disable ai and autoassign options
                        delete DisabledAI;
                        delete JoinUnassigned;
                    };
                };
                //delete respawn settings
                delete Respawn;
            };
        };
        //remove garbage settings
        delete GarbageCollection;
    };
};
