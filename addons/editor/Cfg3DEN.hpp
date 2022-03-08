class Cfg3DEN {
	class EventHandlers {
        delete Eden_Extended_Objects_Handlers;

        class ADDON {
            onMissionNew = QUOTE(0 call FUNC(handleMissionNew));
            onMissionLoad = QUOTE(0 call FUNC(handleMissionLoad));
			onConnectingEnd = QUOTE(_this call FUNC(handleConnectingEnd));
        };
        class DOUBLES(ADDON,assetsTreeFilter) {
            onMissionNew = QUOTE(0 spawn FUNC(initAssetsTreeFiltering));
            onMissionLoad = QUOTE(0 spawn  FUNC(initAssetsTreeFiltering));
            onMissionPreviewEnd = QUOTE(0 spawn FUNC(initAssetsTreeFiltering));
            onModeChange = QUOTE(0 spawn FUNC(updateCurrentAssetsTree));
            onSubmodeChange = QUOTE(0 spawn FUNC(updateCurrentAssetsTree));
        };
        #ifdef DEBUG_MODE_FULL
        class DOUBLES(ADDON,debug) {
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
        #endif
	};
	class Attributes {
		class Default;
		class Title: Default {
			class Controls {
				class Title;
			};
		};
        class Checkbox;
        class GVAR(hiddenCheckbox): Checkbox {
            w = "0";
            h = "0";
        };
        class Edit;
        class GVAR(hiddenEdit): Edit {
            w = "0";
            h = "0";
        };
        class Combo;
        class GVAR(hiddenCombo): Checkbox {
            w = "0";
            h = "0";
        };
	};
 	class Mission {
        class Scenario {
            class AttributeCategories {
                delete Overview;
                delete OverviewLocked;
                delete Unlock;
                delete Init;
                delete ENH_Airdrop;
                delete ENH_AmbientFlyby;
                delete ENH_Briefing;
                delete ENH_EstablishingShot;
                delete ENH_IntroText;
                delete ENH_MissionEnding_Casualties;
                delete ENH_Volume;
                delete ENH_SPR;

                class Misc {
                    class Attributes {
                        delete ENH_AddObjectsToZeus;
                        delete ENH_MapIndicators;

                        class Binarize {
                            // control = QGVAR(hiddenCheckbox);
                        };
                        class GVAR(a3csVersion) {
                            property = QGVAR(a3csVersion);
                            control = QGVAR(hiddenEdit);
                            defaultValue = "''";
                        };
                    };
                };

                #include "attributes\mission_scenario.hpp"
            };
        };
        class Multiplayer {
            class AttributeCategories {
                delete Tasks;
                delete Revive;
                delete ENH_DynamicGroups;
                delete ENH_DynamicSkill;

                class Respawn {
                    class Attributes {
                        delete ENH_SaveLoadout;
                    };
                };

                #include "attributes\mission_multiplayer.hpp"
            };
        };
        class GarbageCollection {
            class AttributeCategories {
                #include "attributes\mission_garbageCollection.hpp"
            };
        };
		class Preferences {
            class AttributeCategories {
                delete ENH_DebugOptions;

                class ENH_Interface {
                    class Attributes {
                        delete ENH_MenuStrip_Blacklist;
                    };
                };

                class Camera {
                    class Attributes {
                        delete ENH_DynamicViewDistance;
                    };
                };

                class Saving {
                    class Attributes {
                        class Binarize {
                            // control = QGVAR(hiddenCheckbox);
                        };
                    };
                };
			};
		};
        class Intel {
            class AttributeCategories {
                delete ENH_VisualSettings;

                class Date {
                    class Attributes {
                        delete ENH_TimeMultiplier;
                    };
                };
            };
        };
	};
	class Group {
        class AttributeCategories {
            delete ENH_GroupMarker;

            class State {
                class Attributes {
                    delete ENH_TaskPatrol;

                    #include "attributes\group_state.hpp"
                };
            };
        };
	};
	class Object {
		class AttributeCategories {
            delete ENH_AdvancedDamage;
            delete ENH_AmbientAnimations;
            delete ENH_AI;
            delete ENH_UnitTraits;
            delete ENH_HoldAction;

            class StateSpecial {
                class Attributes {
                    delete EnableRevive;
                    delete ENH_AllowSprint;
                    delete ENH_ForceWalk;
                    delete ENH_MakeHostage;
                    delete ENH_Parachute;
                    delete ENH_EnableHeadlights;
                    delete ENH_AllowCrewInImmobile;
                    delete ENH_EngineOn;
                    delete ENH_DisableNVGE;
                    delete ENH_DisableTIE;
                    delete ENH_LimitSpeed;
                    delete ENH_DoStop;
                    delete ENH_removeFromRemainsCollector;
                    delete ENH_SPR_Tickets;
                    delete ENH_AttachTo;

                    // Remove as last - its a base class
                    delete ENH_SetCaptive;

                    #include "attributes\object_stateSpecial.hpp"
                };
            };
            class Inventory {
                class Attributes {
                    delete ENH_AddGunLight;
                    delete ENH_VirtualArsenal;
                };
            };
            class State {
                class Attributes {
                    delete ENH_SetMass;
                    delete ENH_FeatureType;
                    delete ENH_ForceFlag;
                    delete ENH_ObjectScale;
                };
            };
            class Control {
				class Attributes {
					class Description {
						tooltip = CSTRING(roleDescription_Tooltip);
					};
				};
			};
            class Transformation {
              class Attributes {
                  delete ENH_SetMass;
                  delete ENH_ObjectScaling;
              };
            };

            #include "attributes\object_disableAI.hpp"
		};
	};
};
