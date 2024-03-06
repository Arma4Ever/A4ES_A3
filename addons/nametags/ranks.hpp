
class GVAR(ranks_categories) {
    class default {
        displayName = CSTRING(RankCategory_Default);
    };
    class pl {
        displayName = CSTRING(RankCategory_PL);
    };
    class pol {
        displayName = CSTRING(RankCategory_PolicePL);
    };
    class usnavy {
        displayName = "US Navy";
    };
    class usmc {
        displayName = "USMC";
    };
    class usarmy {
        displayName = "US Army";
    };
    class usaf {
        displayName = "USAF";
    };
    class ru {
        displayName = CSTRING(RankCategory_RU);
    };
    class cdf {
        displayName = CSTRING(RankCategory_CDF);
    };
    class ukr {
        displayName = CSTRING(RankCategory_UKR);
    };
    class ww2us {
        displayName = "[WW2] US Army";
    };
    class ww2usmc {
        displayName = "[WW2] USMC";
    };
    class ww2uk {
        displayName = "[WW2] UK";
    };
    class ww2ru {
        displayName = CSTRING(RankCategory_ww2RU);
    };
    class ww2ger {
        displayName = "[WW2] Wehrmacht";
    };
    class ww2jap {
        displayName = CSTRING(RankCategory_ww2JAP);
    };
    class ww2lwp {
        displayName = CSTRING(RankCategory_ww2POL);
    };
};

class GVAR(ranks) {
    class default {
        name = CSTRING(RankCategory_Default);
    };

    #include "ranks\pl\ranks.hpp"
    #include "ranks\pol\ranks.hpp"
    #include "ranks\usarmy\ranks.hpp"
    #include "ranks\usmc\ranks.hpp"
    #include "ranks\usnavy\ranks.hpp"
    #include "ranks\usaf\ranks.hpp"
    #include "ranks\ru\ranks.hpp"
    #include "ranks\cdf\ranks.hpp"
    #include "ranks\ukr\ranks.hpp"
    #include "ranks\ww2us\ranks.hpp"
    #include "ranks\ww2usmc\ranks.hpp"
    #include "ranks\ww2uk\ranks.hpp"
    #include "ranks\ww2ru\ranks.hpp"
    #include "ranks\ww2ger\ranks.hpp"
    #include "ranks\ww2jap\ranks.hpp"
    #include "ranks\ww2lwp\ranks.hpp"
};
