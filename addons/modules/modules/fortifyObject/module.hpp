class GVAR(fortifyObject): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(fortifyObject_displayName);
    //icon = "";
    category = QGVAR(fortify);
    function = QFUNC(fortifyObject_module);
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(fortifyObject_validate);

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

        class GVAR(objectClass): GVAR(dynamicEdit) {
            displayName = CSTRING(fortifyObject_Attributes_objectClass);
            tooltip = CSTRING(fortifyObject_Attributes_objectClass_Tooltip);
            property = QGVAR(objectClass);
            defaultValue = "''";
            GVAR(observeValue) = 1;
            ATTRIBUTE_LOCAL;
        };

        class GVAR(objectCost): GVAR(dynamicEdit) {
            displayName = CSTRING(fortifyObject_Attributes_objectCost);
            tooltip = CSTRING(fortifyObject_Attributes_objectCost_Tooltip);
            property = QGVAR(objectCost);
            defaultValue = "0";
            validate = "NUMBER";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(fortifyObject_shortDescription);
    };
};
