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
        /// this is the main startup path for the program
        /// </summary>
        public static void Start()
        {
            //first we initialize the settings file for settings access
            Settings.GeneralFunctions.InitializeSettingsFiles();
            //then we will display the Main Window
            DisplayMainWindow();
        }
        /// <summary>
        /// this function will be used to initialize and display the mainWindow
        /// </summary>
        static void DisplayMainWindow()
        {
            //we initialize the main window
            //making a global instance is not necesary because we mai retreive it(if needed) from the ParentHood
            MainWindow mainWindow = new MainWindow();
            //then set the mainWindow as the main screen
            ProgramResources.ParentHood.setMainScreen(mainWindow);
            //display it
            mainWindow.ShowDialog();
            //and set the message
            GlobalObjects.waitMessageDelegate.SetMessage("Va rugam asteptati cat timp" + Environment.NewLine + "se genereaza programul");
        }
    }
    
}
