class States {
    displayName = CSTRING(Scenario_AttributeCategory_States_displayName);
    class Attributes {
        delete EnableTargetDebug;

        class Briefing {
            control = QGVAR(hiddenCheckbox);
        };
        class Debriefing {
            control = QGVAR(hiddenCheckbox);
        };
        class Saving {
            control = QGVAR(hiddenCheckbox);
        };
        class ShowMap {
            control = QGVAR(hiddenCheckbox);
        };
        class ShowCompass {
            control = QGVAR(hiddenCheckbox);
        };
        class ShowWatch {
            control = QGVAR(hiddenCheckbox);
        };
        class ShowGPS {
            control = QGVAR(hiddenCheckbox);
        };
        class ShowHUD {
            control = QGVAR(hiddenCheckbox);
        };
        class ShowUAVFeed {
            control = QGVAR(hiddenCheckbox);
        };
        class ForceRotorLibSimulation {
            control = QGVAR(hiddenCheckbox);
        };
    };
};
