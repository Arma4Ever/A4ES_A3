class GVAR(module_hideTerrainObjects): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_HideTerrainObjects_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_hideTerrainObjects));
    isTriggerActivated = 0;
    execIn3DEN = 1;

    class Attributes: AttributesBase {
        class distance: Edit {
            displayName = CSTRING(Module_HideTerrainObjects_Distance_DisplayName);
            tooltip = CSTRING(Module_HideTerrainObjects_Distance_Description);
            property = QGVAR(module_hideTerrainObjects_distance);
            typeName = "NUMBER";
            defaultValue = 10;
        };
        class tree: CheckboxNumber {
            displayName = "TREE";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_tree);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class smalltree: CheckboxNumber {
            displayName = "SMALL TREE";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_smalltree);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class bush: CheckboxNumber {
            displayName = "BUSH";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_bush);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class building: CheckboxNumber {
            displayName = "BUILDING";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_building);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class house: CheckboxNumber {
            displayName = "HOUSE";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_house);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class forestborder: CheckboxNumber {
            displayName = "FOREST BORDER";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_forestborder);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class foresttriangle: CheckboxNumber {
            displayName = "FOREST TRIANGLE";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_foresttriangle);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class forestsquare: CheckboxNumber {
            displayName = "FOREST SQUARE";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_forestsquare);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class church: CheckboxNumber {
            displayName = "CHURCH";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_church);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class chapel: CheckboxNumber {
            displayName = "CHAPEL";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_chapel);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class cross: CheckboxNumber {
            displayName = "CROSS";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_cross);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class rock: CheckboxNumber {
            displayName = "ROCK";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_rock);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class bunker: CheckboxNumber {
            displayName = "BUNKER";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_bunker);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class fortress: CheckboxNumber {
            displayName = "FORTRESS";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_fortress);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class fountain: CheckboxNumber {
            displayName = "FOUNTAIN";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_fountain);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class viewtower: CheckboxNumber {
            displayName = "VIEW-TOWER";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_viewtower);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class lighthouse: CheckboxNumber {
            displayName = "LIGHTHOUSE";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_lighthouse);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class quay: CheckboxNumber {
            displayName = "QUAY";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_quay);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class fuelstation: CheckboxNumber {
            displayName = "FUELSTATION";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_fuelstation);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class hospital: CheckboxNumber {
            displayName = "HOSPITAL";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_hospital);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class fence: CheckboxNumber {
            displayName = "FENCE";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_fence);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class wall: CheckboxNumber {
            displayName = "WALL";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_wall);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class hide: CheckboxNumber {
            displayName = "HIDE";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_hide);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class busstop: CheckboxNumber {
            displayName = "BUSSTOP";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_busstop);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class road: CheckboxNumber {
            displayName = "ROAD";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_road);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class forest: CheckboxNumber {
            displayName = "FOREST";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_forest);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class transmitter: CheckboxNumber {
            displayName = "TRANSMITTER";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_transmitter);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class stack: CheckboxNumber {
            displayName = "STACK";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_stack);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class ruin: CheckboxNumber {
            displayName = "RUIN";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_ruin);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class tourism: CheckboxNumber {
            displayName = "TOURISM";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_tourism);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class watertower: CheckboxNumber {
            displayName = "WATERTOWER";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_watertower);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class track: CheckboxNumber {
            displayName = "TRACK";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_track);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class mainroad: CheckboxNumber {
            displayName = "MAIN ROAD";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_mainroad);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class rocks: CheckboxNumber {
            displayName = "ROCKS";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_rocks);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class powerlines: CheckboxNumber {
            displayName = "POWER LINES";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_powerlines);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class railway: CheckboxNumber {
            displayName = "RAILWAY";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_railway);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class powersolar: CheckboxNumber {
            displayName = "POWERSOLAR";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_powersolar);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class powerwave: CheckboxNumber {
            displayName = "POWERWAVE";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_powerwave);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class powerwind: CheckboxNumber {
            displayName = "POWERWIND";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_powerwind);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class shipwreck: CheckboxNumber {
            displayName = "SHIPWRECK";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_shipwreck);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class trail: CheckboxNumber {
            displayName = "TRAIL";
            tooltip = CSTRING(Module_HideTerrainObjects_Types_Description);
            property = QGVAR(module_hideTerrainObjects_trail);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_HideTerrainObjects_Description);
    };
};
