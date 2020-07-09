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
                        displayName = CSTRING(DisableDynamicSimulation);
						tooltip = CSTRING(DisableDynamicSimulation_Tooltip);
                        property = QGVAR(disableDynamicSimulation);
						control = "Checkbox";
						expression = QUOTE(if (is3DEN) then {_this call FUNC(updateDynamicSimulation);};);
						defaultValue = "false";
                        typeName = "BOOL";
                    };
				};
			};
		};
	};
	class Object {
		class AttributeCategories {
            class Control {
				class Attributes {
					class Description {
						tooltip = CSTRING(roleDescription_Tooltip);
					};
				};
			};
			class StateSpecial {
				class Attributes {
                    delete EnableRevive;

                    class GVAR(doStop) {
            			displayName = CSTRING(doStop);
            			tooltip = CSTRING(doStop_Tooltip);
            			property = QGVAR(doStop);
            			control = "Checkbox";
            			expression = "if (_value) then {_this setVariable ['%s', true, true];};";
            			defaultValue = "false";
            			condition = "objectBrain";
            		};
                    class GVAR(forceGunLights) {
            			displayName = CSTRING(forceGunLights);
            			tooltip = CSTRING(forceGunLights_Tooltip);
            			property = QGVAR(forceGunLights);
            			control = "Checkbox";
                        // Save var globally, postInit script will handle it + allows restore in case of locality change
            			expression = "if (_value) then {_this setVariable ['%s', true, true];};";
            			defaultValue = "false";
            			condition = "objectBrain";
            		};
                    class GVAR(disableBISRandomization) {
            			displayName = CSTRING(disableBISRandomization);
            			tooltip = CSTRING(disableBISRandomization_Tooltip);
            			property = QGVAR(disableBISRandomization);
            			control = "Checkbox";
            			expression = "if (_value) then {_this setVariable ['BIS_enableRandomization', false, true];};";
            			defaultValue = "false";
            		};
				};
			};
            class GVAR(disableAI) {
                collapsed = 1;
            	displayName = CSTRING(DisableAI);
                class Attributes {
                    class GVAR(DisableAI_TARGET) {
            			displayName = CSTRING(DisableAI_TARGET);
            			tooltip = CSTRING(DisableAI_TARGET_Tooltip);
            			property = QGVAR(DisableAI_TARGET);
            			control = "Checkbox";
            			expression = "if (_value) then {_this disableAI 'TARGET';};";
            			defaultValue = "false";
            			condition = "objectBrain";
            		};
                    class GVAR(DisableAI_AUTOTARGET): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_AUTOTARGET);
            			tooltip = CSTRING(DisableAI_AUTOTARGET_Tooltip);
            			property = QGVAR(DisableAI_AUTOTARGET);
                        expression = "if (_value) then {_this disableAI 'AUTOTARGET';};";
                    };
                    class GVAR(DisableAI_MOVE): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_MOVE);
            			tooltip = CSTRING(DisableAI_MOVE_Tooltip);
            			property = QGVAR(DisableAI_MOVE);
                        expression = "if (_value) then {_this disableAI 'MOVE';};";
                    };
                    class GVAR(DisableAI_ANIM): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_ANIM);
            			tooltip = CSTRING(DisableAI_ANIM_Tooltip);
            			property = QGVAR(DisableAI_ANIM);
                        expression = "if (_value) then {_this disableAI 'ANIM';};";
                    };
                    class GVAR(DisableAI_TEAMSWITCH): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_TEAMSWITCH);
            			tooltip = CSTRING(DisableAI_TEAMSWITCH_Tooltip);
            			property = QGVAR(DisableAI_TEAMSWITCH);
                        expression = "if (_value) then {_this disableAI 'TEAMSWITCH';};";
                    };
                    class GVAR(DisableAI_FSM): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_FSM);
            			tooltip = CSTRING(DisableAI_FSM_Tooltip);
            			property = QGVAR(DisableAI_FSM);
                        expression = "if (_value) then {_this disableAI 'FSM';};";
                    };
                    class GVAR(DisableAI_WEAPONAIM): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_WEAPONAIM);
            			tooltip = CSTRING(DisableAI_WEAPONAIM_Tooltip);
            			property = QGVAR(DisableAI_WEAPONAIM);
                        expression = "if (_value) then {_this disableAI 'WEAPONAIM';};";
                    };
                    class GVAR(DisableAI_AIMINGERROR): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_AIMINGERROR);
            			tooltip = CSTRING(DisableAI_AIMINGERROR_Tooltip);
            			property = QGVAR(DisableAI_AIMINGERROR);
                        expression = "if (_value) then {_this disableAI 'AIMINGERROR';};";
                    };
                    class GVAR(DisableAI_SUPPRESSION): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_SUPPRESSION);
            			tooltip = CSTRING(DisableAI_SUPPRESSION_Tooltip);
            			property = QGVAR(DisableAI_SUPPRESSION);
                        expression = "if (_value) then {_this disableAI 'SUPPRESSION';};";
                    };
                    class GVAR(DisableAI_CHECKVISIBLE): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_CHECKVISIBLE);
            			tooltip = CSTRING(DisableAI_CHECKVISIBLE_Tooltip);
            			property = QGVAR(DisableAI_CHECKVISIBLE);
                        expression = "if (_value) then {_this disableAI 'CHECKVISIBLE';};";
                    };
                    class GVAR(DisableAI_COVER): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_COVER);
            			tooltip = CSTRING(DisableAI_COVER_Tooltip);
            			property = QGVAR(DisableAI_COVER);
                        expression = "if (_value) then {_this disableAI 'COVER';};";
                    };
                    class GVAR(DisableAI_AUTOCOMBAT): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_AUTOCOMBAT);
            			tooltip = CSTRING(DisableAI_AUTOCOMBAT_Tooltip);
            			property = QGVAR(DisableAI_AUTOCOMBAT);
                        expression = "if (_value) then {_this disableAI 'AUTOCOMBAT';};";
                    };
                    class GVAR(DisableAI_PATH): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_PATH);
            			tooltip = CSTRING(DisableAI_PATH_Tooltip);
            			property = QGVAR(DisableAI_PATH);
                        expression = "if (_value) then {_this disableAI 'PATH';};";
                    };
                    class GVAR(DisableAI_MINEDETECTION): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_MINEDETECTION);
            			tooltip = CSTRING(DisableAI_MINEDETECTION_Tooltip);
            			property = QGVAR(DisableAI_MINEDETECTION);
                        expression = "if (_value) then {_this disableAI 'MINEDETECTION';};";
                    };
                    class GVAR(DisableAI_NVG): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_NVG);
            			tooltip = CSTRING(DisableAI_NVG_Tooltip);
            			property = QGVAR(DisableAI_NVG);
                        expression = "if (_value) then {_this disableAI 'NVG';};";
                    };
                    class GVAR(DisableAI_LIGHTS): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_LIGHTS);
            			tooltip = CSTRING(DisableAI_LIGHTS_Tooltip);
            			property = QGVAR(DisableAI_LIGHTS);
                        expression = "if (_value) then {_this disableAI 'LIGHTS';};";
                    };
                    class GVAR(DisableAI_RADIOPROTOCOL): GVAR(DisableAI_TARGET) {
                        displayName = CSTRING(DisableAI_RADIOPROTOCOL);
            			tooltip = CSTRING(DisableAI_RADIOPROTOCOL_Tooltip);
            			property = QGVAR(DisableAI_RADIOPROTOCOL);
                        expression = "if (_value) then {_this disableAI 'RADIOPROTOCOL';};";
                    };
                };
            };
		};
	};
};
