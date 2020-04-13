using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MentorBilling
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            DataContext = new CurrentTimeViewModel();
        }
        private void CallHome(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            System.Diagnostics.Process.Start("http://www.mentorsoft.com");
        }
        public class CurrentTimeViewModel : INotifyPropertyChanged
        {
            private string _currentTime;

            public CurrentTimeViewModel()
            {
                UpdateTime();
            }

            private void UpdateTime()
            {
                Task.Run(() =>
                {
                    CurrentTime = DateTime.Now.ToString("dd.MM.yyyy hh:mm:ss");
                    Task.Delay(1000);
                    UpdateTime();
                });
            }

            public event PropertyChangedEventHandler PropertyChanged;

            protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
            {
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
            }

            public string CurrentTime
            {
                get { return _currentTime; }
                set { _currentTime = value; OnPropertyChanged(); }
            }
        }
    }
}
