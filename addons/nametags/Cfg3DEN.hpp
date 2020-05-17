class Cfg3DEN {
    class Attributes {
        class Combo;
        class GVAR(ranksCombo): Combo {
            attributeLoad = QUOTE(_this call FUNC(ranksComboAttributeLoad));
        };
    };
};
