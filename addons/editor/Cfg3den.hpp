class ctrlToolbox;

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            //delete vanilla special states
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
    class Attributes {
        class Default;
        class TitleWide: Default {
            class Controls;
        };
        class AmmoBox: TitleWide {
            class Controls: Controls {
                class Type: ctrlToolbox {
                    //disable virutal boxes
                    //strings[] = {"$STR_3den_attributes_ammobox_type_default"};
                };
            };
        };
    };
    class Trigger {
        class AttributeCategories {
            //Remove effects from triggers
            delete Effects;
        };
    };
    //CBA preInit fix
    class EventHandlers {
        class ADDON {
            OnMissionLoad = "[] call CBA_fnc_preInit;";
            OnMissionNew = "[] call CBA_fnc_preInit;";
            OnMissionPreview = "[] call CBA_fnc_preInit;";
            OnMissionPreviewEnd = "[] call CBA_fnc_preInit;";
            OnTerrainNew = "[] call CBA_fnc_preInit;";
        };
    };
};
