using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace MentorBilling.Settings
{
    static class ControlValues
    {
        public static String GetMacAdress()
        {
            return NetworkInterface.GetAllNetworkInterfaces().Where(n => n.OperationalStatus == OperationalStatus.Up && n.NetworkInterfaceType != NetworkInterfaceType.Loopback)
                .OrderByDescending(n => n.NetworkInterfaceType == NetworkInterfaceType.Ethernet || n.NetworkInterfaceType == NetworkInterfaceType.Wireless80211)
                .Select(n => n.GetPhysicalAddress()).FirstOrDefault().ToString();
        }
        public static readonly String GetProgramCode = "MB01";
        public static readonly String GetControllerConnectionString = "Host = 5.2.228.239; Port = 26662; Database = MentorClientController; User Id = postgres; Password = pgsql";
        public static String GetProgramVersion()
        {
            return Assembly.GetExecutingAssembly().GetName().Version.ToString();
        }
    }
    class GeneralFunctions
    {
        #region Settings static properties
        /// <summary>
        /// the enum for containing all types of settings files
        /// </summary>
        public enum SettingsType
        {
            none = 0,
            DatabaseConnection,
            EncryptionPassword,
            Licence
        }
        /// <summary>
        /// the path towards the settingsFolder
        /// </summary>
        public static String SettingsFolder = Path.GetDirectoryName(Process.GetCurrentProcess().MainModule.FileName) + @"\Settings\";
        /// <summary>
        /// the list of all settings files
        /// </summary>
        public static List<SettingsFile> settingsFiles = new List<SettingsFile>();
        #endregion
        #region Settings Structures
        /// <summary>
        /// the given sturcture for any given setting File
        /// </summary>
        public class SettingsFile
        {
            /// <summary>
            /// the settings file type 
            /// </summary>
            public SettingsType SettingsType { get; set; } = SettingsType.none;
            /// <summary>
            /// the setting file path
            /// </summary>
            public String SettingsPath { get; set; } = String.Empty;
            /// <summary>
            /// the parametrized caller for initialization
            /// </summary>
            /// <param name="settingsType">the settings file type</param>
            /// <param name="settingsPath">the settings file path</param>
            public SettingsFile(SettingsType settingsType, String settingsPath)
            {
                SettingsType = settingsType;
                SettingsPath = SettingsFolder + settingsPath;
            }
        }
        #endregion
        #region Static Functions
        /// <summary>
        /// the initialization function list with the initial entries
        /// </summary>
        public static void InitializeSettingsFiles()
        {
            settingsFiles.Add(new SettingsFile(SettingsType.DatabaseConnection, SettingsFolder + "ConnectionSettings.ini"));
            settingsFiles.Add(new SettingsFile(SettingsType.EncryptionPassword, SettingsFolder + "EncryptionPassword.ini"));
            settingsFiles.Add(new SettingsFile(SettingsType.EncryptionPassword, SettingsFolder + "Licence.ini"));
        }
        /// <summary>
        /// this function will create a settings folder if it doesn't exist
        /// </summary>
        public static void CreateSettingsFolder()
        {
            //We verify the directories existance and if it doesn't we create it.
            if (!Directory.Exists(SettingsFolder))
            {
                DirectoryInfo info = Directory.CreateDirectory(SettingsFolder);
                info.Attributes = FileAttributes.Directory | FileAttributes.Hidden;
            }
            // Otherwise we just make sure that it is hidden
            else
            {
                DirectoryInfo info = new DirectoryInfo(SettingsFolder);

                //See if directory has hidden flag, if not, make hidden
                if ((info.Attributes & FileAttributes.Hidden) != FileAttributes.Hidden)
                {
                    //Add Hidden flag    
                    info.Attributes |= FileAttributes.Hidden;
                }
            }
        }
        /// <summary>
        /// the funtion will return a list containing all the lines in the .ini settings files
        /// </summary>
        /// <param name="settingsType">the settingsType for the retrieving the specific file</param>
        /// <returns>a list containing the lines in the text file</returns>
        public static List<String> ReadSettingsFile(SettingsType settingsType)
        {
            //we initialize a new encryption to decrypt the file
            Miscellaneous.Encryption encryption = new Miscellaneous.Encryption();
            //first we retrieve the file path from the settings file lists
            String filePath = settingsFiles.Where(x => x.SettingsType == settingsType).First().SettingsPath; 
            //then if the file doesn't exist we return an empty list
            if (!File.Exists(filePath)) return new List<String>();
            //the else is not needed as all code falls upon else because the if has a return statement
            return File.ReadAllLines(filePath).ToList().Select(x => encryption.Decrypt(x)).ToList();
        }
        #endregion
    }
}
