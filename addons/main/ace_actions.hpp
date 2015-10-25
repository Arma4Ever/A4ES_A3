class Man;
class CAManBase: Man {
    class ACE_Actions {
        class ACE_MainActions {
            class ACE_TapShoulderMain {
                displayName = "$STR_ACE_Interaction_TapShoulder";
                selection = "";
                distance = 2.0;
                condition = QUOTE([ARR_2(_player, _target)] call ace_interaction_fnc_canTapShoulder);
                statement = QUOTE([ARR_3(_player, _target, 0)] call ace_interaction_fnc_tapShoulder);
            };
        };
        delete ACE_TapShoulderRight;
        delete ACE_TapShoulderLeft;
    };
    class ACE_SelfActions {
        class Medical {
            condition = "1==0";
        };
    };
};
