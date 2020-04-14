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

namespace MentorBilling.Miscellaneous.MiscellaneousWindows
{
    /// <summary>
    /// Interaction logic for WaitMessage.xaml
    /// </summary>
    public partial class WaitMessage : Window
    {
        /// <summary>
        /// the initialization of a shown message
        /// </summary>
        public Boolean messageShown = false;
        public WaitMessage()
        {
            InitializeComponent();
            messageShown = true;
            Visibility = Visibility.Collapsed;
        }
        /// <summary>
        /// this function is used to hide the waitMessage
        /// </summary>
        public void HideWindow()
        {
            Visibility = Visibility.Collapsed;
        }
        /// <summary>
        /// this function is used to show the waitMessage
        /// </summary>
        public void ShowWindow()
        {
            Visibility = Visibility.Visible;
        }
        /// <summary>
        /// this function is used to show a given message within the form
        /// </summary>
        /// <param name="message">any given message</param>
        public void SetLabel(String message)
        {
            lblMessage.Content = message;
        }
        /// <summary>
        /// this function will set the topmost property of the form
        /// </summary>
        /// <param name="alwaysOnTop">if it is topmost or nor</param>
        public void SetAlwaysOnTop(Boolean alwaysOnTop)
        {
            Topmost = alwaysOnTop;
        }
    }
}
