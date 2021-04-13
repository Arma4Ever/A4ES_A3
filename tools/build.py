#!/usr/bin/env python3

import os
import sys
import subprocess
import shutil
import datetime

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
    hemttExe = os.path.join(projectpath, "hemtt.exe")
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

    print("========================================================")
    print("")
    print("  Vendor addons:")

    allvendorskiped = True
    for stat in vendorstats:
        if stat[1] > 0 or stat[3] > 0:
            allvendorskiped = False
            print("    {}:".format(stat[0]))
            print("      copied {} addons.".format(stat[1]))
            print("      skipped {} addons.".format(stat[2]))
            print("      copied {} dlls.".format(stat[3]))
            print("      skipped {} dlls.".format(stat[4]))

    if allvendorskiped:
        print("    Skipped all.")

    print("")

    if len(vendormissing):
        print("  Missing vendor mods:")
        for mod in vendormissing:
            print("    {}".format(mod))
        print("")

    ### Rename vendor addons for HEMTT clear

    os.chdir(addonspath)

    for file in vendoraddons:
        os.rename(file, "{}.vendor".format(file[:-4]))

    ### Build A3CS

    os.chdir(projectpath)

    print("  Building A3CS")
    print("")
    hemttRet = subprocess.call([hemttExe, "pack"], stderr=subprocess.STDOUT)
    print("Result: {}".format(hemttRet));

    ### Rename vendor addons

    os.chdir(addonspath)

    for file in vendoraddons:
        os.rename("{}.vendor".format(file[:-4]), file)

    ### Log finish

    print("")
    print("\n# A3CS debug build done\n")
    print("  {}".format(datetime.datetime.now()))
    print("")

if __name__ == "__main__":
    sys.exit(main())
