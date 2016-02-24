class GVAR(module_genCAS): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_GenCAS_DisplayName);
    category = "a3cs_modules_support";
    function = QUOTE(DFUNC(module_genCAS));

    class Attributes: AttributesBase {
        class place: Edit {
            displayName = CSTRING(Module_GenCAS_Place_DisplayName);
            tooltip = CSTRING(Module_GenCAS_Place_Description);
            property = QGVAR(module_genCAS_place);
            defaultValue = "''";
        };
        class plane: Edit {
            displayName = CSTRING(Module_GenCAS_Plane_DisplayName);
            tooltip = CSTRING(Module_GenCAS_Plane_Description);
            property = QGVAR(module_genCAS_plane);
            defaultValue = "''";
        };
        class type: Combo {
            displayName = CSTRING(Module_GenCAS_Type_DisplayName);
            tooltip = CSTRING(Module_GenCAS_Type_Description);
            property = QGVAR(module_genCAS_type);
            defaultValue = "'0'";
            class values {
                class gunrun {name = CSTRING(Module_GenCAS_Type_Gunrun_DisplayName); value = "0"; default = 1;};
                class rocketrun {name = CSTRING(Module_GenCAS_Type_Rocketrun_DisplayName); value = "1"; default = 0;};
                class bothrun {name = CSTRING(Module_GenCAS_Type_Bothrun_DisplayName); value = "2"; default = 0;};
                class bomb {name = CSTRING(Module_GenCAS_Type_Bomb_DisplayName); value = "3"; default = 0;};
                class bombone {name = CSTRING(Module_GenCAS_Type_Bombone_DisplayName); value = "4"; default = 0;};
            };
        };
        class planeDir: Edit {
            displayName = CSTRING(Module_GenCAS_PlaneDir_DisplayName);
            tooltip = CSTRING(Module_GenCAS_PlaneDir_Description);
            property = QGVAR(module_genCAS_planeDir);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class side: Combo {
            displayName = CSTRING(Module_GenCAS_Side_DisplayName);
            tooltip = CSTRING(Module_GenCAS_Side_Description);
            property = QGVAR(module_genCAS_side);
            defaultValue = "'west'";
            class values {
                class blufor {name = CSTRING(Side_Blufor); value = "west"; default = 1;};
                class opfor {name = CSTRING(Side_Opfor); value = "east"; default = 0;};
                class indep {name = CSTRING(Side_Indep); value = "independent"; default = 0;};
            };
        };
        class weaponIndex: Edit {
            displayName = CSTRING(Module_GenCAS_WeaponIndex_DisplayName);
            tooltip = CSTRING(Module_GenCAS_WeaponIndex_Description);
            property = QGVAR(module_genCAS_weaponIndex);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_GenCAS_Description);
    };
};
