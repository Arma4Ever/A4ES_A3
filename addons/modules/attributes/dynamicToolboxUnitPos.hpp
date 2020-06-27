
class GVAR(dynamicToolboxUnitPos): GVAR(dynamicToolboxPicture) {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            columns=4;
            strings[]= {
                "\a3\3DEN\Data\Attributes\default_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\down_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\middle_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\up_ca.paa"
            };
            tooltips[]= {
                "$STR_3den_attributes_stance_default",
                "$STR_3den_attributes_stance_down",
                "$STR_3den_attributes_stance_middle",
                "$STR_3den_attributes_stance_up"
            };
            values[] = {0, 1, 2, 3};
        };
        class GVAR(description): GVAR(description) {};
    };
};
