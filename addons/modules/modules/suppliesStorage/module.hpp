class GVAR(suppliesStorage): GVAR(base) {
    scope = 2;
    author = "Krzyciu, SzwedzikPL";
    displayName = CSTRING(suppliesStorage_displayName);
    icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\interact_ca.paa";
    category = QGVAR(supplies);
    function = QFUNC(suppliesStorage_moduleExec);
    functionPriority = 10;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(suppliesStorage_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(storageID): GVAR(dynamicEdit) {
            displayName = CSTRING(suppliesStorage_Attributes_id);
            tooltip = CSTRING(suppliesStorage_Attributes_id_tooltip);
            property = QGVAR(storageid);
            defaultValue = "''";
            unique = 1;
            GVAR(description) = CSTRING(suppliesStorage_Attributes_id_desc);
            GVAR(disabled) = 1;
            ATTRIBUTE_LOCAL;
        };
        
        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };
    
    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(suppliesStorage_shortDescription);
        description = CSTRING(suppliesStorage_description);
        canSyncWith[] = {"<anyVehicle>", "<anyObject>"};
        syncRequired = 1;
        syncRequiredInfo = CSTRING(suppliesStorage_syncRequiredInfo);
    };
};
