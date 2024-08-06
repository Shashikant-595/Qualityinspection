using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;


namespace Databaselayer
{
    public  class Domesticqrdll
    {
        private static string connectionString = "Data Source=192.168.20.70,1433;Initial Catalog=inpection;User ID=inspection;Password=inspection@123;";

        public static bool BatchExists(string sapCode, string batch)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM QRCodeData WHERE  Batch = @Batch";
                SqlCommand cmd = new SqlCommand(query, conn);
                
                cmd.Parameters.AddWithValue("@Batch", batch);

                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        public static  void SaveQRCodeData(string sapCode, string batch, string sku, string stickerQuantity)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO QRCodeData (SAPCode, Batch, SKU, Quantity, DateGenerated) VALUES (@SAPCode, @Batch, @SKU, @Quantity, @DateGenerated)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SAPCode", sapCode);
                cmd.Parameters.AddWithValue("@Batch", batch);
                cmd.Parameters.AddWithValue("@SKU", sku);
                cmd.Parameters.AddWithValue("@Quantity", stickerQuantity);

                cmd.Parameters.AddWithValue("@DateGenerated", DateTime.Now);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }


        public static string getSapcodefromtbl(string matDesc)
        {
            string sapcode = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT partno FROM createfg WHERE partdescription = @matDesc";
                SqlCommand cmd = new SqlCommand(query, conn);

                // Correct parameter name to match the query
                cmd.Parameters.AddWithValue("@matDesc", matDesc);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    sapcode = reader.GetString(0);

                   
                }
            }
            return sapcode;
        }
       

        public string getboxstand_packing(string sapcode)
        {
            string value = null;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT export_qty FROM createfg WHERE partno = @sapcode";
                    SqlCommand cmd = new SqlCommand(query, conn);

                    // Correct parameter name to match the query
                    cmd.Parameters.AddWithValue("@sapcode", sapcode);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        value = reader.GetInt32(0).ToString();


                    }
                }
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.Message);  
            }


            System.Diagnostics.Debug.WriteLine(value);

            return value;
        }
        public static string getdescriptionfromtbl(string sapcode)
        {
            string description = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT partdescription FROM createfg WHERE partno = @sapcode";
                SqlCommand cmd = new SqlCommand(query, conn);

                // Correct parameter name to match the query
                cmd.Parameters.AddWithValue("@sapcode", sapcode);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    description = reader.GetString(0);


                }
            }

            return description;
        }

       
    }
}
