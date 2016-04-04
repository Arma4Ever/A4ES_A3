//==   ACE3 3.5.1.0   ==//
//======================================//
//               CLIENT                 //
//======================================//

class ace_common_settingFeedbackIcons {
    //Feedback icons
    //Select the position of or disable the feedback icons on your screen. These icons will show to provide extra feedback on your character status and actions performed.
    //typeName: SCALAR
    //default value: 1
    //values: ["Hide","Top right, downwards","Top right, to the left","Top left, downwards","Top left, to the right"]
    //client: 1
};
class ace_common_SettingProgressBarLocation {
    //Progress bar location
    //Set the desired location of the progress bar on your screen.
    //typeName: SCALAR
    //default value: 0
    //values: ["Top","Bottom"]
    //client: 1
};
class ace_finger_indicatorForSelf {
    //Show pointing indicator to self
    //Render the indicator for the pointing player. This option doesn't affect whether the other players would see the indicator
    //typeName: BOOL
    //default value: 1
    //client: 1
};
class ace_Gestures_showOnInteractionMenu {
    //Show Gestures On Interaction Menu
    //Show gestures on the self interaction menu, or just use keybinds, or disable completely
    //typeName: SCALAR
    //default value: 2
    //values: ["Disabled","Just Keybinds","Keybinds + Interaction Menu"]
    //client: 1
};
class ace_goggles_showInThirdPerson {
    //Show Goggle Effects in Third Person
    //typeName: BOOL
    //default value: 0
    //client: 1
};
class ace_interact_menu_actionOnKeyRelease {
    //Do action when releasing menu key
    //typeName: BOOL
    //default value: 1
    //client: 1
};
class ace_interact_menu_addBuildingActions {
    //Show actions for buildings
    //Adds interaction actions for opening doors and mounting ladders on buildings. (Note: There is a performance cost when opening interaction menu, especially in towns)
    //typeName: BOOL
    //default value: 0
    //client: 1
};
class ace_interact_menu_AlwaysUseCursorInteraction {
    //Always display cursor for interaction
    //typeName: BOOL
    //default value: 0
    //client: 1
};
class ace_interact_menu_AlwaysUseCursorSelfInteraction {
    //Always display cursor for self interaction
    //typeName: BOOL
    //default value: 0
    //client: 1
};
class ace_interact_menu_cursorKeepCentered {
    //Keep cursor centered
    //Keeps cursor centered and pans the option menu around. Useful if screen size is limited.
    //typeName: BOOL
    //default value: 0
    //client: 1
};
class ace_interact_menu_menuAnimationSpeed {
    //Interaction Animation Speed
    //Makes menu animations faster and decreases the time needed to hover to show sub actions
    //typeName: SCALAR
    //default value: 0
    //values: ["$str_speed_normal","2x","3x"]
    //client: 1
};
class ace_interact_menu_menuBackground {
    //Interaction menu background
    //typeName: SCALAR
    //default value: 0
    //values: ["Disabled","Blur screen","Black"]
    //client: 1
};
class ace_interact_menu_shadowSetting {
    //Interaction Text Shadow
    //Allows controlling the text's shadow. Outline ignores custom shadow colors.
    //typeName: SCALAR
    //default value: 2
    //values: ["Disabled","Enabled","Outline"]
    //client: 1
};
class ace_interact_menu_textSize {
    //Interaction Text Size
    //typeName: SCALAR
    //default value: 2
    //values: ["$str_very_small","$str_small","$str_medium","$str_large","$str_very_large"]
    //client: 1
};
class ace_interact_menu_UseListMenu {
    //Display interaction menus as lists
    //typeName: BOOL
    //default value: 0
    //client: 1
};
class ace_interaction_enableMagazinePassing {
    //Show "pass magazine" interaction
    //typeName: BOOL
    //default value: 1
    //client: 1
};
class ace_inventory_inventoryDisplaySize {
    //Make Inventory Display Bigger
    //Normally inventory display is scaled by UI size. This allows scaling the Inventory UI size up, but doesn't increase font size allowing more rows displayed.
    //typeName: SCALAR
    //default value: 0
    //values: ["$str_medium","$str_large","$str_very_large"]
    //client: 1
};
class ace_medical_litterSimulationDetail {
    //Litter Simulation Detail
    //Litter simulation detail level sets the number of litter items which will be locally spawned in the client. Excessive amounts in local areas could cause FPS lag, so this is a client only setting.
    //typeName: SCALAR
    //default value: 3
    //values: ["Off","Low","Medium","High","Ultra"]
    //client: 1
};
class ace_medical_menu_openAfterTreatment {
    //Re-open Medical menu
    //Re-open the medical menu after succesful treatment
    //typeName: BOOL
    //default value: 1
    //client: 1
};
class ace_medical_menu_useMenu {
    //Use Medical menu
    //If allowed by server, enable the option to use the Medical Menu through keybinding and interaction menu
    //typeName: SCALAR
    //default value: 0
    //values: ["Disabled","Enabled","Vehicles only"]
    //client: 1
};
class ace_medical_menuTypeStyle {
    //Style of menu (Medical)
    //Select the type of menu you prefer; default 3d selections or radial.
    //typeName: SCALAR
    //default value: 0
    //values: ["Selections (3d)","Radial","Disabled"]
    //client: 1
};
class ace_medical_painEffectType {
    //Pain Effect Type
    //typeName: SCALAR
    //default value: 0
    //values: ["Colour Flashing","Chromatic Aberration"]
    //client: 1
};
class ace_missileguidance_enabled {
    //Advanced Missile Guidance
    //Advanced missile guidance, or AMG, provides multiple enhancements to missile locking and firing. It is also a framework required for missile weapon types.
    //typeName: SCALAR
    //default value: 2
    //values: ["Off","Player Only","Player and AI"]
    //client: 1
};
class ace_movement_useImperial {
    //Show weight in lb
    //typeName: BOOL
    //default value: 0
    //client: 1
};
class ace_optionsmenu_optionMenuDisplaySize {
    //Option Menu UI Scaling
    //typeName: SCALAR
    //default value: 0
    //values: ["$str_medium","$str_large","$str_very_large"]
    //client: 1
};
class ace_optionsmenu_showNewsOnMainMenu {
    //Show News on Main Menu
    //typeName: BOOL
    //default value: 1
    //client: 1
};
class ace_overheating_DisplayTextOnJam {
    //Display text on jam
    //Display a notification whenever your weapon gets jammed
    //typeName: BOOL
    //default value: 1
    //client: 1
};
class ace_overheating_showParticleEffects {
    //Overheating Particle Effects
    //Show particle effects when weapon overheats
    //typeName: BOOL
    //default value: 1
    //client: 1
};
class ace_overheating_showParticleEffectsForEveryone {
    //Overheating Particle Effects for everyone
    //Show particle effects when other players weapon overheats
    //typeName: BOOL
    //default value: 0
    //client: 1
};
class ace_reload_DisplayText {
    //Check ammo on weapon reload
    //Check the ammo in your new magazine on magazine reload.
    //typeName: BOOL
    //default value: 1
    //client: 1
};
class ace_repair_DisplayTextOnRepair {
    //Display text on repair
    //Display a notification whenever you repair a vehicle
    //typeName: BOOL
    //default value: 1
    //client: 1
};
class ace_viewdistance_objectViewDistanceCoeff {
    //Dynamic Object View Distance
    //Sets the object view distance as a coefficient of the view distance or based on field of view. FoV Based's lowest and highest value is the value which is set when enabling the option.
    //typeName: SCALAR
    //default value: 0
    //values: ["Off","Very Low","Low","Medium","High","Very High","FoV Based"]
    //client: 1
};
class ace_viewdistance_viewDistanceAirVehicle {
    //Client View Distance (Air Vehicle)
    //Changes in game view distance when the player is in an air vehicle.
    //typeName: SCALAR
    //default value: 0
    //values: ["Video Settings","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000"]
    //client: 1
};
class ace_viewdistance_viewDistanceLandVehicle {
    //Client View Distance (Land Vehicle)
    //Changes in game view distance when the player is in a land vehicle.
    //typeName: SCALAR
    //default value: 0
    //values: ["Video Settings","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000"]
    //client: 1
};
class ace_viewdistance_viewDistanceOnFoot {
    //Client View Distance (On Foot)
    //Changes in game view distance when the player is on foot.
    //typeName: SCALAR
    //default value: 0
    //values: ["Video Settings","500","1000","1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000"]
    //client: 1
};
class ace_weaponselect_DisplayText {
    //Display text on grenade throw
    //Display a hint or text on grenade throw.
    //typeName: BOOL
    //default value: 1
    //client: 1
};

//======================================//
//               CONFIG                 //
//======================================//

class ace_captives_allowHandcuffOwnSide {
    //Can handcuff own side
    //Can players cabletie units on their own side
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_captives_allowSurrender {
    //Allow surrendering
    //Players can surrender after holstering their weapon
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_captives_requireSurrender {
    //Require surrendering
    //Require Players to surrender before they can be arrested
    //typeName: SCALAR
    //default value: 1
    //values: ["Disabled","Surrendering only","Surrendering or No weapon"]
    //client: 0
};
class ace_cargo_enable {
    //Enable Cargo
    //Enable the load in cargo module
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_common_checkPBOsAction {
    //typeName: SCALAR
    //default value: 0
    //values: ["Warn once","Warn (permanent)","Kick"]
    //client: 0
};
class ace_common_checkPBOsCheckAll {
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_common_checkPBOsWhitelist {
    //typeName: STRING
    //default value: "[]"
    //client: 0
};
class ace_common_forceAllSettings {
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_explosives_ExplodeOnDefuse {
    //Explode on defusal?
    //Enable certain explosives to explode on defusal? Default: Yes
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_explosives_PunishNonSpecialists {
    //Punish non-specialists?
    //Increase the time it takes to complete actions for non-specialists? Default: Yes
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_explosives_RequireSpecialist {
    //Require specialists?
    //Require explosive specialists to disable explosives? Default: No
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_finger_enabled {
    //Pointing Enabled
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_finger_maxRange {
    //Pointing Max Range
    //Max range between players to show the pointing indicator [default: 4 meters]
    //typeName: SCALAR
    //default value: 4
    //client: 0
};
class ace_hitreactions_minDamageToTrigger {
    //typeName: SCALAR
    //default value: 0.1
    //client: 0
};
class ace_interaction_EnableTeamManagement {
    //Enable Team Management
    //Should players be allowed to use the Team Management Menu? Default: Yes
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_laserpointer_enabled {
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_magazinerepack_TimePerAmmo {
    //typeName: SCALAR
    //default value: 1.5
    //client: 0
};
class ace_magazinerepack_TimePerBeltLink {
    //typeName: SCALAR
    //default value: 8
    //client: 0
};
class ace_magazinerepack_TimePerMagazine {
    //typeName: SCALAR
    //default value: 2
    //client: 0
};
class ace_map_BFT_Enabled {
    //BFT Enable
    //Enable Blue Force Tracking. Default: No
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_map_BFT_HideAiGroups {
    //Hide AI groups?
    //Hide markers for 'AI only' groups?
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_map_BFT_Interval {
    //Interval
    //How often the markers should be refreshed (in seconds)
    //typeName: SCALAR
    //default value: 1
    //client: 0
};
class ace_map_BFT_ShowPlayerNames {
    //Show player names?
    //Show individual player names?
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_map_DefaultChannel {
    //Set Channel At Start
    //Change the starting marker channel at mission start
    //typeName: SCALAR
    //default value: -1
    //client: 0
};
class ace_map_gestures_enabled {
    //Enabled
    //Enables the Map Gestures.
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_map_gestures_GroupColorConfigurationMapping {
    //GroupID Color configuration mapping
    //Hash of Group ID mapped to the Group color configuration index.
    //typeName: ARRAY
    //default value: [[],[]]
    //client: 0
};
class ace_map_gestures_GroupColorConfigurations {
    //Group color configurations
    //Group color configuration containing arrays of color pairs ([leadColor, color]).
    //typeName: ARRAY
    //default value: []
    //client: 0
};
class ace_map_gestures_interval {
    //Update Interval
    //Time between data updates.
    //typeName: SCALAR
    //default value: 0.03
    //client: 0
};
class ace_map_gestures_maxRange {
    //Map Gesture Max Range
    //Max range between players to show the map gesture indicator [default: 7 meters]
    //typeName: SCALAR
    //default value: 7
    //client: 0
};
class ace_map_mapGlow {
    //Map flashlight glow?
    //Add external glow to players who use flashlight on map?
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_map_mapIllumination {
    //Map illumination?
    //Simulate map lighting based on ambient lighting and player's items?
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_map_mapLimitZoom {
    //Limit map zoom?
    //Limit the amount of zoom available for the map?
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_map_mapShake {
    //Map shake?
    //Make map shake when walking?
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_map_mapShowCursorCoordinates {
    //Show cursor coordinates?
    //Show the grid coordinates on the mouse pointer?
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_maptools_EveryoneCanDrawOnBriefing {
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_medical_AIDamageThreshold {
    //AI Damage
    //What is the damage an AI can take before being killed?
    //typeName: SCALAR
    //default value: 1
    //client: 0
};
class ace_medical_allowDeadBodyMovement {
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_medical_allowLitterCreation {
    //Enable Litter
    //Enable litter being created upon treatment
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_medical_allowUnconsciousAnimationOnTreatment {
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_medical_amountOfReviveLives {
    //Max Revive lives
    //Max amount of lives a unit. 0 or -1 is disabled.
    //typeName: SCALAR
    //default value: -1
    //client: 0
};
class ace_medical_bleedingCoefficient {
    //Bleeding coefficient
    //Coefficient to modify the bleeding speed
    //typeName: SCALAR
    //default value: 1
    //client: 0
};
class ace_medical_consumeItem_PAK {
    //Remove PAK on use
    //Should PAK be removed on usage?
    //typeName: SCALAR
    //default value: 0
    //values: ["No","Yes"]
    //client: 0
};
class ace_medical_consumeItem_SurgicalKit {
    //Remove Surgical Kit (Adv)
    //Should Surgical kit be removed on usage?
    //typeName: SCALAR
    //default value: 0
    //values: ["No","Yes"]
    //client: 0
};
class ace_medical_delayUnconCaptive {
    //Delay cease fire of AI for unconsciousness
    //Delay cease fire of AI while player is unconscious for medical reasons.
    //typeName: SCALAR
    //default value: 3
    //client: 0
};
class ace_medical_enableAdvancedWounds {
    //Enable Advanced wounds
    //Allow reopening of bandaged wounds?
    //typeName: BOOL
    //default value: "false"
    //client: 0
};
class ace_medical_enableAirway {
    //typeName: BOOL
    //default value: "false"
    //client: 0
};
class ace_medical_enableFor {
    //Enabled for
    //Select what units the advanced medical system will be enabled for
    //typeName: SCALAR
    //default value: 0
    //values: ["Players only","Players and AI"]
    //client: 0
};
class ace_medical_enableFractures {
    //typeName: BOOL
    //default value: "false"
    //client: 0
};
class ace_medical_enableOverdosing {
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_medical_enableRevive {
    //Enable Revive
    //Enable a basic revive system
    //typeName: SCALAR
    //default value: 0
    //values: ["Disabled","Players only","Players and AI"]
    //client: 0
};
class ace_medical_enableScreams {
    //Enable Screams
    //Enable screaming by injuried units
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_medical_enableUnconsciousnessAI {
    //AI Unconsciousness
    //Allow AI to go unconscious
    //typeName: SCALAR
    //default value: 1
    //values: ["Disabled","50/50","Enabled"]
    //client: 0
};
class ace_medical_enableVehicleCrashes {
    //Vehicle Crashes
    //Do units take damage from a vehicle crash?
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_medical_healHitPointAfterAdvBandage {
    //Heal hitpoints
    //Heal fully bandaged hitpoints
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_medical_increaseTrainingInLocations {
    //Locations boost training
    //Boost medic rating in medical vehicles or near medical facilities [untrained becomes medic, medic becomes doctor]
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_medical_keepLocalSettingsSynced {
    //Sync status
    //Keep unit status synced. Recommended on.
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_medical_level {
    //Medical Level
    //What is the medical simulation level?
    //typeName: SCALAR
    //default value: 1
    //values: ["Disabled","Basic","Advanced"]
    //client: 0
};
class ace_medical_litterCleanUpDelay {
    //Life time of litter objects
    //How long should litter objects stay? In seconds. -1 is forever.
    //typeName: SCALAR
    //default value: 0
    //client: 0
};
class ace_medical_maxReviveTime {
    //Max Revive time
    //Max amount of seconds a unit can spend in revive state
    //typeName: SCALAR
    //default value: 120
    //client: 0
};
class ace_medical_medicSetting {
    //Medics setting
    //What is the level of detail prefered for medics?
    //typeName: SCALAR
    //default value: 1
    //values: ["Disabled","Normal","Advanced"]
    //client: 0
};
class ace_medical_medicSetting_basicEpi {
    //Allow Epinephrine
    //Who can use Epinephrine for full heal? (Basic medical only)
    //typeName: SCALAR
    //default value: 1
    //values: ["Anyone","Medics only","Doctors only"]
    //client: 0
};
class ace_medical_medicSetting_PAK {
    //Allow PAK
    //Who can use the PAK for full heal?
    //typeName: SCALAR
    //default value: 1
    //values: ["Anyone","Medics only","Doctors only"]
    //client: 0
};
class ace_medical_medicSetting_SurgicalKit {
    //Allow Surgical Kit (Adv)
    //Who can use the Surgical Kit?
    //typeName: SCALAR
    //default value: 1
    //values: ["Anyone","Medics only","Doctors only"]
    //client: 0
};
class ace_medical_menu_allow {
    //Allow Medical Menu
    //Allow clients to use the medical menu
    //typeName: SCALAR
    //default value: 1
    //values: ["Disabled","Enabled","Vehicles only"]
    //client: 0
};
class ace_medical_menu_maxRange {
    //typeName: SCALAR
    //default value: 3
    //client: 0
};
class ace_medical_moveUnitsFromGroupOnUnconscious {
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_medical_painCoefficient {
    //Pain coefficient
    //Coefficient to modify the pain intensity
    //typeName: SCALAR
    //default value: 1
    //client: 0
};
class ace_medical_painIsOnlySuppressed {
    //Pain suppression
    //Pain is only temporarily suppressed, not removed
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_medical_playerDamageThreshold {
    //Player Damage
    //What is the damage a player can take before being killed?
    //typeName: SCALAR
    //default value: 1
    //client: 0
};
class ace_medical_preventInstaDeath {
    //Prevent instant death
    //Have a unit move to unconscious instead of death
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_medical_remoteControlledAI {
    //Remote Controlled AI
    //Treat remote controlled units as AI not players?
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_medical_useCondition_PAK {
    //Condition PAK
    //When can the PAK be used?
    //typeName: SCALAR
    //default value: 0
    //values: ["Anytime","Stable"]
    //client: 0
};
class ace_medical_useCondition_SurgicalKit {
    //Condition Surgical Kit (Adv)
    //When can the Surgical Kit be used?
    //typeName: SCALAR
    //default value: 0
    //values: ["Anytime","Stable"]
    //client: 0
};
class ace_medical_useLocation_basicEpi {
    //Locations Epinephrine
    //Where can the Epinephrine be used? (Basic Medical)
    //typeName: SCALAR
    //default value: 0
    //values: ["Anywhere","Medical vehicles","Medical facility","Vehicles & facility","Disabled"]
    //client: 0
};
class ace_medical_useLocation_PAK {
    //Locations PAK
    //Where can the PAK be used?
    //typeName: SCALAR
    //default value: 3
    //values: ["Anywhere","Medical vehicles","Medical facility","Vehicles & facility","Disabled"]
    //client: 0
};
class ace_medical_useLocation_SurgicalKit {
    //Locations Surgical Kit (Adv)
    //Where can the Surgical Kit be used?
    //typeName: SCALAR
    //default value: 2
    //values: ["Anywhere","Medical vehicles","Medical facility","Vehicles & facility","Disabled"]
    //client: 0
};
class ace_microdagr_MapDataAvailable {
    //MicroDAGR Map Fill
    //How much map data is filled on MicroDAGR's
    //typeName: SCALAR
    //default value: 2
    //values: ["None (Cannot use map view)","Topographical + Roads","Full Satellite + Buildings"]
    //client: 0
};
class ace_mk6mortar_airResistanceEnabled {
    //Air Resistance
    //For Player Shots, Model Air Resistance and Wind Effects
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_mk6mortar_allowCompass {
    //Allow Mk6 Compass
    //Show the Mk6 Digital Compass
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_mk6mortar_allowComputerRangefinder {
    //Allow Mk6 Computer
    //Show the Computer and Rangefinder (these NEED to be removed if you enable air resistance)
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_mk6mortar_useAmmoHandling {
    //Use Ammunition handling
    //Removes mortar magazines, requiring individual rounds to be loaded by the gunner or loader. Does not affect AI mortars.
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_nightvision_disableNVGsWithSights {
    //Disable NVGs in scope
    //Blocks the usage of night vision goggles whilst aiming down the sight.
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_overheating_overheatingDispersion {
    //Overheating Dispersion
    //Overheated weapons will be less accurate and have decreased muzzle velocity. Applys for all players.
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_overheating_unJamFailChance {
    //Chance of unjam failing
    //Probability that an unjam action might fail, requiring to be repeated.
    //typeName: SCALAR
    //default value: 0.1
    //client: 0
};
class ace_overheating_unJamOnreload {
    //Unjam weapon on reload
    //Reloading clears a weapon jam.
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_rearm_level {
    //Rearm Amount
    //How fast should a vehicle be rearmed?
    //typeName: SCALAR
    //default value: 0
    //values: ["Entire Vehicle","Entire Magazine","Amount based on caliber"]
    //client: 0
};
class ace_refuel_rate {
    //Flow Rate
    //How fast should a vehicle be refueled?
    //typeName: SCALAR
    //default value: 1
    //client: 0
};
class ace_repair_addSpareParts {
    //Add Spare Parts
    //Add spare parts to vehicles (requires Cargo component)?
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_repair_consumeItem_ToolKit {
    //Remove toolkit on use
    //Should the toolkit be removed on usage?
    //typeName: SCALAR
    //default value: 0
    //values: ["No","Yes"]
    //client: 0
};
class ace_repair_engineerSetting_fullRepair {
    //Allow Full Repair
    //Who can perform a full repair on a vehicle?
    //typeName: SCALAR
    //default value: 2
    //values: ["Anyone","Engineer only","Repair Specialist only"]
    //client: 0
};
class ace_repair_engineerSetting_Repair {
    //Allow Repair
    //Who can perform repair actions?
    //typeName: SCALAR
    //default value: 1
    //values: ["Anyone","Engineer only","Repair Specialist only"]
    //client: 0
};
class ace_repair_engineerSetting_Wheel {
    //Allow Wheel
    //Who can remove and replace wheels?
    //typeName: SCALAR
    //default value: 0
    //values: ["Anyone","Engineer only","Repair Specialist only"]
    //client: 0
};
class ace_repair_fullRepairLocation {
    //Full Repair Locations
    //At what locations can a vehicle be fully repaired?
    //typeName: SCALAR
    //default value: 2
    //values: ["Anywhere","Repair Vehicle only","Repair Facility only","Repair Facility or Vehicle","Disabled"]
    //client: 0
};
class ace_repair_repairDamageThreshold {
    //Repair Threshold
    //What is the maximum damage that can be repaired with a toolkit?
    //typeName: SCALAR
    //default value: 0.6
    //client: 0
};
class ace_repair_repairDamageThreshold_Engineer {
    //Repair Threshold (Engineer)
    //What is the maximum damage that can be repaired by an engineer?
    //typeName: SCALAR
    //default value: 0.4
    //client: 0
};
class ace_repair_wheelRepairRequiredItems {
    //Wheel repair requirements
    //Items required to remove/replace wheels
    //typeName: SCALAR
    //default value: 0
    //values: ["None","ToolKit"]
    //client: 0
};
class ace_respawn_BodyRemoveTimer {
    //typeName: SCALAR
    //default value: 0
    //client: 0
};
class ace_respawn_RemoveDeadBodiesDisconnected {
    //Remove bodies?
    //Remove player bodies after disconnect?
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_respawn_SavePreDeathGear {
    //Save Gear?
    //Respawn with the gear a soldier had just before his death?
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_sitting_enable {
    //Enable Sitting
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_spectator_filterSides {
    //Side filter
    //Method of filtering spectatable sides.
    //typeName: SCALAR
    //default value: 0
    //values: ["Player side","Friendly sides","Hostile sides","All sides"]
    //client: 0
};
class ace_spectator_filterUnits {
    //Unit filter
    //Method of filtering spectatable units.
    //typeName: SCALAR
    //default value: 2
    //values: ["No units","Only players","Playable Units","All units"]
    //client: 0
};
class ace_spectator_restrictModes {
    //Camera modes
    //Camera modes that can be used.
    //typeName: SCALAR
    //default value: 0
    //values: ["All","Internal and external","Free only","Internal only","External only"]
    //client: 0
};
class ace_spectator_restrictVisions {
    //Vision modes
    //Vision modes that can be used.
    //typeName: SCALAR
    //default value: 0
    //values: ["All","Night vision","Thermal imaging","None"]
    //client: 0
};
class ace_switchunits_EnableSafeZone {
    //Enable Safe Zone?
    //Enable a safe zone around enemy units? Players can't switch to units inside of the safe zone.
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_switchunits_EnableSwitchUnits {
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_switchunits_SafeZoneRadius {
    //Safe Zone Radius
    //The safe zone around players from a different team. Default: 200
    //typeName: SCALAR
    //default value: 100
    //client: 0
};
class ace_switchunits_SwitchToCivilian {
    //Switch to Civilian?
    //Allow switching to civilian units?
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_switchunits_SwitchToEast {
    //Switch to East?
    //Allow switching to east units?
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_switchunits_SwitchToIndependent {
    //Switch to Independent?
    //Allow switching to independent units?
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_switchunits_SwitchToWest {
    //Switch to West?
    //Allow switching to west units?
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_vehiclelock_DefaultLockpickStrength {
    //Default Lockpick Strength
    //Default Time to lockpick (in seconds). Default: 10
    //typeName: SCALAR
    //default value: 10
    //client: 0
};
class ace_vehiclelock_LockVehicleInventory {
    //Lock Vehicle Inventory
    //Locks the inventory of locked vehicles
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_vehiclelock_VehicleStartingLockState {
    //Vehicle Starting Lock State
    //Set lock state for all vehicles (removes ambiguous lock states)
    //typeName: SCALAR
    //default value: -1
    //client: 0
};
class ace_viewdistance_enabled {
    //Enable ACE viewdistance
    //Enables ACE viewdistance
    //typeName: BOOL
    //default value: 1
    //client: 0
};
class ace_viewdistance_limitViewDistance {
    //View Distance Limit
    //Limit for client's view distance set here and can overridden by module
    //typeName: SCALAR
    //default value: 10000
    //client: 0
};
class ace_zeus_autoAddObjects {
    //Add Objects to Curator
    //Adds any spawned object to all curators in the mission
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_zeus_radioOrdnance {
    //Ordnance Warning
    //Play a radio warning when Zeus uses ordnance.
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_zeus_remoteWind {
    //Wind Sounds
    //Play wind sounds when Zeus remote controls a unit.
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_zeus_revealMines {
    //Reveal Mines
    //Reveal mines to allies and place map markers.
    //typeName: SCALAR
    //default value: 0
    //values: ["Disabled","Reveal to Allies","Allies + Map Markers"]
    //client: 0
};
class ace_zeus_zeusAscension {
    //Ascension Messages
    //Display global popup messages when a player is assigned as Zeus.
    //typeName: BOOL
    //default value: 0
    //client: 0
};
class ace_zeus_zeusBird {
    //Zeus Eagle
    //Spawn an eagle that follows the Zeus camera.
    //typeName: BOOL
    //default value: 0
    //client: 0
};
