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

namespace a4es_common
{
    public class A4ESCommonExtension
    {
        private static readonly string EXT_KEY = "";
        private static readonly string DEVICE_HASH = "";
        private static readonly string API_URL = "";
        private static readonly string API_KEY = "";

        [DllExport("RVExtensionVersion", CallingConvention = CallingConvention.Winapi)]
        public static void RvExtensionVersion(StringBuilder output, int outputSize)
        {
            output.Append("A4ESCommonExtension v1.0.0");
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

            output.Append("null");
            return;
        }

        [DllExport("RVExtensionArgs", CallingConvention = CallingConvention.Winapi)]
        public static int RvExtensionArgs(StringBuilder output, int outputSize,
            [MarshalAs(UnmanagedType.LPStr)] string function,
            [MarshalAs(UnmanagedType.LPArray, ArraySubType = UnmanagedType.LPStr, SizeParamIndex = 4)] string[] args, int argCount)
        {

            if (function == "connectAccessToken" || function == "connectIDToken")
            {
                string key = args[0].Trim('"');
                if (key != EXT_KEY)
                {
                    output.Append("null");
                    return 9;
                }

                Dictionary<string, string> data = new Dictionary<string, string> { };

                data.Add("key", API_KEY);
                data.Add("token", args[1].Trim('"'));
                data.Add("profile", args[2].Trim('"'));
                data.Add("device", A4ESCommonExtension.GetDeviceId());

                FormUrlEncodedContent content = new FormUrlEncodedContent(data);

                HttpClient client = new HttpClient();

                string apiUrl = API_URL + ((function == "connectAccessToken") ? "access" : "id");

                Task<HttpResponseMessage> taskPost = Task.Run(() => client.PostAsync(apiUrl, content));
                taskPost.Wait();
                HttpResponseMessage response = taskPost.Result;

                if (!response.IsSuccessStatusCode)
                {
                    int code = (int) response.StatusCode;
                    output.Append("error");

                    // Only cadre is allowed to enter
                    if (code == 409)
                    {
                        return 3;
                    }

                    // Only selected users are allowed to enter
                    if (code == 410)
                    {
                        return 4;
                    }

                    return 2;
                }

                Task<string> taskRead = Task.Run(() => response.Content.ReadAsStringAsync());
                taskRead.Wait();
                string result = taskRead.Result;

                output.Append(result);
                return 1;
            }

            output.Append("null");
            return 0;
        }

        static string HashString(string text)
        {
            if (String.IsNullOrEmpty(text))
            {
                return String.Empty;
            }

            using (var sha = new System.Security.Cryptography.SHA256Managed())
            {
                byte[] textBytes = Encoding.UTF8.GetBytes(text + DEVICE_HASH);
                byte[] hashBytes = sha.ComputeHash(textBytes);

                string hash = BitConverter
                    .ToString(hashBytes)
                    .Replace("-", String.Empty);

                return hash;
            }
        }

        public static string GetDeviceId()
        {
            string input = Environment.MachineName;
            input += Environment.UserName;
            input += Environment.UserDomainName;
            input += A4ESCommonExtension.GetDefaultMacAddress();

            return A4ESCommonExtension.HashString(input);
        }

        public static string GetDefaultMacAddress()
        {
            Dictionary<string, long> macAddresses = new Dictionary<string, long>();

            foreach (NetworkInterface nic in NetworkInterface.GetAllNetworkInterfaces())
            {
                if (nic.OperationalStatus == OperationalStatus.Up)
                    macAddresses[nic.GetPhysicalAddress().ToString()] = nic.GetIPStatistics().BytesSent + nic.GetIPStatistics().BytesReceived;
            }

            long maxValue = 0;
            string mac = "";

            foreach (KeyValuePair<string, long> pair in macAddresses)
            {
                if (pair.Value > maxValue)
                {
                    mac = pair.Key;
                    maxValue = pair.Value;
                }
            }

            return mac;
        }
    }
}
