class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class ACE_TeamManagement {
                    condition = QUOTE(([ARR_2(_player,_target)] call DFUNC(areInSameSquad)) && {_player call DFUNC(isLeader)});

                    class ACE_AssignTeamRed {
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam));
                        showDisabled = 0;
                    };
                    class ACE_AssignTeamGreen {
                        displayName = CSTRING(AssignTeamGreen);
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam));
                        showDisabled = 0;
                    };
                    class ACE_AssignTeamBlue {
                        displayName = CSTRING(AssignTeamBlue);
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam));
                        showDisabled = 0;
                    };
                    class ACE_AssignTeamYellow {
                        displayName = CSTRING(AssignTeamYellow);
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam));
                        showDisabled = 0;
                    };
                    class ACE_UnassignTeam {
                        displayName = CSTRING(LeaveTeam);
                        condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinTeam) && {assignedTeam _target != 'MAIN'});
                        showDisabled = 0;
                    };
                };

                class ACE_JoinGroup {
                    displayName = CSTRING(JoinGroup);
                    condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canJoinSquad));
                    statement = QUOTE([ARR_2(_player,_target)] call DFUNC(joinSquadClient));
                    modifierFunction = QUOTE(_this call FUNC(modifyJoinSquadAction));
                };

                class GVAR(removeFromSquad) {
                    displayName = CSTRING(RemoveFromSquad);
                    condition = QUOTE([ARR_2(_player,_target)] call DFUNC(canRemoveFromSquad));
                    statement = QUOTE(_target call DFUNC(leaveSquadClient));
                    exceptions[] = {"isNotSwimming"};
                    showDisabled = 0;
                    icon = QPATHTOF(data\remove_from_squad.paa);
                };
            };
        };

        class ACE_SelfActions {
            class ACE_TeamManagement {
                condition = QUOTE(_player call DFUNC(hasSquad));

                class ACE_JoinTeamRed {
                    condition = QUOTE(_player call DFUNC(hasSquad));
                    showDisabled = 0;
                };
                class ACE_JoinTeamGreen {
                    condition = QUOTE(_player call DFUNC(hasSquad));
                    showDisabled = 0;
                };
                class ACE_JoinTeamBlue {
                    condition = QUOTE(_player call DFUNC(hasSquad));
                    showDisabled = 0;
                };
                class ACE_JoinTeamYellow {
                    condition = QUOTE(_player call DFUNC(hasSquad));
                    showDisabled = 0;
                };
                class ACE_LeaveTeam {
                    condition = QUOTE(_player call DFUNC(hasSquad) && {assignedTeam _player != 'MAIN'});
                    showDisabled = 0;
                };
                class ACE_BecomeLeader {
                    condition = QUOTE(_player call DFUNC(canBecomeSquadLeader));
                    statement = QUOTE(_player call DFUNC(setSquadLeaderClient));
                    showDisabled = 0;
                };
                class ACE_LeaveGroup {
                    condition = QUOTE(_player call DFUNC(canLeaveSquad));
                    statement = QUOTE(_player call DFUNC(leaveSquadClient));
                    showDisabled = 0;
                };

                class GVAR(removeFromSquad) {
                    displayName = CSTRING(RemoveFromSquad);
                    condition = QUOTE(_player call DFUNC(isLeader));
                    statement = ""
                    exceptions[] = {"isNotSwimming"};
                    showDisabled = 0;
                    icon = QPATHTOF(data\remove_from_squad.paa);
                    insertChildren = QUOTE(_this call DFUNC(addRemoveFromSquadActions));
                };
            };
        };
    };
};
