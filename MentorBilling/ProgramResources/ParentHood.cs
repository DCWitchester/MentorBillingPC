using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace MentorBilling.ProgramResources
{
    class ParentHood
    {
        /// <summary>
        /// the main root window used for recal on logout
        /// </summary>
        private static Window RootWindow;
        /// <summary>
        /// the mainScreen used for window ownership
        /// </summary>
        private static Window MainScreen;

        /// <summary>
        /// the complete list of active parenthoods within the program 
        /// </summary>
        public static List<ParentHoodStructure> parentHoods = new List<ParentHoodStructure>();

        /// <summary>
        /// this function will set the main Screen for the main screen for the parent
        /// </summary>
        /// <param name="window">chosen mainScreen</param>
        public static void setMainScreen(Window window) => MainScreen = window;
        /// <summary>
        /// this function will set the rootWindow
        /// </summary>
        /// <param name="window">chosen root</param>
        public static void setRootWindow(Window window) => RootWindow = window;

        /// <summary>
        /// the ParentHood Structure that will contain each window and its parent
        /// </summary>
        public class ParentHoodStructure
        {
            /// <summary>
            /// the Parent windows
            /// </summary>
            public Window parent { get; set; } = new Window();
            /// <summary>
            /// the currentWindow
            /// </summary>
            public Window window { get; set; } = new Window();
            /// <summary>
            /// the main ParentHoodStructure Caller
            /// </summary>
            /// <param name="parent">the parent window</param>
            /// <param name="window">the current window</param>
            public ParentHoodStructure(Window parent, Window window)
            {
                this.parent = parent;
                this.window = window;
            }
        }
        /// <summary>
        /// whis function will create and add a new parentHoodStructure to the list
        /// </summary>
        /// <param name="parent">the parent window</param>
        /// <param name="window">the ne</param>
        public static void addParentHood(Window parent, Window window)
        {
            SetChildOwner(window);
            ParentHoodStructure parenthood = new ParentHoodStructure(parent, window);
            parentHoods.Add(parenthood);
            showChild(parenthood);
        }
        /// <summary>
        /// this function will close all parents and return to the root
        /// </summary>
        /// <param name="parentHoods">the complete list of parenthoods</param>
        public static void ReturnToRoot()
        {
            if (parentHoods.Count < 1) DisplayRoot();
            ParentHoodStructure currentParentHood = parentHoods.Last();
            while (currentParentHood.window != RootWindow)
            {
                killParent(currentParentHood);
                if (parentHoods.Count < 1) break;
                currentParentHood = parentHoods.Last();
            }
            DisplayRoot();
        }
        /// <summary>
        /// the main function used for returning a windows focus to its parent
        /// </summary>
        /// <param name="parentHood"></param>
        public static void returnFocusToParent(ParentHoodStructure parentHood)
        {
            parentHood.parent.Visibility = Visibility.Visible;
            parentHood.parent.Focus();
            parentHood.window.Close();
            removeParentHood(parentHood);
        }
        #region Miscelleneous functions
        /// <summary>
        /// this function will kill the parent element of a parenthood without giving focus to the parent
        /// </summary>
        /// <param name="parentHood">the current parenthood</param>
        static void killParent(ParentHoodStructure parentHood)
        {
            parentHood.window.Close();
            removeParentHood(parentHood);
        }
        /// <summary>
        /// this function will give active focus to the root window
        /// </summary>
        static void DisplayRoot()
        {
            RootWindow.Visibility = Visibility.Visible;
            RootWindow.Focus();
        }
        /// <summary>
        /// this function will remove a parentHoodStructure item form the list
        /// </summary>
        /// <param name="parentHood">the current structure</param>
        static void removeParentHood(ParentHoodStructure parentHood)
        {
            parentHoods.Remove(parentHood);
        }
        /// <summary>
        /// this function will set the child owner to the parent
        /// </summary>
        /// <param name="parent">the parent form</param>
        /// <param name="child">the child form</param>
        static void SetChildOwner(Window child)
        {
            child.Owner = MainScreen;
        }
        /// <summary>
        /// this function will show the child of the curent parentHoodStructure
        /// </summary>
        /// <param name="parentHood">the current ParenHoodStructure</param>
        static void showChild(ParentHoodStructure parentHood)
        {
            parentHood.parent.Visibility = Visibility.Collapsed;
            parentHood.window.ShowDialog();
        }
        #endregion
    }
}
