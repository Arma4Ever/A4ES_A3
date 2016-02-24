class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class A3CS_WeaponActionsUniformSwitch {
                displayName = CSTRING(switchUniform);
                condition = QUOTE([ARR_3(_player, 'uniform', 1)] call DFUNC(checkDivingGearAction));
                statement = QUOTE([ARR_2(_player, 'uniform')] call DFUNC(startDivingGearSwitch));
                exceptions[] = {};
                priority = -2;
                showDisabled = 0;
            };
            class A3CS_WeaponActionsUniformSwitchBack {
                displayName = CSTRING(switchUniformBack);
                condition = QUOTE([ARR_3(_player, 'uniform', 0)] call DFUNC(checkDivingGearAction));
                statement = QUOTE([ARR_2(_player, 'uniform')] call DFUNC(startDivingGearSwitch));
                exceptions[] = {};
                priority = -2;
                showDisabled = 0;
            };
            class A3CS_WeaponActionsVestSwitch {
                displayName = CSTRING(switchVest);
                condition = QUOTE([ARR_3(_player, 'vest', 1)] call DFUNC(checkDivingGearAction));
                statement = QUOTE([ARR_2(_player, 'vest')] call DFUNC(startDivingGearSwitch));
                exceptions[] = {};
                priority = -2;
                showDisabled = 0;
            };
            class A3CS_WeaponActionsVestSwitchBack {
                displayName = CSTRING(switchVestBack);
                condition = QUOTE([ARR_3(_player, 'vest', 0)] call DFUNC(checkDivingGearAction));
                statement = QUOTE([ARR_2(_player, 'vest')] call DFUNC(startDivingGearSwitch));
                exceptions[] = {};
                priority = -2;
                showDisabled = 0;
            };
            class A3CS_WeaponActions {
                displayName = CSTRING(WeaponActionsCat);
                condition = QUOTE(true);
                exceptions[] = {};
                insertChildren = QUOTE(_this call DFUNC(getWeaponActionsChildren));
                priority = -2;
                icon = QUOTE(\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryweapon_ca.paa);
            };
        };
    };
};
