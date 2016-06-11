class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class AttributesBase {
            class Edit;
            class Combo;
            class Checkbox;
            class CheckboxNumber;
            class ModuleDescription;
        };
        class ModuleDescription {
            class Anything;
            class AnyPlayer;
            class AnyObject;
            class EmptyDetector;
        };
    };
    class ModuleCurator_F: Module_F {
        class Attributes: AttributesBase {
            class Addons: Combo {
                defaultValue = 3;
                class Values {
                    delete AllActive;
                    delete AllMission;
                    delete None;

                    class All {
                        name = "$STR_A3_CfgVehicles_ModuleCurator_F_Arguments_Addons_values_All";
                        value = 3;
                        default = 1;
                    };
                };
            };
        };
    };

    class VirtualCurator_F;
    class B_VirtualCurator_F: VirtualCurator_F {
        scope = 1;
    };
    class O_VirtualCurator_F: VirtualCurator_F {
        scope = 1;
    };
    class I_VirtualCurator_F: VirtualCurator_F {
        scope = 1;
    };
    class C_VirtualCurator_F: VirtualCurator_F {
        scope = 1;
    };
};
