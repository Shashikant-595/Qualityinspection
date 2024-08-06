using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Databaselayer
{
    public class DbConnection
    {
        public static string DBconnec()
        {
        //  string connectionString = "Data Source=10.0.0.4,1433;Initial Catalog=Mixing;User ID=Sa;Password=Fores@123;";
       // string connectionString = "Data Source=desktop-qi6h2ea\\sqlexpress;Initial Catalog=Inpection;Integrated Security=True;Encrypt=True;TrustServerCertificate=True;";
            string connectionString = "Data Source=192.168.20.70,1433;Initial Catalog=inpection;User ID=inspection;Password=inspection@123;";
            return connectionString;

        }

}


}
