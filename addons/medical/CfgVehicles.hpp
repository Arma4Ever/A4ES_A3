class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Medical {
                condition = QUOTE(!GVAR(systemDisabled) && {_target getVariable [ARR_2(QUOTE(QUOTE(a3cs_medical_aceDamageEnabled)), false)]} && {ACEGVAR(medical_gui,enableSelfActions)});
            };
            class ACE_Medical_Menu {
                condition = QUOTE(!GVAR(systemDisabled) && {[ARR_2(_player,_target)] call ACEFUNC(medical_gui,canOpenMenu)});
            };
        };
        class ACE_Actions {
            class ACE_MainActions {
                class ACE_Medical_Menu {
                    condition = QUOTE(!GVAR(systemDisabled) && {[ARR_2(ACE_player,_target)] call ACEFUNC(medical_gui,canOpenMenu)});
                };
                class ACE_Medical_Radial {
                    condition = QUOTE(!GVAR(systemDisabled) && {_target getVariable [ARR_2(QUOTE(QUOTE(a3cs_medical_aceDamageEnabled)), false)]} && {((ACEGVAR(medical_gui,enableActions) == 1) || {(ACEGVAR(medical_gui,enableActions) == 2) && {(vehicle _target != _target) && {vehicle _target == vehicle _player}}})});
                };
            };
        };
    };
};
