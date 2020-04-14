using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Threading;

namespace MentorBilling.Miscellaneous.MiscellaneousWindows
{
    class WaitMessageDelegate
    {
        /// <summary>
        /// the thread in which the waitMessage window  will be displayed
        /// </summary>
        public Thread messageWindowThread;
        /// <summary>
        /// we also initialize the waitMessage in this form
        /// </summary>
        public WaitMessage waitWindow = new WaitMessage();
        /// <summary>
        /// the main window handler that starts the current thread
        /// </summary>
        public void WindowHandler()
        {
            messageWindowThread = new Thread(new ThreadStart(() => ThreadStartingPoint()));
            messageWindowThread.SetApartmentState(ApartmentState.STA);
            messageWindowThread.Start();
        }
        /// <summary>
        /// the starting point of the thread that hides the window before displaying it
        /// </summary>
        public void ThreadStartingPoint()
        {
            waitWindow = new WaitMessage();
            waitWindow.Visibility = System.Windows.Visibility.Collapsed;
            waitWindow.lblMessage.Content = String.Empty;
            waitWindow.ShowDialog();
            Dispatcher.Run();
        }
        /// <summary>
        /// the HideWindow Invoker
        /// as the window is in another thread we need to dispatch the action
        /// </summary>
        public void HideWindow()
        {
            waitWindow.Dispatcher.Invoke(() => waitWindow.HideWindow());
        }
        /// <summary>
        /// the ShowWindow Invoker
        /// as the window is in another thread we need to dispatch the action
        /// </summary>
        public void ShowWindow()
        {
            waitWindow.Dispatcher.Invoke(() => waitWindow.ShowWindow());
            SetFocus();
        }
        /// <summary>
        /// the SetMessage Invoker
        /// as the window is in another thread we need to dispatch the action
        /// </summary>
        /// <param name="message">the invoked message</param>
        public void SetMessage(String message)
        {
            waitWindow.Dispatcher.Invoke(() => waitWindow.SetLabel(message));
        }
        /// <summary>
        /// the SetFocus Invoker
        /// as the window is in another thread we need to dispatch the action
        /// </summary>
        public void SetFocus()
        {
            waitWindow.Dispatcher.Invoke(() => waitWindow.Focus());
        }

        /// <summary>
        /// the thread closing event
        /// </summary>
        public void CloseThread()
        {
            //if there is a displayed message we will wait till it disapears
            while (!waitWindow.messageShown) { }
            //then if we can access the window we close it
            if (waitWindow.Dispatcher.CheckAccess())
                waitWindow.Close();
            else
                //else we will invoke a close thread that will await and force the garbage collection
                waitWindow.Dispatcher.Invoke(DispatcherPriority.Normal, new ThreadStart(waitWindow.Close));

            //closing the form is not enought so now that the thread is empty we close it
            messageWindowThread.Abort();

        }
        /// <summary>
        /// the SetAlwaysOnTop Invoker
        /// as the window is in another thread we need to dispatch the action
        /// </summary>
        /// <param name="alwaysOnTop">topmost or not</param>
        public void SetAlwaysOnTop(Boolean alwaysOnTop = true)
        {
            waitWindow.Dispatcher.Invoke(() => waitWindow.SetAlwaysOnTop(alwaysOnTop));
        }
    }
}
