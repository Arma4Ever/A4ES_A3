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
	class EventHandlers
	{
		class ENH
		{
			onTerrainNew = "call ENH_fnc_EH_onTerrainNew";
			onMissionPreviewEnd = "call ENH_fnc_EH_onMissionPreviewEnd";
			onMissionLoad = "call ENH_fnc_EH_onMissionLoad";
			onMissionNew = "call ENH_fnc_EH_onMissionNew";
			onMissionPreview = "call ENH_fnc_EH_onMissionPreview";
			onSelectionChange = "call ENH_fnc_EH_onSelectionChange";
		};
	};
	class Attributes
	{
		// Base class templates
		class Default;
		class Title: Default
		{
			class Controls
			{
				class Title;
			};
		};
		#include "ENH\controls\timeMultiplier.hpp"
		#include "ENH\controls\featureType.hpp"
		#include "ENH\controls\ambientAnimations.hpp"
		#include "ENH\controls\establishingShot.hpp"
		#include "ENH\controls\mapIndicators.hpp"
		#include "ENH\controls\groupMarker.hpp"
		#include "ENH\controls\holdAction.hpp"
		#include "ENH\controls\taskPatrol.hpp"
		#include "ENH\controls\debugOptions.hpp"
	};
 	class Mission
	{
		class Preferences
		{
			class AttributeCategories
			{
				class Misc
				{
					class Attributes
					{
						#include "ENH\attributesEditor\debugOptions.hpp"
					};
				};
				#include "ENH\attributesEditor\interface.hpp"
			};
		};
		class Intel
		{
			class AttributeCategories
			{
				#include "ENH\attributesMission\timeMultiplier.hpp"
			};
		};
		class Scenario
		{
			class AttributeCategories
			{

			};
		};
		class Multiplayer
		{
			class AttributeCategories
			{
				class Respawn
				{
					class Attributes
					{

					};
				};
			};
		};
	};
	class Group
	{
		class AttributeCategories
		{
			#include "ENH\attributesGroup\groupMarker.hpp"
			class State
			{
				class Attributes
				{
					#include "ENH\attributesGroup\taskPatrol.hpp"
				};
			};
		};
	};
	class Object
	{
		class AttributeCategories
		{
			#include "ENH\attributesObject\advancedDamageUnit.hpp"
			#include "ENH\attributesObject\advancedDamageVehicle.hpp"
			#include "ENH\attributesObject\disableAI.hpp"
			#include "ENH\attributesObject\advancedSkill.hpp"
			#include "ENH\attributesObject\unitTraits.hpp"
			#include "ENH\attributesObject\holdAction.hpp"
			class StateSpecial
			{
				class Attributes
				{
					#include "ENH\attributesObject\setCaptive.hpp"
					#include "ENH\attributesObject\allowSprint.hpp"
					#include "ENH\attributesObject\forceWalk.hpp"
					#include "ENH\attributesObject\makeHostage.hpp"
					#include "ENH\attributesObject\parachute.hpp"
					#include "ENH\attributesObject\enableHeadlights.hpp"
					#include "ENH\attributesObject\allowCrewInImmobile.hpp"
					#include "ENH\attributesObject\engineOn.hpp"
					#include "ENH\attributesObject\disableNVGE.hpp"
					#include "ENH\attributesObject\disableTIE.hpp"
					#include "ENH\attributesObject\limitSpeed.hpp"
					#include "ENH\attributesObject\doStop.hpp"
					#include "ENH\attributesObject\removeFromRemainsCollector.hpp"
					#include "ENH\attributesObject\SPRTickets.hpp"
					#include "ENH\attributesObject\debugPath.hpp"
				};
			};
			class Inventory
			{
				class Attributes
				{
					#include "ENH\attributesObject\addGunLight.hpp"
					#include "ENH\attributesObject\arsenal.hpp"
				};
			};
			class State
			{
				class Attributes
				{
					#include "ENH\attributesObject\allowFleeing.hpp"
					#include "ENH\attributesObject\setMass.hpp"
					#include "ENH\attributesObject\featureType.hpp"
					#include "ENH\attributesObject\forceFlag.hpp"
					#include "ENH\attributesObject\ambientAnimations.hpp"
				};
			};
		};
	};
};
