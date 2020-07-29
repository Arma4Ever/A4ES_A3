import os

VENDOR = {
    "@ACE": {
        "blacklist": [
            "ace_advanced_fatigue",
            "ace_hearing",
            "ace_nametags",
            "ace_sandbag"
        ],
        "optionals": [
            os.path.join("@ace_nocrosshair", "addons", "ace_nocrosshair.pbo"),
            os.path.join("@ace_nouniformrestrictions", "addons", "ace_nouniformrestrictions.pbo"),
        ],
    },
    "@ACEX": {
        "blacklist": ["acex_volume", "acex_viewrestriction", "acex_headless"],
    },
    "@LAMBS_Danger.fsm": {},
    "@LAMBS_Suppression": {},
    "@Zeus Enhanced": {},
    "@Zeus Enhanced - ACE3 Compatibility": {},
    "@Enhanced Movement": {},
    "@Enhanced Movement Rework": {},
    "@GRAD Trenches": {},
    "@GRAD SlingHelmet": {},
    "@VET_Unflipping": {},
    "@BackpackOnChest": {},
    "@Breaching Charge": {},
    "@The Mighty GAU-8 Avenger": {},
    "@The Mighty GAU-8 Avenger - Less FX More Performance": {},
    "@The Mighty GAU-8 Avenger - ACE": {},
    "@RSPN Cave Systems for Eden": {},
    "@Eden Extended Objects": {},
    "@O&T Expansion Eden": {
        "blacklist": ["expEden_static_ssDM"],
    },
    "@Metis Nature": {},
    "@vurtual's Car Seat & Stretcher": {},
    "@Vurtual's Ships": {},
    "@PLP Materials": {},
    "@Extended Fortifications Mod": {},
    "@AVON FM12 Respirator Pack": {},
    "@Wearable Antennae": {},
    "@ArmaZeusCache": {},
    # "@Camofaces": {},
    "-Mocap": {
        "whitelist": ["MOCAP_mov"],
    },
    "-JSHK_Contamination_Gear": {},
    "-A3CS_vendor": {},
}
