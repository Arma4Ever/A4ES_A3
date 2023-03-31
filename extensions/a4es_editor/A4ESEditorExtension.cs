using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.Threading;
using System.Threading.Tasks;
using System.IO;
using RGiesecke.DllExport;
using System.Net.Http;
using System.Net.NetworkInformation;
using System.Net;

namespace a4es_editor
{
    public class A4ESEditorExtension
    {
        public static string MISSION_PATH = "";
        public static string SIMPLE_OBJECTS_FILE_NAME = "_objects_data.sqf";
        public static string SIMPLE_OBJECTS_LOG_FILE_NAME = "_objects_data.log";
        public static string MISSION_SUMMARY_FILE_NAME = "mission_summary.txt";
        public static List<string> SIMPLE_OBJECTS_LIST = new List<string>();
        public static List<List<string>> SIMPLE_OBJECTS_MODULES_LIST = new List<List<string>>();

        [DllExport("RVExtensionVersion", CallingConvention = CallingConvention.Winapi)]
        public static void RvExtensionVersion(StringBuilder output, int outputSize)
        {
            output.Append("A4ESEditorExtension v1.0.1");
            return;
        }

        [DllExport("RVExtension", CallingConvention = CallingConvention.Winapi)]
        public static void RvExtension(StringBuilder output, int outputSize,
            [MarshalAs(UnmanagedType.LPStr)] string function)
        {
            if (function == "test")
            {
                output.Append("true");
                return;
            }

            if (function == "getMissionDirSize")
            {
                if (MISSION_PATH == "")
                {
                    output.Append("-1");
                    return;
                }

                try
                {
                    long size = GetDirectorySize(new DirectoryInfo(MISSION_PATH));
                    output.Append(size.ToString());
                    return;
                }
                catch (Exception e)
                {
                    File.WriteAllText("a4es_editor_x64_error.log", e.ToString());
                    output.Append("");
                    return;
                }
            }

            if (function == "getMissionFileSize")
            {
                if (MISSION_PATH == "")
                {
                    output.Append("-1");
                    return;
                }

                try
                {
                    
                    FileInfo missionFile = new FileInfo(MISSION_PATH + "mission.sqm");
                    if (!missionFile.Exists)
                    {
                        output.Append("-1");
                        return;
                    }

                    output.Append(missionFile.Length.ToString());
                    return;
                }
                catch (Exception e)
                {
                    File.WriteAllText("a4es_editor_x64_error.log", e.ToString());
                    output.Append("");
                    return;
                }
            }

            if (function == "getMissionPath")
            {
                output.Append(MISSION_PATH);
                return;
            }

            if (function == "getSimpleObjectsFilePath")
            {
                output.Append(MISSION_PATH + SIMPLE_OBJECTS_FILE_NAME);
                return;
            }

            output.Append("null");
            return;
        }

        [DllExport("RVExtensionArgs", CallingConvention = CallingConvention.Winapi)]
        public static int RvExtensionArgs(StringBuilder output, int outputSize,
            [MarshalAs(UnmanagedType.LPStr)] string function,
            [MarshalAs(UnmanagedType.LPArray, ArraySubType = UnmanagedType.LPStr, SizeParamIndex = 4)] string[] args, int argCount)
        {
            if (function == "setMissionPath")
            {
                MISSION_PATH = args[0].Trim('"').Replace(@"\", @"\\");

                output.Append("true");
                return 0;
            }

            if (function == "newSimpleObjectsFile")
            {
                SIMPLE_OBJECTS_LIST = new List<string>();
                SIMPLE_OBJECTS_MODULES_LIST = new List<List<string>>();

                output.Append("true");
                return 0;
            }

            if (function == "addSimpleObject")
            {
                SIMPLE_OBJECTS_LIST.Add(args[0].Trim('"'));

                output.Append("true");
                return 0;
            }

            if (function == "saveSimpleObjectsModule")
            {
                SIMPLE_OBJECTS_LIST.Add(args[0].Trim('"'));
                SIMPLE_OBJECTS_MODULES_LIST.Add(SIMPLE_OBJECTS_LIST);
                SIMPLE_OBJECTS_LIST = new List<string>();

                output.Append("true");
                return 0;
            }


            if (function == "saveSimpleObjectsFile")
            {
                if (MISSION_PATH == "")
                {
                    output.Append("false");
                    return 1;
                }

                string fileText = "";
                int objectsCount = 0;

                try
                {
                    File.WriteAllText(MISSION_PATH + SIMPLE_OBJECTS_LOG_FILE_NAME, String.Format("Saved modules: {0}", SIMPLE_OBJECTS_MODULES_LIST.Count()) + Environment.NewLine);
                    File.AppendAllText(MISSION_PATH + SIMPLE_OBJECTS_LOG_FILE_NAME, "==========" + Environment.NewLine);
                }
                catch (Exception e)
                {
                    File.WriteAllText("a4es_editor_x64_error.log", e.ToString());
                    output.Append("false");
                    return 3;
                }

                if (SIMPLE_OBJECTS_MODULES_LIST.Count() > 0)
                {
                    SIMPLE_OBJECTS_MODULES_LIST.ForEach(delegate (List<string> objectsList)
                    {
                        if (objectsList.Count() > 1)
                        {
                            string moduleText = "[[";
                            string postInit = objectsList.Last();
                            objectsList.RemoveAt(objectsList.Count - 1);

                            int moduleObjectsCount = objectsList.Count();
                            objectsCount += moduleObjectsCount;

                            try
                            {
                                File.WriteAllText(MISSION_PATH + SIMPLE_OBJECTS_FILE_NAME, "\"[" + fileText + "]\"");
                                File.AppendAllText(MISSION_PATH + SIMPLE_OBJECTS_LOG_FILE_NAME, String.Format("Module saved objects: {0}", moduleObjectsCount) + Environment.NewLine);
                                File.AppendAllText(MISSION_PATH + SIMPLE_OBJECTS_LOG_FILE_NAME, String.Format("Module post init: {0}", postInit) + Environment.NewLine);
                                File.AppendAllText(MISSION_PATH + SIMPLE_OBJECTS_LOG_FILE_NAME, "----------" + Environment.NewLine);
                            }
                            catch (Exception e)
                            {
                                File.WriteAllText("a4es_editor_x64_error.log", e.ToString());
                                output.Append("false");
                            }

                            objectsList.ForEach(delegate (string simpleObject) {
                                moduleText += simpleObject;
                                moduleText += (",");
                            });

                            // Remove last comma
                            moduleText = moduleText.Remove(moduleText.Length - 1);

                            moduleText += ("],\"" + postInit + "\"],");
                            fileText += moduleText;
                        }
                    });
                }

                // Clear memory
                SIMPLE_OBJECTS_LIST = new List<string>();
                SIMPLE_OBJECTS_MODULES_LIST = new List<List<string>>();

                // Remove last comma
                if (fileText != "")
                {
                    fileText = fileText.Remove(fileText.Length - 1);
                }
                
                try
                {
                    File.WriteAllText(MISSION_PATH + SIMPLE_OBJECTS_FILE_NAME, "[" + fileText + "]");
                    File.AppendAllText(MISSION_PATH + SIMPLE_OBJECTS_LOG_FILE_NAME, String.Format("Saved objects: {0}", objectsCount));
                }
                catch (Exception e)
                {
                    File.WriteAllText("a4es_editor_x64_error.log", e.ToString());
                    output.Append("false");
                    return 3;
                }

                output.Append("true");
                return 0;
            }

            output.Append("null");
            return 2;
        }

        public static long GetDirectorySize(DirectoryInfo dir)
        {
            long size = 0;

            // Add file sizes.
            FileInfo[] files = dir.GetFiles();
            foreach (FileInfo file in files)
            {
                size += file.Length;
            }

            // Add subdirectory sizes.
            DirectoryInfo[] subDirs = dir.GetDirectories();
            foreach (DirectoryInfo subDir in subDirs)
            {
                size += GetDirectorySize(subDir);
            }

            return size;
        }
    }
}
