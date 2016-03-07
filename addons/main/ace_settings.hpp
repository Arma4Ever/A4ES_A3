class ACE_Settings {
    /*************************
        Options menu
    *************************/

    class ace_interact_menu_AlwaysUseCursorInteraction {
        value = 1; //yes
        typeName = "BOOL";
        isClientSettable = 1;
    };
    class ace_optionsmenu_optionMenuDisplaySize {
        value = 2; //large
        typeName = "SCALAR";
        isClientSettable = 1;
    };
    class ace_medical_painEffectType {
        value = 0; //White flashing
        typeName = "SCALAR";
        isClientSettable = 0;
    };
    class ace_missileguidance_enabled {
        value = 2; //PlayerAndAi
        typeName = "SCALAR";
        isClientSettable = 0;
    };
    class ace_movement_useImperial {
        value = 0; //false
        typeName = "BOOL";
        isClientSettable = 0;
    };
    class ace_optionsmenu_showNewsOnMainMenu {
        value = 0; //dont showNewsOnMainMenu
        typeName = "BOOL";
        isClientSettable = 0;
    };
    class ace_medical_menuTypeStyle {
        value = 2; //disabled
        typeName = "SCALAR";
        isClientSettable = 0;
    };
    class ace_medical_menu_useMenu {
        value = 1; //enabled
        typeName = "SCALAR";
        isClientSettable = 0;
    };
    class ace_interact_menu_addBuildingActions {
        value = 1; //enabled
        typeName = "BOOL";
        isClientSettable = 0;
    };

    /****** ace_medical ******/
    class ace_medical_level {
        value = 2; //advanced
        typeName = "SCALAR";
    };
    class ace_medical_medicSetting {
        value = 2; //advanced
        typeName = "SCALAR";
    };
    class ace_medical_allowLitterCreation {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_medical_litterCleanUpDelay {
        value = 1800; //1800s
        typeName = "SCALAR";
    };
    class ace_medical_enableScreams {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_medical_playerDamageThreshold {
        value = 1; //100% normal damage
        typeName = "SCALAR";
    };
    class ace_medical_AIDamageThreshold {
        value = 2; //200% normal damage
        typeName = "SCALAR";
    };
    class ace_medical_enableUnconsciousnessAI {
        value = 1; //50/50
        typeName = "SCALAR";
    };
    class ace_medical_remoteControlledAI {
        value = 1; //treat remote ai as ai not player
        typeName = "BOOL";
    };
    class ace_medical_preventInstaDeath {
        value = 1; //yes //testing
        typeName = "BOOL";
    };
    class ace_medical_bleedingCoefficient {
        value = 1; //100% normal bleeding
        typeName = "SCALAR";
    };
    class ace_medical_painCoefficient {
        value = 1; //100% normal pain
        typeName = "SCALAR";
    };
    class ace_medical_keepLocalSettingsSynced {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_medical_enableFor {
        value = 0; //players only
        typeName = "SCALAR";
    };
    class ace_medical_enableAdvancedWounds {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_medical_medicSetting_PAK {
        value = 1; //medics only
        typeName = "SCALAR";
    };
    class ace_medical_medicSetting_SurgicalKit {
        value = 1; //medics only
        typeName = "SCALAR";
    };
    class ace_medical_consumeItem_PAK {
        value = 1; //yes
        typeName = "SCALAR";
    };
    class ace_medical_consumeItem_SurgicalKit {
        value = 0; //no
        typeName = "SCALAR";
    };
    class ace_medical_useLocation_PAK {
        value = 0; //anywhere
        typeName = "SCALAR";
    };
    class ace_medical_useLocation_SurgicalKit {
        value = 0; //anywhere
        typeName = "SCALAR";
    };
    class ace_medical_useCondition_PAK {
        value = 0; //anytime
        typeName = "SCALAR";
    };
    class ace_medical_useCondition_SurgicalKit {
        value = 0; //anytime
        typeName = "SCALAR";
    };
    class ace_medical_healHitPointAfterAdvBandage {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_medical_painIsOnlySuppressed {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_medical_enableRevive {
        value = 0; //disabled
        typeName = "SCALAR";
    };
    class ace_medical_maxReviveTime {
        value = 120; //w/e
        typeName = "SCALAR";
    };
    class ace_medical_amountOfReviveLives {
        value = -1; //w/e
        typeName = "SCALAR";
    };
    class ace_medical_increaseTrainingInLocations {
        value = 1; //yes
        typeName = "BOOL";
    };

    /****** ace_cargo ******/
    class ace_cargo_enable {
        value = 1; //yes
        typeName = "BOOL";
    };

    /****** ace_repair ******/
    class ace_repair_engineerSetting_Repair {
        value = 1; //repair engineer only
        typeName = "SCALAR";
    };
    class ace_repair_engineerSetting_Wheel {
        value = 0; //wheel anyone
        typeName = "SCALAR";
    };
    class ace_repair_repairDamageThreshold {
        value = 0.6; //max repair level by toolkit
        typeName = "SCALAR";
    };
    class ace_repair_repairDamageThreshold_Engineer {
        value = 0.4; //max repair level by engy
        typeName = "SCALAR";
    };
    class ace_repair_consumeItem_ToolKit {
        value = 0; //no
        typeName = "SCALAR";
    };
    class ace_repair_fullRepairLocation {
        value = 2; //full repair only vehicle & facility
        typeName = "SCALAR";
    };
    class ace_repair_engineerSetting_fullRepair {
        value = 1; //full repair only by engy
        typeName = "SCALAR";
    };
    class ace_repair_addSpareParts {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_repair_wheelRepairRequiredItems {
        value = 0; //none
        typeName = "SCALAR";
    };

    /****** ace_map ******/
    class ace_map_BFT_Interval {
        value = 1; //1s
        typeName = "SCALAR";
    };
    class ace_map_BFT_Enabled {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_map_BFT_HideAiGroups {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_map_mapIllumination {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_map_mapGlow {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_map_mapShake {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_map_mapLimitZoom {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_map_mapShowCursorCoordinates {
        value = 0; //no
        typeName = "BOOL";
    };

    /****** ace_captives ******/
    class ace_captives_allowHandcuffOwnSide {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_captives_requireSurrender {
        value = 0; //no
        typeName = "SCALAR";
    };
    class ace_captives_allowSurrender {
        value = 1; //yes
        typeName = "BOOL";
    };

    /****** ace_common ******/
    class ace_common_checkPBOsAction {
        value = 0; //warn once
        typeName = "SCALAR";
    };
    class ace_common_checkPBOsCheckAll {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_common_checkPBOsWhitelist {
        value = "[]";
        typeName = "STRING";
    };

    /****** ace_explosives ******/
    class ace_explosives_RequireSpecialist {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_explosives_PunishNonSpecialists {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_explosives_ExplodeOnDefuse {
        value = 0; //no
        typeName = "BOOL";
    };

    /****** ace_interaction ******/
    class ace_interaction_EnableTeamManagement {
        value = 1; //yes
        typeName = "BOOL";
    };

    /****** ace_microdagr ******/
    class ace_microdagr_MapDataAvailable {
        value = 2; //full satelite & buildings
        typeName = "SCALAR";
    };

    /****** ace_mk6mortar ******/
    class ace_mk6mortar_airResistanceEnabled {
        value = 0; //no?
        typeName = "BOOL";
    };
    class ace_mk6mortar_allowComputerRangefinder {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_mk6mortar_allowCompass {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_mk6mortar_useAmmoHandling {
        value = 0; //no until ACE fix it TMP
        typeName = "BOOL";
    };

    /****** ace_finger ******/
    class ace_finger_enabled {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_finger_maxRange {
        value = 4; //4m
        typeName = "SCALAR";
    };

    /****** ace_sitting ******/
    class ace_sitting_enable {
        value = 1; //yes
        typeName = "BOOL";
    };

    /****** ace_spectator ******/
    class ace_spectator_filterUnits {
        value = 2; //units playable
        typeName = "SCALAR";
    };
    class ace_spectator_filterSides {
        value = 0; //sides player
        typeName = "SCALAR";
    };
    class ace_spectator_restrictModes {
        value = 0; //all
        typeName = "SCALAR";
    };
    class ace_spectator_restrictVisions {
        value = 0; //all
        typeName = "SCALAR";
    };

    /****** ace_switchunits ******/
    class ace_switchunits_EnableSwitchUnits {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_switchunits_SwitchToWest {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_switchunits_SwitchToEast {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_switchunits_SwitchToIndependent {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_switchunits_SwitchToCivilian {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_switchunits_EnableSafeZone {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_switchunits_SafeZoneRadius {
        value = 0; //0m
        typeName = "SCALAR";
    };

    /****** ace_vehiclelock ******/
    class ace_vehiclelock_DefaultLockpickStrength {
        value = 10; //10?
        typeName = "SCALAR";
    };
    class ace_vehiclelock_LockVehicleInventory {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_vehiclelock_VehicleStartingLockState {
        value = -1; //as is
        typeName = "SCALAR";
    };

    /****** ace_viewdistance ******/
    class ace_viewdistance_enabled {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_viewdistance_limitViewDistance {
        value = 10000; // Value, NOT index. 10000 is the maximum in A3
        typeName = "SCALAR";
    };

    /****** ace_zeus ******/
    class ace_zeus_zeusAscension {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_zeus_zeusBird {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_zeus_remoteWind {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_zeus_radioOrdnance {
        value = 0; //no
        typeName = "BOOL";
    };
    class ace_zeus_revealMines {
        value = 0; //no
        typeName = "SCALAR";
    };
    class ace_zeus_autoAddObjects {
        value = 1; //yes
        typeName = "BOOL";
    };

    /****** ace_map_gestures ******/
    class ace_map_gestures_enabled {
        value = 1; //yes
        typeName = "BOOL";
    };
    class ace_map_gestures_maxRange {
        value = 7; //7m
        typeName = "SCALAR";
    };
    class ace_map_gestures_interval {
        value = 0.03; //0.03s
        typeName = "SCALAR";
    };

    /****** ace_rearm ******/
    class ace_rearm_level {
        value = 0;
        typeName = "SCALAR";
    };

    /****** ace_refuel ******/
    class ace_refuel_rate {
        value = 10;
        typeName = "SCALAR";
    };

    /****** ace_nightvision ******/
    class ace_nightvision_disableNVGsWithSights {
        value = 0;
        typeName = "BOOL";
    };
};
