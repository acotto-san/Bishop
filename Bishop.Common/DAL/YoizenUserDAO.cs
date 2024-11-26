using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Yoizen.Social.DomainModel;

namespace Bishop.Common.DAL
{
    public class YoizenUserDAO
    {
        public static User GetQadmin()
        {
            return new User
            {
                ID = 317,
                UserName = "qadmin",
                Password = "asdQWE!23QWE"
            };

        }
        public static User GetSupervisorTest3()
        {
            return new User
            {
                ID = 500,
                UserName = "test3yzn",
                Password = "asdQWE!23QWE"
            };

        }
    }
}
