import os
import subprocess
import shutil
import datetime
import common

def mod_time(path):
    if not os.path.isdir(path):
        return os.path.getmtime(path)
    maxi = os.path.getmtime(path)
    for p in os.listdir(path):
        maxi = max(mod_time(os.path.join(path, p)), maxi)
    return maxi

def copy_file(source, target):
    if os.path.exists(target):
        os.remove(target)

    shutil.copy2(source, target)

def copy_new_file(source, target):
    if os.path.exists(target):
        if (mod_time(source) <= mod_time(target)):
            return False
        os.remove(target)

    shutil.copy2(source, target)
    return True

def copy_dll_files(source, target):
    copieddlls = 0

    for file in os.listdir(source):
        filepath = os.path.join(source, file)

        if not os.path.isfile(filepath):
            continue
        if file[-3:] != "dll":
            continue

        copy_file(filepath, os.path.join(target, file))
        copieddlls += 1
        #print("# Copying {}.".format(file))

    return copieddlls

def copy_pbo_files(rootPath, targetPath, modConfig):
    addonsPath = os.path.join(rootPath, "addons")
    copied = 0
    skipped = 0

    for file in os.listdir(addonsPath):
        filepath = os.path.join(addonsPath, file)
        filename = os.path.basename(file)

        if not os.path.isfile(filepath):
            continue
        if file[-3:] != "pbo":
            continue

        addon = file[:-4]

        if "blacklist" in modConfig:
            if addon in modConfig["blacklist"]:
                skipped += 1
                #print("  Skipping {}.".format(file))
                continue

        if "whitelist" in modConfig:
            if addon not in modConfig["whitelist"]:
                skipped += 1
                #print("  Skipping {}.".format(file))
                continue

        if copy_new_file(filepath, os.path.join(common.vendorAddonsPath, file)):
            copied += 1
            print("  # Updating {}.".format(file))
        else:
            skipped += 1
            #print("  Skipping {}.".format(file))

        copy_file(filepath, os.path.join(targetPath, file))

    if "optionals" in modConfig:
        for file in modConfig["optionals"]:
            filepath = os.path.join(rootPath, "optionals", file)
            filename = os.path.basename(file)

            if not os.path.isfile(filepath):
                continue

            if copy_new_file(filepath, os.path.join(common.vendorAddonsPath, filename)):
                copied += 1
                print("  # Updating {}.".format(filename))
            else:
                skipped += 1
                #print("  Skipping {}.".format(filename))

            copy_file(filepath, os.path.join(targetPath, filename))

    return [copied, skipped]


def build_mod(buildMode):
    print("  ########################################")
    print("  ### A4ES {} Build".format(buildMode.capitalize()))
    print("  ########################################")
    print("")
    
    os.chdir(common.projectPath)

    # Move vendor outside of project dir for HEMTT
    shutil.move(common.vendorPath, common.outsideVendorPath)

    print("  Building A4ES files ({})".format(buildMode))
    print("")

    result = subprocess.call([common.hemttExePath, buildMode], stderr=subprocess.STDOUT)

    # Move vendor back inside
    shutil.move(common.outsideVendorPath, common.vendorPath)

    if result != 0:
        print("  Building A4ES files failed, aborting...")
        return False

    print("")
    # Prep internal paths
    
    hemttOutPath = os.path.join(common.hemttOutPath, buildMode)
    hemttOutAddonsPath = os.path.join(hemttOutPath, "addons")
    hemttOutInternalPath = os.path.join(common.hemttOutPath, "{}_internal".format(buildMode))
    hemttOutInternalAddonsPath = os.path.join(hemttOutInternalPath, "addons")

    if os.path.exists(hemttOutInternalPath):
        shutil.rmtree(hemttOutInternalPath)

    # Prepare internal mod structure
    print("  Preparing internal mod")
    print("")
    os.makedirs(hemttOutInternalPath)
    os.makedirs(hemttOutInternalAddonsPath)

    # Copy internal static files
    for file in os.listdir(common.internalFilesPath):
        print("  Copying {} to internal mod".format(file))
        shutil.copy2(os.path.join(common.internalFilesPath, file), os.path.join(hemttOutInternalPath, file))

    # Copy internal addons
    for internalAddon in common.internalAddons:
        fileName = "{}_{}".format(common.modPboPrefix, internalAddon)
        filePath = os.path.join(hemttOutAddonsPath, fileName)
        pboName = fileName + ".pbo"
        pboPath = os.path.join(hemttOutAddonsPath, pboName)

        if os.path.exists(pboPath):
            print("  Moving {} to internal addons".format(pboName))
            shutil.move(pboPath, os.path.join(hemttOutInternalAddonsPath, pboName))

            if os.path.exists(filePath):
                shutil.move(filePath, os.path.join(hemttOutInternalAddonsPath, fileName))

    print("")
    # Copy vendor addons
    print("  Loading vendor mods")
    print("")

    vendorModsStats = []
    vendorModsMissing = []            
    os.chdir(common.vendorWorkshopPath)

    for modKey in common.vendorModsList.keys():
        modConfig = common.vendorModsList[modKey]
        modLocalRootPath = os.path.join(common.vendorLocalPath, modKey)
        modRootPath = modLocalRootPath if os.path.isdir(modLocalRootPath) else os.path.join(common.vendorWorkshopPath, modKey)
        isBaseMod = "baseMod" in modConfig and modConfig['baseMod'] is True

        if not os.path.isdir(modRootPath):
            vendorModsMissing.append(modKey)
            print("  ### Vendor mod {} not found\n".format(modKey))
            continue

        print("{} {} from {}".format("Base" if isBaseMod else "Internal", modKey, "local build" if modLocalRootPath == modRootPath else "workshop"))

        # Copy dll's
        copiedDlls = copy_dll_files(modRootPath, hemttOutPath if isBaseMod else hemttOutInternalPath)

        # Copy pbo's
        copyData = copy_pbo_files(modRootPath, hemttOutAddonsPath if isBaseMod else hemttOutInternalAddonsPath, modConfig)
        copiedPbos = copyData[0]
        skippedPbos = copyData[1]

        vendorModsStats.append((modKey[1:], copiedPbos, skippedPbos, copiedDlls))

    print("")
    print("========================================================")
    print("")
    print("  Vendor addons:")

    allvendorskiped = True
    for stat in vendorModsStats:
        if stat[1] > 0:
            allvendorskiped = False
            print("    {}:".format(stat[0]))
            print("      copied {} addons.".format(stat[1]))
            print("      skipped {} addons.".format(stat[2]))
            print("      copied {} dlls.".format(stat[3]))

    if allvendorskiped:
        print("    No pbo updates. All Dlls copied if present.")

    print("")

    if len(vendorModsMissing):
        print("  Missing vendor mods:")
        for mod in vendorModsMissing:
            print("    {}".format(mod))
        print("")

    # Log finish

    print("")
    print("  # A4ES {} build done\n".format(buildMode))
    print("  {}".format(datetime.datetime.now()))
    print("")

    return True