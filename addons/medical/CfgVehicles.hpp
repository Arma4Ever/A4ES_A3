class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Items_base_F;
    class Item_Base_F;

    class GVAR(painkillersItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Painkillers_DisplayName);
        author = "Alganthe";
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(A4ES_painkillers,1);
        };
    };

    class GVAR(dressingSet): Items_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        displayName= CSTRING(DressingSet_Display);
        scope = 2;
        scopeCurator = 2;
        mapSize = 0.67000002;
        editorPreview = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Land_FirstAidKit_01_open_F.jpg";
        model = "\A3\Props_F_Orange\Humanitarian\Camps\FirstAidKit_01_open_F.p3d";
        DLC = "Orange";
		icon = "iconObject_2x3";
		editorSubcategory = "EdSubcat_Medicine";
		destrType = "DestructNo";

        ace_dragging_canCarry = 1;
        ace_dragging_carryPosition[] = {0, 1.2, 0};

        class ACE_Actions {
			class ACE_MainActions {
                displayName = "$STR_ACE_Interaction_MainAction";
                selection = "";
                distance = 3;
                condition = "true";

				class GVAR(pickUpDressingSet) {
					displayName = CSTRING(ActionPickUpDressingSet);
					distance = 3;
					condition = QUOTE(alive _target);
					statement = QUOTE(_this call FUNC(pickUpDressingSet));
                    exceptions[] = {};
					showDisabled = 0;
					icon = "";
				};
			};
		};
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ADDON {
                    displayName = CSTRING(ActionPlaceDressingSet);
                    condition = QUOTE(_player call FUNC(canPlaceDressingSet));
                    statement = QUOTE(_player call FUNC(placeDressingSet));
                };
            };
        };
    };
};
