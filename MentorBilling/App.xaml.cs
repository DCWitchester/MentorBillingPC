using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace MentorBilling
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        void ProgramStartup(object sender, StartupEventArgs e)
        {
            SetCultureInfo();
        }
        /// <summary>
        /// this function will set the CultureInfo to en-IN so that windows CultureInfo will not affect the program
        /// </summary>
        void SetCultureInfo()
        {
            CultureInfo.CurrentCulture = new CultureInfo("en-IN");
            CultureInfo.CurrentUICulture = new CultureInfo("en-IN");
        }
    }
}
