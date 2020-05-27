class Cfg3DEN {
	class Notifications {
		class ENH_DataCopied {
			isWarning = 0;
			text = $STR_A3_RSCDISPLAYARSENAL_MESSAGE_CLIPBOARD;
		};
		class ENH_ActionPerformed {
			isWarning = 0;
			text = $STR_ENH_NOTIFICATIONS_ACTIONPERFORMED;
		};
		class ENH_NoEntitiesSelected{
			isWarning = 1;
			text = $STR_ENH_NOTIFICATIONS_NOENTITIESSELECTED;
		};
	};
	class EventHandlers {
		class ENH {
			onTerrainNew = "call ENH_fnc_EH_onTerrainNew";
			onMissionPreviewEnd = "call ENH_fnc_EH_onMissionPreviewEnd";
			onMissionLoad = "call ENH_fnc_EH_onMissionLoad";
			onMissionNew = "call ENH_fnc_EH_onMissionNew";
			onSelectionChange = "call ENH_fnc_EH_onSelectionChange";
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
