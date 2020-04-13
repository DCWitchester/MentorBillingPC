using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
    }
}
