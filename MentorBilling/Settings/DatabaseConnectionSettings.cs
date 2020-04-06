using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MentorBilling.Settings
{
    class DatabaseConnectionSettings
    {
        /// <summary>
        /// the host server property
        /// </summary>
        private String host = String.Empty;
        /// <summary>
        /// the port property
        /// </summary>
        private String port = String.Empty;
        /// <summary>
        /// the Database Name property
        /// </summary>
        private String database = String.Empty;
        /// <summary>
        /// the username property
        /// </summary>
        private String userId = String.Empty;
        /// <summary>
        /// the password property
        /// </summary>
        private String password = String.Empty;

        /// <summary>
        /// the getter and setter for the host property
        /// </summary>
        public String Host
        {
            get => host;
            set => host = value;
        }

        /// <summary>
        /// the getter and setter for the port property
        /// </summary>
        public String Port
        {
            get => port;
            set => port = value;
        }

        /// <summary>
        /// the getter and setter for the database property
        /// </summary>
        public String Database
        {
            get => database;
            set => database = value;
        }

        /// <summary>
        /// the getter and setter for the userId property
        /// </summary>
        public String UserID
        {
            get => userId;
            set => userId = value;
        }

        /// <summary>
        /// the getter and setter for the password property
        /// </summary>
        public String Password
        {
            get => password;
            set => password = value;
        }

        //EX: "Host = 5.2.228.239; Port = 26662; Database = DataSynchController; User Id = postgres; Password = pgsql"
        /// <summary>
        /// the caller for returning a valid connection String
        /// </summary>
        public String ConnectionString 
                => "Host = " + host + "; Port = " + port + "; Database = " + database + "; User Id = " + userId + "; Password = " + password;

        /// <summary>
        /// the caller for returning a valid vfp connection String
        /// </summary>
        public String FoxConnectionString
                => "DRIVER={PostgreSQL Unicode};SERVER=" + host + ";PORT=" + port + ";DATABASE=" + database + ";UID=" + userId + ";PWD=" + password;

        /// <summary>
        /// this function will deconstruct a connection string and 
        /// </summary>
        /// <param name="connectionString">the connection string</param>
        public void DeconstructConnectionString(String connectionString)
        {
            foreach (String connectionPropertyString in connectionString.Trim().Split(';'))
            {
                String[] connectionProperty = connectionPropertyString.Trim().Split('=');
                switch (connectionProperty[0].Trim().ToUpper())
                {
                    case "HOST":
                        Host = connectionProperty[1].Trim();
                        break;
                    case "PORT":
                        Port = connectionProperty[1].Trim();
                        break;
                    case "DATABASE":
                        Database = connectionProperty[1].Trim();
                        break;
                    case "USER ID":
                        UserID = connectionProperty[1].Trim();
                        break;
                    case "PASSWORD":
                        Password = connectionProperty[1].Trim();
                        break;
                }
            }
        }

        public void RetriveSettingsFromFile()
        {

        }
    }
}
