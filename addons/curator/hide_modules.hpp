class ModuleWeather_F: Module_F {
    scopeCurator = 0;
};
class ModuleObjective_F: Module_F {
    scopeCurator = 0;
};
class ModuleObjectiveMove_F: ModuleObjective_F {
    scopeCurator = 0;
};
class ModuleObjectiveSector_F: ModuleObjective_F {
    scopeCurator = 0;
};
class ModuleObjectiveAttackDefend_F: ModuleObjective_F {
    scopeCurator = 0;
};
class ModuleObjectiveNeutralize_F: ModuleObjective_F {
    scopeCurator = 0;
};
class ModuleObjectiveProtect_F: ModuleObjective_F {
    scopeCurator = 0;
};
class ModuleObjectiveGetIn_F: ModuleObjective_F {
    scopeCurator = 0;
};
class ModuleRespawnTickets_F: Module_F {
    scopeCurator = 0;
};
class ModuleRespawnInventory_F: Module_F {
    scopeCurator = 0;
};
class ModuleRespawnPositionWest_F: Module_F {
    scopeCurator = 0;
};
class ModuleRespawnPositionEast_F: ModuleRespawnPositionWest_F {
    scopeCurator = 0;
};
class ModuleRespawnPositionGuer_F: ModuleRespawnPositionWest_F {
    scopeCurator = 0;
};
class ModuleRespawnPositionCiv_F: ModuleRespawnPositionWest_F {
    scopeCurator = 0;
};
class ModuleVehicleRespawnPositionWest_F: ModuleRespawnPositionWest_F {
    scopeCurator = 0;
};
class ModuleVehicleRespawnPositionEast_F: ModuleVehicleRespawnPositionWest_F {
    scopeCurator = 0;
};
class ModuleVehicleRespawnPositionGuer_F: ModuleVehicleRespawnPositionWest_F {
    scopeCurator = 0;
};
class ModuleVehicleRespawnPositionCiv_F: ModuleVehicleRespawnPositionWest_F {
    scopeCurator = 0;
};
class ModuleCountdown_F: Module_F {
    scopeCurator = 0;
};
class ModuleBootcampStage_F: Module_F {
    scopeCurator = 0;
};
class ModuleHint_F: ModuleBootcampStage_F {
    scopeCurator = 0;
};
class ModulePunishment_F: ModuleBootcampStage_F {
    scopeCurator = 0;
};

class ace_zeus_moduleDefendArea: ace_zeus_moduleBase {
    scopeCurator = 0;
};
class ace_zeus_modulePatrolArea: ace_zeus_moduleBase {
    scopeCurator = 0;
};
class ace_zeus_moduleSearchArea: ace_zeus_moduleBase {
    scopeCurator = 0;
};
class ace_zeus_moduleSearchNearby: ace_zeus_moduleBase {
    scopeCurator = 0;
};
class ace_zeus_moduleGroupSide: ace_zeus_moduleBase {
    scopeCurator = 0;
};
class ace_zeus_moduleSimulation: ace_zeus_moduleBase {
    scopeCurator = 0;
};
class ace_zeus_moduleGarrison: ace_zeus_moduleBase {
    scopeCurator = 0;
};
class ace_zeus_moduleUnGarrison: ace_zeus_moduleBase {
    scopeCurator = 0;
};

class zen_modules_moduleGarrison: zen_modules_moduleBase {
    scopeCurator = 0;
};
class zen_modules_modulePatrolArea: zen_modules_moduleBase {
    scopeCurator = 0;
};
class zen_modules_moduleUnGarrison: zen_modules_moduleBase {
    scopeCurator = 0;
};

class VirtualCurator_F;
class B_VirtualCurator_F: VirtualCurator_F {
    scope = 1;
};
class O_VirtualCurator_F: VirtualCurator_F {
    scope = 1;
};
class I_VirtualCurator_F: VirtualCurator_F {
    scope = 1;
};
class C_VirtualCurator_F: VirtualCurator_F {
    scope = 1;
};
