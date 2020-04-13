using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MentorBilling.Settings
{
    class Licence
    {
        /// <summary>
        /// the main userId property
        /// </summary>
        private Int32 userID =  new Int32();
        /// <summary>
        /// the macAdress property
        /// </summary>
        private String macAdress = String.Empty;
        /// <summary>
        /// the licenceUpdated property
        /// </summary>
        private DateTime licenceUpdated = new DateTime();
        /// <summary>
        /// the licencePeriod property
        /// </summary>
        private Int32 licencePeriod = new Int32();

        /// <summary>
        /// the getter and setter for the userID
        /// </summary>
        public Int32 UserID
        {
            get => userID;
            set => userID = value;
        }

        /// <summary>
        /// the getter and setter for the macAdress
        /// </summary>
        public String MacAdress
        {
            get => macAdress;
            set => macAdress = value;
        }

        /// <summary>
        /// the getter and setter for the licenceUpdated
        /// </summary>
        public DateTime LicenceUpdated
        {
            get => licenceUpdated;
            set => licenceUpdated = value;
        }

        /// <summary>
        /// the getter and setter for thelicencePeriod
        /// </summary>
        public Int32 LicencePeriod
        {
            get => licencePeriod;
            set => licencePeriod = value;
        }

        /// <summary>
        /// this function is used to retrieve a complete list of 
        /// </summary>
        public void RetrieveLicenceFromFile()
        {
            List<String> settings = GeneralFunctions.ReadSettingsFile(GeneralFunctions.SettingsType.Licence);
            if(settings.Count < 1)
            {
                Messages.Messages.MissingSettingsError("Licenta");
                CheckUserLicence();
            }
            foreach (String setting in settings) SetSetting(setting);
        }
        /// <summary>
        /// this function will be the setter for each setting String
        /// </summary>
        /// <param name="settingString">the given setting string</param>
        public void SetSetting(String settingString)
        {
            switch (settingString.Split('=')[0].Trim().ToUpper())
            {
                case "USER ID":
                    UserID = Convert.ToInt32(settingString.Split('=')[1].Trim().ToUpper());
                    break;
                case "MAC ADRESS":
                    MacAdress = settingString.Split('=')[1].Trim().ToUpper();
                    break;
                case "LICENCE UPDATED":
                    LicenceUpdated = Convert.ToDateTime(settingString.Split('=')[1].Trim().ToUpper());
                    break;
                case "LICENCE PERIOD":
                    LicencePeriod = Convert.ToInt32(settingString.Split('=')[1].Trim().ToUpper());
                    break;
            }
        }
        public void CheckLicenceUpdate()
        {

        }
        public void CheckUserLicence()
        {
            #warning TBD:
        }
    }
}
