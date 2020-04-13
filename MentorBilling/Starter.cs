using MentorBilling.Settings;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MentorBilling
{
    
    class Starter
    {
        /// <summary>
        /// the main Licence structure
        /// </summary>
        public static Licence licence = new Licence();
        /// <summary>
        /// this is the main startup path for the program
        /// </summary>
        public static void Start()
        {
            //first we initialize the settings file for settings access
            Settings.GeneralFunctions.InitializeSettingsFiles();
        }

    }
    
}
