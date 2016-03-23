class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class A3CS_takeCommand {
                    displayName = CSTRING(Actions_TakeCommand_DisplayName);
                    condition = QUOTE(leader _player == _player && {!isPlayer _target} && {[ARR_2(_player,_target)] call ace_interaction_fnc_canJoinGroup});
                    statement = QUOTE([_target] joinSilent group _player);
                    exceptions[] = {"isNotInside"};
                    priority = 2.6;
                    icon = "\z\ace\addons\interaction\UI\team\team_management_ca.paa";
                };
                class A3CS_HideBody {
                    displayName = CSTRING(Actions_HideBody_DisplayName);
                    priority = 2;
                    condition = QUOTE(!alive _target);
                    statement = QUOTE(_target call DFUNC(hideBody));
                    exceptions[] = {};
                };
                class A3CS_OpenGear {
                    displayName = CSTRING(Actions_OpenGear_DisplayName);
                    priority = 2;
                    condition = QUOTE(!alive _target);
                    statement = QUOTE(_target call DFUNC(openGear));
                    exceptions[] = {};
                };
                class A3CS_checkGear {
                    displayName = CSTRING(Actions_CheckGear_DisplayName);
                    condition = QUOTE(alive _target);
                    statement = QUOTE([ARR_2(_player, _target)] call DFUNC(checkGear));
                    showDisabled = 0;
                    priority = 8;
                    exceptions[] = {"isNotInside"};
                };
                class A3CS_checkId {
                    displayName = CSTRING(Actions_CheckID_DisplayName);
                    condition = QUOTE(alive _target);
                    statement = QUOTE([ARR_2(_player, _target)] call DFUNC(checkId));
                    showDisabled = 0;
                    priority = 8;
                    exceptions[] = {"isNotInside"};
                };
            };
        };
        class ACE_SelfActions {
            class A3CS_checkId {
                displayName = CSTRING(Actions_CheckID_DisplayName);
                condition = "(true)";
                statement = QUOTE([ARR_2(_player, _target)] call DFUNC(checkId));
                showDisabled = 0;
                priority = 8;
                exceptions[] = {"isNotInside"};
            };
        };
    };
};
