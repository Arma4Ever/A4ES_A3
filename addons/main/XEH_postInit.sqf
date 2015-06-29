#include "script_component.hpp"

if !(isServer) exitWith {};

private "_setOption";
_setOption = {[_this select 0, _this select 1, true, true] call ace_common_fnc_setSetting;};

//advanced balistic
["ace_advanced_ballistics_enabled", false] call _setOption;
["ace_advanced_ballistics_ammoTemperatureEnabled", true] call _setOption;
["ace_advanced_ballistics_barrelLengthInfluenceEnabled", true] call _setOption;
["ace_advanced_ballistics_bulletTraceEnabled", true] call _setOption;
["ace_advanced_ballistics_simulateForEveryone", false] call _setOption;
["ace_advanced_ballistics_disabledInFullAutoMode", false] call _setOption;
["ace_advanced_ballistics_simulateForSnipers", true] call _setOption;
["ace_advanced_ballistics_simulateForGroupMembers", false] call _setOption;
["ace_advanced_ballistics_simulationInterval", 0] call _setOption;
["ace_advanced_ballistics_simulationRadius", 3000] call _setOption;

//captives
["ace_captives_allowHandcuffOwnSide", true] call _setOption;
["ace_captives_allowSurrender", true] call _setOption;

//explosives
["ace_explosives_RequireSpecialist", false] call _setOption;
["ace_explosives_PunishNonSpecialists", true] call _setOption;
["ace_explosives_ExplodeOnDefuse", true] call _setOption;

//hearing
["ace_hearing_enableCombatDeafness", true] call _setOption;

//interaction
["ace_interaction_EnableTeamManagement", true] call _setOption;

//maptr
["ace_map_mapIllumination", true] call _setOption;
["ace_map_mapShake", true] call _setOption;
["ace_map_mapLimitZoom", false] call _setOption;
["ace_map_mapShowCursorCoordinates", false] call _setOption;

//microdagr
["ace_microdagr_MapDataAvailable", 2] call _setOption;

//mk6mortar
["ace_mk6mortar_airResistanceEnabled", true] call _setOption;
["ace_mk6mortar_allowComputerRangefinder", false] call _setOption;
["ace_mk6mortar_allowCompass", true] call _setOption;

//weather
["ace_weather_enableServerController", true] call _setOption;
["ace_weather_useACEWeather", false] call _setOption;
["ace_weather_syncRain", true] call _setOption;
["ace_weather_syncWind", true] call _setOption;
["ace_weather_syncMisc", true] call _setOption;
["ace_weather_serverUpdateInterval", 60] call _setOption;

//winddeflection
["ace_winddeflection_enabled", true] call _setOption;
["ace_winddeflection_vehicleEnabled", true] call _setOption;
["ace_winddeflection_simulationInterval", 0.5] call _setOption;
["ace_winddeflection_simulationRadius", 3000] call _setOption;

//medical settings
["ace_medical_level", 2] call _setOption;
["ace_medical_medicSetting", 2] call _setOption;
["ace_medical_allowLitterCreation", true] call _setOption;
["ace_medical_litterCleanUpDelay", 1800] call _setOption;
["ace_medical_enableScreams", true] call _setOption;
["ace_medical_playerDamageThreshold", 1] call _setOption;
["ace_medical_AIDamageThreshold", 1] call _setOption;
["ace_medical_enableUnconsciousnessAI", 1] call _setOption;
["ace_medical_remoteControlledAI", true] call _setOption;
["ace_medical_preventInstaDeath", false] call _setOption;
["ace_medical_bleedingCoefficient", 1] call _setOption;
["ace_medical_painCoefficient", 1] call _setOption;
["ace_medical_keepLocalSettingsSynced", true] call _setOption;

//medical adv
["ace_medical_enableFor", 0] call _setOption;
["ace_medical_enableAdvancedWounds", true] call _setOption;
["ace_medical_medicSetting_PAK", 1] call _setOption;
["ace_medical_medicSetting_SurgicalKit", 1] call _setOption;
["ace_medical_useLocation_PAK", 2] call _setOption;
["ace_medical_consumeItem_PAK", 1] call _setOption;
["ace_medical_useLocation_SurgicalKit", 0] call _setOption;
["ace_medical_consumeItem_SurgicalKit", 0] call _setOption;
["ace_medical_healHitPointAfterAdvBandage", true] call _setOption;
["ace_medical_painIsOnlySuppressed", true] call _setOption;