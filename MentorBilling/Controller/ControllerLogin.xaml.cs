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
        public void LoginMainEvent(object sender, RoutedEventArgs e)
        {
            
        }
        #region Auxilliary Functions
        Boolean CheckUser()
        {
            if (String.IsNullOrEmpty(this.tbUsername.Text))
            {
               
            }
            FunctionLibrary.ControllerFunctions.verifyUser(FunctionLibrary.DatabaseConnection.createConnectionFromUri(GlobalObjects.ServerConnectionString), this.tbUsername.Text, this.pbPassword.Password);
        }
        /// <summary>
        /// this function will display the password to the user for him to check
        /// </summary>
        void ShowPassword()
        {
            //we set the textbox text from the password
            tbPassword.Text = pbPassword.Password;
            //then we reverse the visibility for the objects
            pbPassword.Visibility = Visibility.Collapsed;
            tbPassword.Visibility = Visibility.Visible;
            //then set focus to the textbox
            tbPassword.Focus();
            //disable the password box
            pbPassword.IsEnabled = false;
            //and enable the text box
            tbPassword.IsEnabled = true;
            //the change the uri image
            PasswordButton.Source = Miscellaneous.GeneralFunction.ImageUri.invisible;
        }
        /// <summary>
        /// this function will hide the password for the user
        /// </summary>
        void HidePassword()
        {
            //we set the saved password from the textbox
            pbPassword.Password = tbPassword.Text;
            //then clear the value for the textbox
            tbPassword.ClearValue(TextBox.TextProperty);
            //then we reverse the visibility for the objects
            tbPassword.Visibility = Visibility.Collapsed;
            pbPassword.Visibility = Visibility.Visible;
            //then set focus to the textbox
            pbPassword.Focus();
            //disable the textbox
            tbPassword.IsEnabled = false;
            //then enable the password box
            pbPassword.IsEnabled = true;
            //and change the image uri
            PasswordButton.Source = Miscellaneous.GeneralFunction.ImageUri.visible;
        }
        /// <summary>
        /// this function will reset the displayed message
        /// </summary>
        void ResetMessage()
        {
            this.lblMessage.ClearValue(Label.ContentProperty);
            this.lblMessage.Visibility = Visibility.Collapsed;
        }
        /// <summary>
        /// this function will display a given message
        /// </summary>
        /// <param name="Message">the dispalyed message</param>
        void DisplayMessage(String Message)
        {
            this.lblMessage.Content = Message;
            this.lblMessage.Visibility = Visibility.Visible;
        }
        #endregion
    }
}
