using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MentorBilling
{
    class GlobalObjects
    {
        /// <summary>
        /// the main Licence structure
        /// </summary>
        public static Settings.Licence licence = new Settings.Licence();
        /// <summary>
        /// the waitMessageDelegate
        /// </summary>
        public static Miscellaneous.MiscellaneousWindows.WaitMessageDelegate waitMessageDelegate 
            = new Miscellaneous.MiscellaneousWindows.WaitMessageDelegate();
    }
}
