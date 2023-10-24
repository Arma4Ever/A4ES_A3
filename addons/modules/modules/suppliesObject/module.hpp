class GVAR(suppliesObject): GVAR(base) {
    scope = 2;
    author = "Krzyciu,SzwedzikPL";
    displayName = CSTRING(suppliesObject_displayName);
    icon = "\a3\3den\data\displays\display3den\panelright\modegroups_ca.paa";
    category = QGVAR(supplies);
    function = QFUNC(suppliesObject_module);
    functionPriority = 5;
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(suppliesObject_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(side): GVAR(dynamicToolboxSideFull) {
            displayName = CSTRING(fortifyObject_Attributes_side);
            tooltip = CSTRING(fortifyObject_Attributes_side_Tooltip);
            property = QGVAR(side);
            defaultValue = "0";
            typeName = "NUMBER";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(name): GVAR(dynamicEdit) {
            displayName = CSTRING(suppliesObject_Attributes_name);
            tooltip = CSTRING(suppliesObject_Attributes_name_tooltip);
            property = QGVAR(name);
            GVAR(observeValue) = 1;
        };

        class GVAR(objectCount): GVAR(dynamicEdit) {
            displayName = CSTRING(suppliesObject_Attributes_objectCount);
            tooltip = CSTRING(suppliesObject_Attributes_objectCount_Tooltip);
            property = QGVAR(objectCount);
            defaultValue = "0";
            validate = "NUMBER";
            ATTRIBUTE_LOCAL;
            GVAR(observeValue) = 1;
        };

        class GVAR(deleteObject): GVAR(dynamicCheckbox) {
            displayName = CSTRING(suppliesObject_Attributes_deleteObject);
            tooltip = CSTRING(suppliesObject_Attributes_deleteObject_tooltip);
            property = QGVAR(deleteObject);
            defaultValue = "true";
            GVAR(observeValue) = 0;
            ATTRIBUTE_LOCAL;
        };

        class GVAR(addObjectPostInit): GVAR(dynamicCheckbox) {
            displayName = CSTRING(suppliesObject_Attributes_addObjectPostInit);
            tooltip = CSTRING(suppliesObject_Attributes_addObjectPostInit_tooltip);
            property = QGVAR(addObjectPostInit);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(objectPostInit): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(suppliesObject_Attributes_objectPostInit);
            tooltip = CSTRING(suppliesObject_Attributes_objectPostInit_tooltip);
            GVAR(description) = CSTRING(suppliesObject_Attributes_objectPostInit_desc);
            property = QGVAR(objectPostInit);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addObjectPostInit)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(suppliesObject_shortDescription);
        description = CSTRING(suppliesObject_description);
        canSyncWith[] = {"<anyVehicle>", "<anyObject>"};
        syncRequired = 1;
        syncRequiredInfo = CSTRING(suppliesObject_syncRequiredInfo);
    };
};
