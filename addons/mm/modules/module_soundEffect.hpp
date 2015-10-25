class GVAR(module_soundEffect): A3C_Module
{
	scope = 2;
    author = "Arma3Coop.pl";
	displayName = "Efekty dzwiekowe";
	category = "a3cs_modules_effects";
	function = QUOTE(DFUNC(module_soundEffect));

    class Arguments
    {
        class EffectType
        {
            displayName = "Dzwiek";
            description = "Rodzaj odtwarzanego dzwieku";
            typeName = "STRING";
            class values
            {
                                    class Effect01 {
                                            name = "Dzwiek #1";
                                            value = QGVAR(soundeffect_01);
                                            default = 1;
                                    };
                                    class Effect02 {
                                            name = "Dzwiek #2";
                                            value = QGVAR(soundeffect_02);
                                            default = 0;
                                    };
                                    class Effect3 {
                                            name = "Arabski market #1";
                                            value = QGVAR(soundeffect_03);
                                            default = 0;
                                    };
                                    class Effect4 {
                                            name = "Arabski market #2";
                                            value = QGVAR(soundeffect_04);
                                            default = 0;
                                    };
                                    class Effect5 {
                                            name = "Arabski market #3";
                                            value = QGVAR(soundeffect_05);
                                            default = 0;
                                    };
                                    class Effect6 {
                                            name = "Arabski market #4";
                                            value = QGVAR(soundeffect_06);
                                            default = 0;
                                    };
                                    class Effect7 {
                                            name = "Arabskie modlitwy #1";
                                            value = QGVAR(soundeffect_07);
                                            default = 0;
                                    };
                                    class Effect8 {
                                            name = "Arabskie modlitwy #2";
                                            value = QGVAR(soundeffect_08);
                                            default = 0;
                                    };
                                    class Effect9 {
                                            name = "Arabskie modlitwy #3";
                                            value = QGVAR(soundeffect_09);
                                            default = 0;
                                    };
                                    class Effect10 {
                                            name = "Arabskie modlitwy #4";
                                            value = QGVAR(soundeffect_10);
                                            default = 0;
                                    };
                                    class Effect11 {
                                            name = "Arabskie modlitwy #5";
                                            value = QGVAR(soundeffect_11);
                                            default = 0;
                                    };
                                    class Effect12 {
                                            name = "Allahu akbar";
                                            value = QGVAR(soundeffect_12);
                                            default = 0;
                                    };
                                    class Effect13 {
                                            name = "Lecacy Jet";
                                            value = QGVAR(soundeffect_13);
                                            default = 0;
                                    };
                                    class Effect14 {
                                            name = "Radio chatter";
                                            value = QGVAR(soundeffect_14);
                                            default = 0;
                                    };
                                    class Effect17 {
                                            name = "Efekt las noc #1";
                                            value = QGVAR(soundeffect_17);
                                            default = 0;
                                    };
                                    class Effect18 {
                                            name = "Efekt las noc #2";
                                            value = QGVAR(soundeffect_18);
                                            default = 0;
                                    };
                                    class Effect15 {
                                            name = "Efekt las dzien #1";
                                            value = QGVAR(soundeffect_15);
                                            default = 0;
                                    };
                                    class Effect19 {
                                            name = "Efekt las dzien #2";
                                            value = QGVAR(soundeffect_19);
                                            default = 0;
                                    };
                                    class Effect20 {
                                            name = "Efekt las dzien #3";
                                            value = QGVAR(soundeffect_20);
                                            default = 0;
                                    };
                                    class Effect16 {
                                            name = "Efekt wietrzny las";
                                            value = QGVAR(soundeffect_16);
                                            default = 0;
                    };
            };
        };
        class EffectLoop
        {
            displayName = "Powtarzaj";
            description = "Zapetlanie odtwarzanego dzwieku";
            typeName = "BOOL";
            class values
            {
                class EffectLoopFalse {
                    name = "Nie";
                    value = 0;
                    default = 1;
                };
                class EffectLoopTrue {
                    name = "Tak";
                    value = 1;
                    default = 0;
                };
            };
        };
    };
	class ModuleDescription: ModuleDescription
	{
		description = "";
	};
};
