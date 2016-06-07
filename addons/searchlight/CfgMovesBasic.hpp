class CfgMovesBasic {
    class ManActions {
        searchlight_Gunner = "searchlight_Gunner";
    };
};
class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        class Crew;
        class searchlight_Gunner: Crew {
            file = QPATHTOF(data\searchlight_Gunner.rtm);
            connectTo[] = {"Static_Dead",1};
        };
    };
};
