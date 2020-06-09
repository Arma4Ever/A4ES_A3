class Cfg3DEN {
	class Notifications {
        #include "ENH\notifications.hpp"
	};
	class EventHandlers {
        delete Eden_Extended_Objects_Handlers;
        
		class ENH {
			onTerrainNew = "call ENH_fnc_EH_onTerrainNew";
			onMissionPreviewEnd = "call ENH_fnc_EH_onMissionPreviewEnd";
			onMissionLoad = "call ENH_fnc_EH_onMissionLoad";
			onMissionNew = "call ENH_fnc_EH_onMissionNew";
			onSelectionChange = "call ENH_fnc_EH_onSelectionChange";
		};
        class ADDON {
            onMissionNew = QUOTE(_this call FUNC(handleMissionNew));
            onMissionLoad = QUOTE(_this call FUNC(handleMissionLoad));
			onConnectingEnd = QUOTE(_this call FUNC(handleConnectingEnd));
            onMissionPreview = QUOTE(GVAR(isEditorPreview) = true;);
            onMissionPreviewEnd = QUOTE(GVAR(isEditorPreview) = false;);
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

        class Combo;
        class GVAR(hiddenCombo): Checkbox {
            w = "0";
            h = "0";
        };

        #include "ENH\controls\timeMultiplier.hpp"
	};
 	class Mission {
        class Intel {
			class AttributeCategories {
				#include "ENH\attributesMission\timeMultiplier.hpp"
			};
		};
        class Scenario {
            class AttributeCategories {
                delete Overview;
                delete OverviewLocked;
                delete Unlock;
                delete Init;

                class States {
					displayName = CSTRING(Scenario_AttributeCategory_States_displayName);
					class Attributes {
                        delete EnableTargetDebug;

						class Briefing {
							control = QGVAR(hiddenCheckbox);
						};
						class Debriefing {
							control = QGVAR(hiddenCheckbox);
						};
						class Saving {
							control = QGVAR(hiddenCheckbox);
						};
						class ShowMap {
							control = QGVAR(hiddenCheckbox);
						};
						class ShowCompass {
							control = QGVAR(hiddenCheckbox);
						};
						class ShowWatch {
							control = QGVAR(hiddenCheckbox);
						};
						class ShowGPS {
							control = QGVAR(hiddenCheckbox);
						};
						class ShowHUD {
							control = QGVAR(hiddenCheckbox);
						};
						class ShowUAVFeed {
							control = QGVAR(hiddenCheckbox);
						};
						class ForceRotorLibSimulation {
							control = QGVAR(hiddenCheckbox);
						};
					};
				};
                class Misc {
                    class Attributes {
                        class Binarize {
                            control = QGVAR(hiddenCheckbox);
                        };
                    };
                };
            };
        };
        class Multiplayer {
            class AttributeCategories {
                delete Tasks;
                delete Revive;

                class Lobby {
                    class Attributes {
                        class DisabledAI {
                            control = QGVAR(hiddenCheckbox);
                        };
                        class JoinUnassigned {
                            control = QGVAR(hiddenCheckbox);
                        };
                    };
                };
            };
        };
        class GarbageCollection {
            class AttributeCategories {
                class GarbageCollection {
                    collapsed = 0;
                    class Attributes {
                        class CorpseManagerMode {
                            control = QGVAR(hiddenCombo);
                        };
                        class WreckManagerMode {
                            control = QGVAR(hiddenCombo);
                        };
                        class GVAR(garbageCollectionSetuped) {
                            property = QGVAR(garbageCollectionSetuped);
							control = QGVAR(hiddenCheckbox);
                            defaultValue = "false";
                        };
                    };
                };
                class DynamicSimulation {
                    class Attributes {
                        class DynSimEnabled {
                            control = QGVAR(hiddenCheckbox);
                        };
                    };
                };
            };
        };

		class Preferences {
			class AttributeCategories {
                class Saving {
                    class Attributes {
                        class Binarize {
                            control = QGVAR(hiddenCheckbox);
                        };
                    };
                };
				#include "ENH\attributesEditor\interface.hpp"
			};
		};
	};
	class Group {
		class AttributeCategories {
			class State {
				class Attributes {
                    class dynamicSimulation {
                        control = QGVAR(hiddenCheckbox);
                    };
                    class GVAR(disableDynamicSimulation) {
                        property = QGVAR(disableDynamicSimulation);
						control = "Checkbox";
                        displayName = CSTRING(DisableDynamicSimulation);
						tooltip = CSTRING(DisableDynamicSimulation_Tooltip);
						expression = QUOTE(if (is3DEN) then {_this call FUNC(updateDynamicSimulation);};);
						defaultValue = "false";
                        typeName = "BOOL";
						wikiType = "[[Bool]]";
                    };
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
		};
	};
};
