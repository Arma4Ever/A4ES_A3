
class GarbageCollection {
    collapsed = 0;
    class Attributes {
        class CorpseManagerMode {
            control = QGVAR(hiddenCombo);
        };
        class WreckManagerMode {
            control = QGVAR(hiddenCombo);
        };
        class GVAR(garbageCollectionSetuped) {
            property = QGVAR(garbageCollectionSetuped);
            control = QGVAR(hiddenCheckbox);
            defaultValue = "false";
        };
    };
};
class DynamicSimulation {
    class Attributes {
        class DynSimEnabled {
            control = QGVAR(hiddenCheckbox);
        };
    };
};
