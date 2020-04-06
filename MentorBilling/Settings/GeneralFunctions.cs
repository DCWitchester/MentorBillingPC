using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MentorBilling.Settings
{
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
            EncryptionPassword
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
            settingsFiles.Add(new SettingsFile(SettingsType.DatabaseConnection, "ConnectionSettings"));
            settingsFiles.Add(new SettingsFile(SettingsType.EncryptionPassword, "EncryptionPassword"));
        }
        /// <summary>
        /// this function will create a settings folder if it doesn't exist
        /// </summary>
        public void CreateSettingsFolder()
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
        #endregion
    }
}
