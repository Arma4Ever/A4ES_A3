class CfgVehicles {
    class LandVehicle;
    class Tank: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(throwInGrenade) {
                    displayName = CSTRING(ThrowInGrenade_displayName);
                    condition = QUOTE(_this call FUNC(canThrowInGrenade));
                    insertChildren = QUOTE(_this call FUNC(getThrowInChildren));
                    showDisabled = 0;
                    icon = QPATHTOF(data\throw_In_grenade_ca.paa);
                };
                class GVAR(knockOnHatch) {
                    displayName = CSTRING(KnockOnHatch_displayName);
                    condition = QUOTE(_this call FUNC(canKnockOnHatch));
                    statement = QUOTE(_this call FUNC(knockOnHatch));
                    showDisabled = 0;
                    icon = QPATHTOF(data\knock_on_tank_ca.paa);
                };
            };
        };
    };
};
