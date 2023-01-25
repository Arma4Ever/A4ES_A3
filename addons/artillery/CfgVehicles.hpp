class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class ACE_Equipment {
                class GVAR(placeMobileRadar) {
                    displayName = CSTRING(placeMobileRadar_displayName);
                    condition = QUOTE(_this call FUNC(canPlaceMobileRadar));
                    statement = QUOTE(_this call FUNC(placeMobileRadar));
                    showDisabled = 0;
                    exceptions[] = {};
                    icon = "";
                };
			};
		};
	};

    class OmniDirectionalAntenna_01_black_F;
	class a4es_mobileArtilleryRadar: OmniDirectionalAntenna_01_black_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        scope = 2;
        scopeCurator = 2;
        scopeArsenal = 2;
		displayName = CSTRING(mobileArtilleryRadar_displayName);
		ace_dragging_cancarry = 1;
		ace_dragging_carryposition[] = {0, 1.2, 0};
		ace_dragging_carrydirection = 0;

        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ACE_Interaction_MainAction";
                selection = "";
                distance = 3;
                condition = "true";

				class GVAR(pickupMobileRadar) {
					displayName = CSTRING(PickupMobileRadar_displayName);
					distance = 4;
					condition = QUOTE(alive _target);
					statement = QUOTE(_this call FUNC(pickupMobileRadar));
                    exceptions[] = {};
					showDisabled = 0;
					icon = "";
				};
                class GVAR(openRadarDialog) {
					displayName = CSTRING(openRadarDialog_displayName);
					distance = 4;
					condition = QUOTE(alive _target);
					statement = QUOTE(_this call FUNC(openRadarDialog));
                    exceptions[] = {};
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
};
