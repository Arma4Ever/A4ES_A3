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
