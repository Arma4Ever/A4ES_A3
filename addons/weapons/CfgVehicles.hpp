class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                delete ace_reload_checkAmmo;
                delete ace_overheating_CheckTemperature;

                class GVAR(checkWeapon) {
                    displayName = "Sprawdz bron";
                    condition = QUOTE( (currentWeapon _player) != '' && {(currentWeapon _player) != (secondaryWeapon _player)} );
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                    statement = QUOTE( _player call FUNC(checkWeapon); );
                    showDisabled = 0;
                    icon = "";
                };
            };
        };
    };
};
