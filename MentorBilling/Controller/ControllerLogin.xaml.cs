using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace MentorBilling.Controller
{
    /// <summary>
    /// Interaction logic for ControllerLogin.xaml
    /// </summary>
    public partial class ControllerLogin : Window
    {
        public ControllerLogin()
        {
            InitializeComponent();
        }
        #region Close Form
        /// <summary>
        /// this function will be the main close event for the forms cancel button
        /// </summary>
        /// <param name="sender">btnCancel</param>
        /// <param name="e">the Click event</param>
        void CancelForm(object sender, RoutedEventArgs e)
        {
            Miscellaneous.GeneralFunction.CloseProgram();
        }
        /// <summary>
        /// this function will be the main close event for the forms close button
        /// </summary>
        /// <param name="sender">Close Elipse</param>
        /// <param name="e">the MouseUp event</param>
        void CancelForm(object sender, MouseButtonEventArgs e)
        {
            Miscellaneous.GeneralFunction.CloseProgram();
        }
        #endregion
    }
}
