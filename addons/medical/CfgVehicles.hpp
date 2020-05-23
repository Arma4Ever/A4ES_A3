class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Medical {
                condition = "!a3cs_medical_systemDisabled && {ace_medical_gui_enableSelfActions}";
            };
            class ACE_Medical_Menu {
                condition = "!a3cs_medical_systemDisabled && {[_player,_target] call ace_medical_gui_fnc_canOpenMenu}";
            };
        };
        class ACE_Actions {
            class ACE_MainActions {
                class ACE_Medical_Menu {
                    condition = "!a3cs_medical_systemDisabled && {[ACE_player,_target] call ace_medical_gui_fnc_canOpenMenu}";
                };
                class ACE_Medical_Radial {
                    condition = "!a3cs_medical_systemDisabled && {(ace_medical_gui_enableActions== 1 || {ace_medical_gui_enableActions!= 2 && {vehicle _target != _target && {vehicle _target == vehicle _player}}})}";
                };
            };
        };
    };
};
