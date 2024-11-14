import os

# Prefix of A4ES pbo's
modPboPrefix = 'a4es'
# A4ES addons that should be moved to internal mod
internalAddons = ['admin','stats','settings','main_menu','branding','vendor','particles']
# Project root files that should be copied to internal mod
internalCommonRootFiles = ["LICENSE", "logo_a4es.paa", "logosmall_a4es.paa", "picture_a4es.paa"]

# Vendor mods
vendorModsList = {
    # ---------------------------------------------- BASE MODS
    "@ACE": {
        "baseMod": True,
        "blacklist": [
            "ace_advanced_fatigue",
            "ace_hearing",
            "ace_nametags",
            "ace_sandbag",
            "ace_volume",
            "ace_viewrestriction",
            "ace_headless",
            "ace_killtracker"
        ],
        "optionals": [
            os.path.join("@ace_nocrosshair", "addons", "ace_nocrosshair.pbo"),
            os.path.join("@ace_nouniformrestrictions", "addons", "ace_nouniformrestrictions.pbo"),
        ],
    },
    "@LAMBS_Danger.fsm": {
        "baseMod": True,
    },
    "@LAMBS_Suppression": {
        "baseMod": True,
    },
    "@LAMBS_Turrets": {
        "baseMod": True,
    },
    "@LAMBS_RPG": {
        "baseMod": True,
    },
    "@Zeus Enhanced": {
        "baseMod": True,
    },
    "@Gruppe Adler Trenches": {
        "baseMod": True,
    },
    "@ArmaZeusCache": {
        "baseMod": True,
    },
    "@Eden Extended Objects": {
        "baseMod": True,
    },
    "@O&T Expansion Eden": {
        "baseMod": True,
        "blacklist": ["expEden_static_ssDM"],
    },
    "@ACD - Arma3 Containers And Decorations": {
        "baseMod": True,
    },
    "@3den Enhanced": {
        "baseMod": True,
    },
    "@Deformer": {
        "baseMod": True,
    },
    "@ILBE Assault Pack - Rewrite": {
        "baseMod": True,
    },
    "@Breaching Charge": {
        "baseMod": True,
    },
    "@FRXA's TFAR Extra Retextured Equipment": {
        "baseMod": True,
    },
    "@Swim Faster": {
        "baseMod": True,
    },
    "@Enhanced Movement": {
        "baseMod": True,
    },
    "@Enhanced Movement Rework": {
        "baseMod": True,
    },
    "@Ladder Tweak": {
        "baseMod": True,
    },
    "@VET_Unflipping": {
        "baseMod": True,
    },
    "@BackpackOnChest - Redux": {
        "baseMod": True,
    },
    # ---------------------------------------------- INTERNAL MODS
    "@Blastcore Murr Edition": {},
    "@PLP Markers": {},
    "@Metis Nature": {},
    "@Enhanced Map Ace Version": {},
    "@MS_IFF_Strobe": {},
    "@Death and Hit reactions": {},
    "@Snapping for Eden and Zeus": {},
    "@Blurry Laser": {},
    "@Better Inventory": {},
    # ---------------------------------------------- LEGACY MODS
    #"@Hate's Hidden Cameras": {},
    #"@VcomAI custom": {},
    #"@L3-GPNVG18 Panoramic Night Vision": {},
    #"@Uriki's Mission Items": {},
    #"@Simple Armbands": {},
    #"@Rismarck's Static Animations": {},
    #"@ZSL Static Poses [WW2]": {},
    #"@vurtual's Car Seat & Stretcher": {},
    #"@Vurtual's Ships": {},
    #"@Modular Buildings - Laboratory": {},
    #"@PLP Containers": {},
    #"@PLP Beach Objects": {},
    #"@PLP Urban Packs- Barriers and Fences": {},
    #"@PLP Urban Packs- Private Property": {},
    #"@Extended Fortifications Mod": {},
    #"@AVON FM12 Respirator Pack": {},
    #"@PMK-1 Gas mask": {},
    #"@M40 protective mask": {},
    #"@Ragdoll Physics Plus+ v1.12": {},
    #"-JSHK_Contamination_Gear": {},
    #"-A4ES_vendor": {},
}

# Paths

projectPath = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
hemttExePath = os.path.join(projectPath, "hemtt.exe")

hemttOutPath = os.path.join(projectPath, ".hemttout")
hemttOutDevPath = os.path.join(hemttOutPath, "dev")
hemttOutDevAddonsPath = os.path.join(hemttOutDevPath, "addons")

hemttOutInternalPath = os.path.join(hemttOutPath, "dev_internal")
hemttOutInternalAddonsPath = os.path.join(hemttOutInternalPath, "addons")

internalFilesPath = os.path.join(projectPath, "internal")

vendorPath = os.path.join(projectPath, "vendor")
vendorWorkshopPath = os.path.join(vendorPath, "workshop")
vendorLocalPath = os.path.join(vendorPath, "local")
vendorAddonsPath = os.path.join(vendorPath, "addons")

outsideVendorPath = os.path.join(projectPath, '..', 'a4es__vendor__tmp')
