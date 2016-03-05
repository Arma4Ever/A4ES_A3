class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class AttributesBase {
            class Default;
            class Edit;
            class Combo;
            class Checkbox;
            class CheckboxNumber;
            class ModuleDescription;
        };
    };
    class A3C_Module: Module_F {
        scope = 0;
        scopeCurator = 0;
        functionPriority = 10; // Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
        isGlobal = 0; // 0 for server only execution
        isTriggerActivated = 1; // 1 for module waiting until all synced triggers are activated
        isDisposable = 0; //BUGGED
        disposable = 1; //own solution
        is3DEN = 1; // 1 to run init function in Eden Editor as well
        execIn3DEN = 0; // own solution - default not run module in eden
        class AttributesBase: AttributesBase {
            class Default: Default {};
            class EditMulti3: Default {
                control = "EditMulti3";
            };
            class EditMulti5: Default {
                control = "EditMulti5";
            };
        };
        class ModuleDescription {};
    };

    //----- AI
    #include "modules\module_cacheSettings.hpp"
    #include "modules\module_genSoldiers.hpp"
    #include "modules\module_genAttack.hpp"
    #include "modules\module_surrenderUnit.hpp"
    #include "modules\module_handcuffUnit.hpp"
    //#include "modules\module_genParadrop.hpp" //--todo: rewirte

    //----- Effects
    #include "modules\module_sandStorm.hpp"
    #include "modules\module_fogEffect.hpp"
    #include "modules\module_snowEffect.hpp"
    #include "modules\module_breathFog.hpp" //-- FIX!
    #include "modules\module_colorCorrections.hpp"
    #include "modules\module_genMinefield.hpp"
    //#include "modules\module_genFlare.hpp" //--todo: write, option to set color and height
    //#include "modules\module_genFire.hpp" //--todo: write
    //#include "modules\module_genSmoke.hpp" //--todo: write
    #include "modules\module_lanterns.hpp"
    #include "modules\module_playSound.hpp"
    #include "modules\module_missionIntro.hpp"
    //#include "modules\module_restrictedArea.hpp" //--todo: rewrite
    //#include "modules\module_radioJamming.hpp" //--todo: write
    #include "modules\module_hideTerrainObjects.hpp"

    //----- Interaction
    //#include "modules\module_createDialog.hpp" //--todo: optimize, use ace_interact_menu
    //#include "modules\module_addDialogQuestion.hpp" //--todo: add code executed after asking question, optimize
    //#include "modules\module_addAction.hpp" //--todo: write

    //----- Support
    #include "modules\module_fireArtillery.hpp"
    //#include "modules\module_genCAS.hpp" //--todo: rewirte
    //#include "modules\module_genHeliSupportdrop.hpp" //--todo: rewirte
    //#include "modules\module_genSupplydrop.hpp" //--todo: rewirte

    //----- Tasks
    #include "modules\module_createTask.hpp"
    #include "modules\module_setTaskState.hpp"
};
