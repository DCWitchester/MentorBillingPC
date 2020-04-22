using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media.Imaging;

namespace MentorBilling.Miscellaneous
{
    class GeneralFunction
    {
        /// <summary>
        /// this function will close the current program
        /// </summary>
        public static void CloseProgram()
        {
            System.Diagnostics.Process.GetCurrentProcess().Kill();
        }
        /// <summary>
        /// the image sources for the visible and invisible buttons
        /// </summary>
        public static class ImageUri
        {
            public static BitmapImage visible = new BitmapImage(new Uri(@"pack://Application:,,,/" + @"ProgramResources\Images\PassVisible.jpg"));
            public static BitmapImage invisible = new BitmapImage(new Uri(@"pack://Application:,,,/" + @"ProgramResources\Images\PassVisible.jpg"));
        }
    }
}
