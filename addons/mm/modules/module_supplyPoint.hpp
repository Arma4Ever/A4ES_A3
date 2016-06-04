class GVAR(module_supplyPoint): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_SupplyPoint_DisplayName);
    category = "a3cs_modules_support";
    function = QUOTE(DFUNC(module_supplyPoint));

    class Attributes: AttributesBase {
        class range: Edit {
            displayName = CSTRING(Module_SupplyPoint_Range_DisplayName);
            tooltip = CSTRING(Module_SupplyPoint_Range_Description);
            property = QGVAR(module_supplyPoint_range);
            typeName = "NUMBER";
            defaultValue = 10;
        };
        class rearmPoint: CheckboxNumber {
            displayName = CSTRING(Module_SupplyPoint_RearmPoint_DisplayName);
            tooltip = CSTRING(Module_SupplyPoint_RearmPoint_Description);
            property = QGVAR(module_rupplyPoint_rearmPoint);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class refuelPoint: CheckboxNumber {
            displayName = CSTRING(Module_SupplyPoint_RefuelPoint_DisplayName);
            tooltip = CSTRING(Module_SupplyPoint_RefuelPoint_Description);
            property = QGVAR(module_rupplyPoint_refuelPoint);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class repairPoint: CheckboxNumber {
            displayName = CSTRING(Module_SupplyPoint_RepairPoint_DisplayName);
            tooltip = CSTRING(Module_SupplyPoint_RepairPoint_Description);
            property = QGVAR(module_rupplyPoint_repairPoint);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_SupplyPoint_Description);
    };
};
