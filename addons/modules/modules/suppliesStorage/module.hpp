class GVAR(suppliesStorage): GVAR(base) {
    scope = 2;
    author = "Krzyciu";
    displayName = CSTRING(suppliesStorage_displayName);
    icon = "\a3\3den\data\displays\display3den\panelright\modegroups_ca.paa";
    category = QGVAR(supplies);
    function = QFUNC(suppliesStorage_moduleExec);
    functionPriority = 10;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(suppliesStorage_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(storageID): GVAR(dynamicEdit) {
            displayName = CSTRING(suppliesObject_Attributes_id);
            tooltip = CSTRING(suppliesObject_Attributes_id_tooltip);
            property = QGVAR(id);
            defaultValue = "''";
            unique = 1;
            GVAR(description) = CSTRING(suppliesObject_Attributes_id_desc);
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
        syncRequiredInfo = CSTRING(suppliesObject_syncRequiredInfo);
    };
};
