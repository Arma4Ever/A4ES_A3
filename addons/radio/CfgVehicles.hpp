class CfgVehicles {
    class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class ACE_Equipment {
				delete extend_antenna;
				delete retract_antenna;
				delete exchange_whip;
				delete exchange_blade;
				delete exchange_dd;
                delete tfw_radios_rf3080_place;

                class GVAR(placeMobileAntenna) {
                    displayName = CSTRING(PlaceMobileAntenna_displayName);
                    condition = QUOTE(_this call FUNC(canPlaceMobileAntenna));
                    statement = QUOTE(_this call FUNC(placeMobileAntenna));
                    showDisabled = 0;
                    exceptions[] = {};
                    icon = "";
                };
			};
		};
	};

    class Item_Base_F;
	class tfw_bladeItem: Item_Base_F {
		scope = 1;
		scopeCurator = 1;
		scopeArsenal = 1;
	};
	class tfw_ddItem: Item_Base_F {
        scope = 1;
		scopeCurator = 1;
		scopeArsenal = 1;
	};
	class tfw_whipItem: Item_Base_F {
        scope = 1;
		scopeCurator = 1;
		scopeArsenal = 1;
	};

    class ThingX;
	class tfw_rf3080Object: ThingX {
		ace_dragging_canDrag = 1;
		ace_dragging_dragPosition[] = {0,1.2,0};
		ace_dragging_dragDirection = 0;
		ace_dragging_cancarry = 1;
		ace_dragging_carryposition[] = {0,1.2,0};
		ace_dragging_carrydirection = 0;
		scope = 2;
        scopeCurator = 2;
        scopeArsenal = 2;
		displayName = "SATCOM Antenna";
        class ACE_Actions {
			class ACE_MainActions {
                delete ACE_Pickup;

				class GVAR(pickupMobileAntenna) {
					displayName = CSTRING(PickupMobileAntenna_displayName);
					distance = 4;
					condition = QUOTE(alive _target);
					statement = QUOTE(_this call FUNC(pickupMobileAntenna));
                    exceptions[] = {};
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
};
