#include "script_component.hpp"

if !(isServer) exitWith {};

//[_settingName, _logic getVariable _moduleVariable, true, true] call FUNC(setSetting);

//advanced balistic
["ace_advanced_ballistics_enabled", false, true, true] call ace_common_fnc_setSetting;
["ace_advanced_ballistics_ammoTemperatureEnabled", true, true, true] call ace_common_fnc_setSetting;
["ace_advanced_ballistics_barrelLengthInfluenceEnabled", true, true, true] call ace_common_fnc_setSetting;
["ace_advanced_ballistics_bulletTraceEnabled", true, true, true] call ace_common_fnc_setSetting;
["ace_advanced_ballistics_simulateForEveryone", false, true, true] call ace_common_fnc_setSetting;
["ace_advanced_ballistics_disabledInFullAutoMode", false, true, true] call ace_common_fnc_setSetting;
["ace_advanced_ballistics_simulateForSnipers", true, true, true] call ace_common_fnc_setSetting;
["ace_advanced_ballistics_simulateForGroupMembers", false, true, true] call ace_common_fnc_setSetting;
["ace_advanced_ballistics_simulationInterval", 0, true, true] call ace_common_fnc_setSetting;
["ace_advanced_ballistics_simulationRadius", 3000, true, true] call ace_common_fnc_setSetting;

//captives
["ace_captives_allowHandcuffOwnSide", true, true, true] call ace_common_fnc_setSetting;
["ace_captives_allowSurrender", true, true, true] call ace_common_fnc_setSetting;

//explosives
["ace_explosives_RequireSpecialist", false, true, true] call ace_common_fnc_setSetting;
["ace_explosives_PunishNonSpecialists", true, true, true] call ace_common_fnc_setSetting;
["ace_explosives_ExplodeOnDefuse", true, true, true] call ace_common_fnc_setSetting;

//hearing
["ace_hearing_enableCombatDeafness", true, true, true] call ace_common_fnc_setSetting;

//interaction
["ace_interaction_EnableTeamManagement", true, true, true] call ace_common_fnc_setSetting;

//maptr
["ace_map_mapIllumination", true, true, true] call ace_common_fnc_setSetting;
["ace_map_mapShake", true, true, true] call ace_common_fnc_setSetting;
["ace_map_mapLimitZoom", false, true, true] call ace_common_fnc_setSetting;
["ace_map_mapShowCursorCoordinates", false, true, true] call ace_common_fnc_setSetting;

//microdagr
["ace_microdagr_MapDataAvailable", 2, true, true] call ace_common_fnc_setSetting;

//mk6mortar
["ace_mk6mortar_airResistanceEnabled", true, true, true] call ace_common_fnc_setSetting;
["ace_mk6mortar_allowComputerRangefinder", false, true, true] call ace_common_fnc_setSetting;
["ace_mk6mortar_allowCompass", true, true, true] call ace_common_fnc_setSetting;

//weather
["ace_weather_enableServerController", false, true, true] call ace_common_fnc_setSetting;
["ace_weather_useACEWeather", false, true, true] call ace_common_fnc_setSetting;
["ace_weather_syncRain", true, true, true] call ace_common_fnc_setSetting;
["ace_weather_syncWind", true, true, true] call ace_common_fnc_setSetting;
["ace_weather_syncMisc", true, true, true] call ace_common_fnc_setSetting;
["ace_weather_serverUpdateInterval", 60, true, true] call ace_common_fnc_setSetting;

//winddeflection
["ace_winddeflection_enabled", true, true, true] call ace_common_fnc_setSetting;
["ace_winddeflection_vehicleEnabled", true, true, true] call ace_common_fnc_setSetting;
["ace_winddeflection_simulationInterval", 0.5, true, true] call ace_common_fnc_setSetting;
["ace_winddeflection_simulationRadius", 3000, true, true] call ace_common_fnc_setSetting;

//medical
["ace_medical_level", 2, true, true] call ace_common_fnc_setSetting;
["ace_medical_medicSetting", 2, true, true] call ace_common_fnc_setSetting;
["ace_medical_allowLitterCreation", true, true, true] call ace_common_fnc_setSetting;
["ace_medical_litterCleanUpDelay", 1800, true, true] call ace_common_fnc_setSetting;
["ace_medical_enableScreams", true, true, true] call ace_common_fnc_setSetting;
["ace_medical_playerDamageThreshold", 1, true, true] call ace_common_fnc_setSetting;
["ace_medical_AIDamageThreshold", 1, true, true] call ace_common_fnc_setSetting;
["ace_medical_enableUnconsciousnessAI", 1, true, true] call ace_common_fnc_setSetting;
["ace_medical_remoteControlledAI", true, true, true] call ace_common_fnc_setSetting;
["ace_medical_preventInstaDeath", false, true, true] call ace_common_fnc_setSetting;
["ace_medical_bleedingCoefficient", 1, true, true] call ace_common_fnc_setSetting;
["ace_medical_painCoefficient", 1, true, true] call ace_common_fnc_setSetting;
["ace_medical_keepLocalSettingsSynced", true, true, true] call ace_common_fnc_setSetting;

["ace_medical_enableFor", 0, true, true] call ace_common_fnc_setSetting;
["ace_medical_enableAdvancedWounds", true, true, true] call ace_common_fnc_setSetting;
["ace_medical_medicSetting_PAK", 1, true, true] call ace_common_fnc_setSetting;
["ace_medical_medicSetting_SurgicalKit", 1, true, true] call ace_common_fnc_setSetting;
["ace_medical_consumeItem_PAK", 1, true, true] call ace_common_fnc_setSetting;
["ace_medical_consumeItem_SurgicalKit", 1, true, true] call ace_common_fnc_setSetting;
["ace_medical_useLocation_PAK", 0, true, true] call ace_common_fnc_setSetting;
["ace_medical_useLocation_SurgicalKit", 0, true, true] call ace_common_fnc_setSetting;
["ace_medical_healHitPointAfterAdvBandage", false, true, true] call ace_common_fnc_setSetting;
["ace_medical_painIsOnlySuppressed", true, true, true] call ace_common_fnc_setSetting;