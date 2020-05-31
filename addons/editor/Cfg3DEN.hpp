class Cfg3DEN {
	class Notifications {
        #include "ENH\notifications.hpp"
	};
	class EventHandlers {
		class ENH {
			onTerrainNew = "call ENH_fnc_EH_onTerrainNew";
			onMissionPreviewEnd = "call ENH_fnc_EH_onMissionPreviewEnd";
			onMissionLoad = "call ENH_fnc_EH_onMissionLoad";
			onMissionNew = "call ENH_fnc_EH_onMissionNew";
			onSelectionChange = "call ENH_fnc_EH_onSelectionChange";
		};
        class ADDON {
            onUndo = "diag_log '3DEN event: onUndo';";
			onRedo = "diag_log '3DEN event: onRedo';";
			onHistoryChange = "diag_log '3DEN event: onHistoryChange';";
			onWidgetToggle = "diag_log '3DEN event: onWidgetToggle';";
			onWidgetNone = "diag_log '3DEN event: onWidgetNone';";
			onWidgetTranslation = "diag_log '3DEN event: onWidgetTranslation';";
			onWidgetRotation = "diag_log '3DEN event: onWidgetRotation';";
			onWidgetScale = "diag_log '3DEN event: onWidgetScale';";
			onWidgetArea = "diag_log '3DEN event: onWidgetArea';";
			onGridChange = "diag_log '3DEN event: onGridChange';";
			onMoveGridToggle = "diag_log '3DEN event: onMoveGridToggle';";
			onRotateGridToggle = "diag_log '3DEN event: onRotateGridToggle';";
			onScaleGridToggle = "diag_log '3DEN event: onScaleGridToggle';";
			onVerticalToggle = "diag_log '3DEN event: onVerticalToggle';";
			onSurfaceSnapToggle = "diag_log '3DEN event: onSurfaceSnapToggle';";
			onWorkspacePartSwitch = "diag_log '3DEN event: onWorkspacePartSwitch';";
			onModeChange = "diag_log '3DEN event: onModeChange';";
			onSubmodeChange = "diag_log '3DEN event: onSubmodeChange';";
			onMapOpened = "diag_log '3DEN event: onMapOpened';";
			onMapClosed = "diag_log '3DEN event: onMapClosed';";
			onSearchEdit = "diag_log '3DEN event: onSearchEdit';";
			onSearchCreate = "diag_log '3DEN event: onSearchCreate';";
			onMissionListChange = "diag_log '3DEN event: onMissionListChange';";
			onMissionPreview = "diag_log '3DEN event: onMissionPreview';";
			onMissionPreviewEnd = "diag_log '3DEN event: onMissionPreviewEnd';";
			init = "diag_log '3DEN event: init';";
			onTerrainNew = "diag_log '3DEN event: onTerrainNew';";
			onMissionNew = "diag_log '3DEN event: onMissionNew';";
			onMissionLoad = "diag_log '3DEN event: onMissionLoad';";
			onMissionAutosave = "diag_log '3DEN event: onMissionAutosave';";
			onMessage = "diag_log '3DEN event: onMessage';";
			onServerToggle = "diag_log '3DEN event: onServerToggle';";
			onEntityMenu = "diag_log '3DEN event: onEntityMenu';";
			onSelectionChange = "diag_log '3DEN event: onSelectionChange';";
			onConnectingStart = "diag_log '3DEN event: onConnectingStart';";
			onConnectingEnd = "diag_log '3DEN event: onConnectingEnd';";
			onTogglePlaceEmptyVehicle = "diag_log '3DEN event: onTogglePlaceEmptyVehicle';";
        };
	};
	class Attributes {
		class Default;
		class Title: Default {
			class Controls {
				class Title;
			};
		};

        #include "ENH\controls\timeMultiplier.hpp"
	};
 	class Mission {
		class Preferences {
			class AttributeCategories {
				class Misc {
					class Attributes {

					};
				};
				#include "ENH\attributesEditor\interface.hpp"
			};
		};
		class Intel {
			class AttributeCategories {
				#include "ENH\attributesMission\timeMultiplier.hpp"
			};
		};

	};
	class Group {
		class AttributeCategories {
			class State {
				class Attributes {

				};
			};
		};
	};
	class Object {
		class AttributeCategories {
			class StateSpecial {
				class Attributes {

				};
			};
			class Inventory {
				class Attributes {

				};
			};
			class State {
				class Attributes {

				};
			};
		};
	};
};
