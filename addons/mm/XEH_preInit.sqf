#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

//vars
GVAR(cacheEnabled) = true;
GVAR(cacheInited) = false;
GVAR(cacheDistanceLand) = 2000;
GVAR(cacheDistanceHelicopters) = 3000;
GVAR(cacheDistancePlanes) = 0;
GVAR(cacheLeaders) = false;
GVAR(cacheIndex) = 0;

/*
PREP(removeDummyVest);
PREP(addBoxItems);
PREP(breathFogLocal);
PREP(colorCorrectionsLocal);
PREP(createDialogLocal);
PREP(dialogQuery);
PREP(fogEffectLocal);
PREP(openDialog);
PREP(soundEffectLocal);
PREP(sandStormLocal);
PREP(setTaskLocal);
PREP(setTaskStateLocal);
PREP(snowEffectLocal);

PREP(initHC);

PREP(module_genAttack);
PREP(module_genSoldiers);
PREP(module_genMinefield);
PREP(module_genCrapfield);
PREP(module_switchLights);
PREP(module_playSound);
PREP(module_addDialogQuery);
PREP(module_breathFog);
PREP(module_colorCorrections);
PREP(module_createDialog);
PREP(module_deadzone);
PREP(module_fogEffect);
PREP(module_forceGunLights);
PREP(module_soundEffect);
PREP(module_sandStorm);
PREP(module_setTask);
PREP(module_setTaskState);
PREP(module_snowEffect);
PREP(module_fireArtillery);
PREP(module_genCas);
PREP(module_genHeliSupportdrop);
PREP(module_genParadrop);
PREP(module_genSupplydrop);
PREP(module_getInVehicle);

PREP(module_assignMedic);
PREP(module_assignEngineer);
PREP(module_assignEod);
PREP(module_assignMedicalVehicle);
PREP(module_assignMedicalFacility);
PREP(module_assignRepairFacility);
PREP(module_assignRepairVehicle);

PREP(module_surrenderUnit);
PREP(module_handcuffUnit);
*/

ADDON = true;
