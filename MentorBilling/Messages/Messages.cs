using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Media.Imaging;

namespace MentorBilling.Messages
{
    public class MessageSettings
    {
        public static Int32 stringLineHeight = 15;              //setting for line height
        public static String missingFileTitle = String.Empty;   //setting for MissingFile title
        /// <summary>
        /// The MessageFormReturn property will dictate weatehr the message was exited with ok or cancel (true or false)
        /// </summary>
        public static bool messageFormReturn = false;           //setting for the return from window value: Used for 2-value forms
        /// <summary>
        /// this function will Reinitialize the Form Return 
        /// </summary>
        public static void ReinitializeFormUnload()
        {
            messageFormReturn = false;
        }
        /// <summary>
        /// this function will retrieve the number of lines contained by a string
        /// </summary>
        /// <param name="s">the number of lines</param>
        /// <returns></returns>
        public static Int32 RetriveNumberOfLinesOfString(String s)
        {
            return System.Text.RegularExpressions.Regex.Matches(s, System.Environment.NewLine).Count;
        }
    }
    //path to message background Images <= all included in application
    public class MessageImages
    {
        public static String errorImage = @"/ProgramResources/Images/error.jpg";
        public static String warningImage = @"/ProgramResources/Images/warning.jpg";
        public static String infoImage = @"/ProgramResources/Images/info.jpg";
        public static String succesImage = @"/ProgramResources/Images/success.jpg";
    }
    class Messages
    {
        public static void MissingSettingsError()
        {
            //we call the Reinitialization of the unload variable before launching the form.
            MessageSettings.ReinitializeFormUnload();
            MessageForm newMessage = new MessageForm();
            newMessage.msgTitle.Content = "Eroare Lipsa Setari";
            newMessage.msgMessage.Content = "Fisierul de setari lipseste: ";
            //change the background image
            newMessage.msgBackground.ImageSource = new BitmapImage(new Uri(@"pack://Application:,,," + MessageImages.warningImage));
            //deactivate the cancel button
            newMessage.btnCancel.Visibility = Visibility.Collapsed;
            //recenter and set the content of the Accept button
            newMessage.btnAccept.Margin = new Thickness(0, 0, 0, 10);
            newMessage.btnAccept.Content = "Ok";
            //Alters the height of the form as needed
            newMessage.Height = newMessage.Height + MessageSettings.stringLineHeight * MessageSettings.RetriveNumberOfLinesOfString(newMessage.msgMessage.Content.ToString());
            //We need to force focus to this form
            newMessage.Focus();
            //we set the message as Topmost always
            newMessage.Topmost = true;
            //we use showDialog to await user input
            newMessage.ShowDialog();
        }
    }
}
