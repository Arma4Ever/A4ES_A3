class CfgVehicles {
    class Module_F;
    class A3C_Module: Module_F
    {
        scope = 0;
        scopeCurator = 0;
        author = "Arma3Coop.pl";
        isGlobal = 0;
        isDisposable = 1;
        isTriggerActivated = 1;

        class ModuleDescription {};
    };
    #include "modules\module_editBox.hpp"
    #include "modules\module_editBoxGUI.hpp"
    #include "modules\module_fireArtillery.hpp"
    #include "modules\module_genSoldiers.hpp"
    #include "modules\module_genAttack.hpp"
    #include "modules\module_genMinefield.hpp"
    #include "modules\module_genCrapfield.hpp"
    #include "modules\module_switchLights.hpp"
    #include "modules\module_deadzone.hpp"
    #include "modules\module_addDialogQuery.hpp"
    #include "modules\module_createDialog.hpp"
    #include "modules\module_setTask.hpp"
    #include "modules\module_setTaskState.hpp"
    #include "modules\module_genCas.hpp"
    #include "modules\module_genHeliSupportdrop.hpp"
    #include "modules\module_genParadrop.hpp"
    #include "modules\module_genSupplydrop.hpp"
    #include "modules\module_breathFog.hpp"
    #include "modules\module_colorCorrections.hpp"
    #include "modules\module_fogEffect.hpp"
    #include "modules\module_snowEffect.hpp"
    #include "modules\module_sandStorm.hpp"
    #include "modules\module_soundEffect.hpp"
    #include "modules\module_playSound.hpp"
    #include "modules\module_getInVehicle.hpp"
    #include "modules\module_assignMedic.hpp"
    #include "modules\module_assignEngineer.hpp"
    #include "modules\module_assignEod.hpp"
    #include "modules\module_assignMedicalVehicle.hpp"
    #include "modules\module_assignMedicalFacility.hpp"
    #include "modules\module_assignRepairFacility.hpp"
    #include "modules\module_assignRepairVehicle.hpp"
    #include "modules\module_surrenderUnit.hpp"
    #include "modules\module_handcuffUnit.hpp"
    #include "modules\module_weatherSettings.hpp"
};
