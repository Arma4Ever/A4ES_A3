import os

VENDOR = {
    "@ACE": {
        "blacklist": ["ace_advanced_fatigue", "ace_hearing", "ace_nametags", "ace_sandbag"],
        "optionals": [
            os.path.join("@ace_nocrosshair", "addons", "ace_nocrosshair.pbo"),
            os.path.join("@ace_nouniformrestrictions", "addons", "ace_nouniformrestrictions.pbo"),
            os.path.join("@ace_particles", "addons", "ace_particles.pbo"),
            os.path.join("@ace_tracers", "addons", "ace_tracers.pbo"),
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
    "@VET_Unflipping": {},
    "@BackpackOnChest": {},
    "@Breaching Charge": {},
    "@The Mighty GAU-8 Avenger": {},
    "@The Mighty GAU-8 Avenger - Less FX More Performance": {},
    "@The Mighty GAU-8 Avenger - ACE": {},
    "@Zombies and Demons": {},
    "@RSPN Cave Systems for Eden": {},
    "@Eden Extended Objects": {},
    "@O&T Expansion Eden": {},
    "@Metis Nature": {},
    # "@Camofaces": {},
}
