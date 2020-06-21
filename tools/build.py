#!/usr/bin/env python3

import os
import sys
import subprocess
import shutil

######## GLOBALS #########
from vendor import VENDOR
MAINPREFIX = "z"
PREFIX = "a3cs_"
IGNOREADDONS = [
    "camofaces",
]
##########################

vendoraddons = []

def mod_time(path):
    if not os.path.isdir(path):
        return os.path.getmtime(path)
    maxi = os.path.getmtime(path)
    for p in os.listdir(path):
        maxi = max(mod_time(os.path.join(path, p)), maxi)
    return maxi

def check_for_changes(addonspath, module):
    if not os.path.exists(os.path.join(addonspath, "{}{}.pbo".format(PREFIX,module))):
        return True
    return mod_time(os.path.join(addonspath, module)) > mod_time(os.path.join(addonspath, "{}{}.pbo".format(PREFIX,module)))

def check_for_obsolete_pbos(addonspath, file):
    if file in vendoraddons:
        return False
    module = file[len(PREFIX):-4]
    if not os.path.exists(os.path.join(addonspath, module)):
        return True
    return False

def copy_vendor_file(source, target):
    file = os.path.basename(source)
    filepath = os.path.join(target, file)

    if os.path.exists(filepath):
        if (mod_time(source) <= mod_time(filepath)):
            return False
        os.remove(filepath)

    shutil.copy2(source, target)

    return True

def main():
    print("""
  ####################
  # A3CS Debug Build #
  ####################
""")

    scriptpath = os.path.realpath(__file__)
    projectpath = os.path.dirname(os.path.dirname(scriptpath))
    addonspath = os.path.join(projectpath, "addons")
    vendorpath = os.path.join(projectpath, "vendor")
    vendorstats = []
    vendormissing = []

    ### Copy vendor addons

    os.chdir(vendorpath)

    for dir in VENDOR.keys():
        vendorroot = os.path.join(vendorpath, dir)
        if not os.path.isdir(vendorroot):
            vendormissing.append(dir)
            print("# Vendor mod {} not found\n".format(dir))
            continue

        copieddlls = 0
        skippedlls = 0
        copied = 0
        skipped = 0

        print("  {}\n".format(dir))

        # Copy dlls
        for file in os.listdir(vendorroot):
            filepath = os.path.join(vendorroot, file)
            if not os.path.isfile(filepath):
                continue
            if file[-3:] != "dll":
                continue

            if copy_vendor_file(filepath, projectpath):
                copieddlls += 1
                print("# Copying {}.".format(file))
            else:
                skippedlls += 1
                print("  Skipping {}.".format(file))

        # Copy pbo's
        vendorconfig = VENDOR[dir]
        vendoraddonspath = os.path.join(vendorroot, "addons")
        for file in os.listdir(vendoraddonspath):
            filepath = os.path.join(vendoraddonspath, file)
            if not os.path.isfile(filepath):
                continue
            if file[-3:] != "pbo":
                continue

            addon = file[:-4]
            if "blacklist" in vendorconfig:
                if addon in vendorconfig["blacklist"]:
                    skipped += 1
                    print("  Skipping {}.".format(file))
                    continue

            if "whitelist" in vendorconfig:
                if addon not in vendorconfig["whitelist"]:
                    skipped += 1
                    print("  Skipping {}.".format(file))
                    continue

            vendoraddons.append(file)

            if copy_vendor_file(filepath, addonspath):
                copied += 1

                print("# Copying {}.".format(file))
            else:
                skipped += 1
                print("  Skipping {}.".format(file))

        print("")

        if "optionals" in vendorconfig:
            for file in vendorconfig["optionals"]:
                filepath = os.path.join(vendorroot, "optionals", file)
                filename = os.path.basename(file)
                if not os.path.isfile(filepath):
                    continue

                vendoraddons.append(filename)

                if copy_vendor_file(filepath, addonspath):
                    copied += 1

                    print("# Copying {}.".format(filename))
                else:
                    skipped += 1
                    print("  Skipping {}.".format(filename))
            print("")
        vendorstats.append((dir[1:], copied, skipped, copieddlls, skippedlls))

    ### Build A3CS

    print("  Building A3CS")

    os.chdir(addonspath)

    made = 0
    failed = 0
    skipped = 0
    removed = 0

    for file in os.listdir(addonspath):
        if os.path.isfile(file):
            if check_for_obsolete_pbos(addonspath, file):
                removed += 1
                print("  Removing {}.".format(file))
                os.remove(file)
    print("")

    for p in os.listdir(addonspath):
        path = os.path.join(addonspath, p)
        if not os.path.isdir(path):
            continue
        if p[0] == ".":
            continue
        if p in IGNOREADDONS or not check_for_changes(addonspath, p):
            skipped += 1
            print("  Skipping {}.".format(p))
            continue

        print("# Making {} ...".format(p))

        try:
            subprocess.check_output([
                "makepbo",
                "-NUP",
                "-@={}\\{}\\addons\\{}".format(MAINPREFIX,PREFIX.rstrip("_"),p),
                p,
                "{}{}.pbo".format(PREFIX,p)
            ], stderr=subprocess.STDOUT)
        except:
            failed += 1
            print("  Failed to make {}.".format(p))
        else:
            made += 1
            print("  Successfully made {}.".format(p))

    print("\n# A3CS debug build done\n")
    print("  Vendos:")

    for stat in vendorstats:
        if stat[1] > 0 or stat[3] > 0:
            print("    {}:".format(stat[0]))
            print("      copied {} addons.".format(stat[1]))
            print("      skipped {} addons.".format(stat[2]))
            print("      copied {} dlls.".format(stat[3]))
            print("      skipped {} dlls.".format(stat[4]))
        else:
            print("    {}:".format(stat[0]))
            print("      skipped all.")

    print("")

    if len(vendormissing):
        print("  Missing vendor mods:")
        for mod in vendormissing:
            print("    {}".format(mod))
        print("")

    print("  A3CS build:")
    print("  Made {}, skipped {}, removed {}, failed to make {}.".format(made, skipped, removed, failed))
    print("")

if __name__ == "__main__":
    sys.exit(main())
