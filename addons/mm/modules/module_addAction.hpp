class GVAR(module_addAction): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_AddAction_DisplayName);
    category = "a3cs_modules_interactions";
    function = QUOTE(DFUNC(module_addAction));

    class Attributes: AttributesBase {
        class actionObject: Edit {
            displayName = CSTRING(Module_AddAction_ActionObject_DisplayName);
            tooltip = CSTRING(Module_AddAction_ActionObject_Description);
            property = QGVAR(module_addAction_actionObject);
            defaultValue = "''";
        };
        class actionName: Edit {
            displayName = CSTRING(Module_AddAction_ActionName_DisplayName);
            tooltip = CSTRING(Module_AddAction_ActionName_Description);
            property = QGVAR(module_addAction_actionName);
            defaultValue = "''";
        };
        class actionCodeLocal: EditMulti5 {
            displayName = CSTRING(Module_AddAction_ActionCodeLocal_DisplayName);
            tooltip = CSTRING(Module_AddAction_ActionCodeLocal_Description);
            property = QGVAR(module_addAction_actionCodeLocal);
            defaultValue = "''";
        };
        class actionCodeGlobal: EditMulti5 {
            displayName = CSTRING(Module_AddAction_ActionCodeGlobal_DisplayName);
            tooltip = CSTRING(Module_AddAction_ActionCodeGlobal_Description);
            property = QGVAR(module_addAction_actionCodeGlobal);
            defaultValue = "''";
        };
        class actionCondition: EditMulti3 {
            displayName = CSTRING(Module_AddAction_ActionCondition_DisplayName);
            tooltip = CSTRING(Module_AddAction_ActionCondition_Description);
            property = QGVAR(module_addAction_actionCondition);
            validate = "condition";
            defaultValue = "'true'";
        };
        class actionTarget: Combo {
            displayName = CSTRING(Module_AddAction_ActionTarget_DisplayName);
            tooltip = CSTRING(Module_AddAction_ActionTarget_Description);
            property = QGVAR(module_addAction_actionTarget);
            defaultValue = "'0'";
            class values {
                class allunits {name = CSTRING(Target_All); value = "0"; default = 1;};
                class syncedunits {name = CSTRING(Target_SyncedUnits); value = "synchronizedObjects _this"; default = 0;};
                class blufor {name = CSTRING(Side_Blufor); value = "west"; default = 0;};
                class opfor {name = CSTRING(Side_Opfor); value = "east"; default = 0;};
                class indep {name = CSTRING(Side_Indep); value = "independent"; default = 0;};
                class civ {name = CSTRING(Side_Civilian); value = "civilian"; default = 0;};
            };
        };
        class actionDisposable: CheckboxNumber {
            displayName = CSTRING(Module_AddAction_ActionDisposable_DisplayName);
            tooltip = CSTRING(Module_AddAction_ActionDisposable_Description);
            property = QGVAR(module_addAction_actionDisposable);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_AddAction_Description);
    };
};
