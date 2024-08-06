using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Databaselayer;

namespace Businesslogic
{
    public class dbconnection 
    {
       public static string db()
        {
            string connectin = Databaselayer.DbConnection.DBconnec();
            return connectin;
        }
    }
}
