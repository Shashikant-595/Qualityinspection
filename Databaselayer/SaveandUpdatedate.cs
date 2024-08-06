using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Databaselayer
{
    public class SaveandUpdatedate
    {
       // private static string connectionString = "Data Source=desktop-qi6h2ea\\sqlexpress;Initial Catalog=Inpection;Integrated Security=True;Encrypt=True;TrustServerCertificate=True;";
       private static string connectionString = "Data Source=192.168.20.70,1433;Initial Catalog=inpection;User ID=inspection;Password=inspection@123;";

        // Method for updating category
        public static void UpdateCategory(string category, bool r1, bool r2, bool r3, bool r4, bool r5, bool r6, bool r7, bool r8, bool r9, bool r10, bool r11, bool r12, bool r13, bool r14, bool r15, bool r16, bool r17, bool r18, bool r19, bool r20, bool r21, bool r22, bool r23, bool r24, bool r25, bool r26, bool r27, bool r28, bool r29, bool r30, bool r31, bool r32, bool r33, bool r34, bool r35, bool r36, bool r37, bool r38, bool r39, bool r40, bool r41, bool r42, bool r43, bool r44, bool r45, bool r46, bool r47, bool r48, bool r49, bool r50, bool r51)
        {
            try
            {

           
            string query = @"
            UPDATE CATEGORY
            SET 
                R1 = @r1, R2 = @r2, R3 = @r3, R4 = @r4, R5 = @r5, R6 = @r6, R7 = @r7, R8 = @r8, R9 = @r9, R10 = @r10, 
                R11 = @r11, R12 = @r12, R13 = @r13, R14 = @r14, R15 = @r15, R16 = @r16, R17 = @r17, R18 = @r18, R19 = @r19, R20 = @r20, 
                R21 = @r21, R22 = @r22, R23 = @r23, R24 = @r24, R25 = @r25, R26 = @r26, R27 = @r27, R28 = @r28, R29 = @r29, R30 = @r30, 
                R31 = @r31, R32 = @r32, R33 = @r33, R34 = @r34, R35 = @r35, R36 = @r36, R37 = @r37, R38 = @r38, R39 = @r39, R40 = @r40, 
                R41 = @r41, R42 = @r42, R43 = @r43, R44 = @r44, R45 = @r45, R46 = @r46, R47 = @r47, R48 = @r48, R49 = @r49, R50 = @r50,
                R51 = @r51
            WHERE category_name = @category";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@category", category);
                    command.Parameters.AddWithValue("@r1", r1);
                    command.Parameters.AddWithValue("@r2", r2);
                    command.Parameters.AddWithValue("@r3", r3);
                    command.Parameters.AddWithValue("@r4", r4);
                    command.Parameters.AddWithValue("@r5", r5);
                    command.Parameters.AddWithValue("@r6", r6);
                    command.Parameters.AddWithValue("@r7", r7);
                    command.Parameters.AddWithValue("@r8", r8);
                    command.Parameters.AddWithValue("@r9", r9);
                    command.Parameters.AddWithValue("@r10", r10);
                    command.Parameters.AddWithValue("@r11", r11);
                    command.Parameters.AddWithValue("@r12", r12);
                    command.Parameters.AddWithValue("@r13", r13);
                    command.Parameters.AddWithValue("@r14", r14);
                    command.Parameters.AddWithValue("@r15", r15);
                    command.Parameters.AddWithValue("@r16", r16);
                    command.Parameters.AddWithValue("@r17", r17);
                    command.Parameters.AddWithValue("@r18", r18);
                    command.Parameters.AddWithValue("@r19", r19);
                    command.Parameters.AddWithValue("@r20", r20);
                    command.Parameters.AddWithValue("@r21", r21);
                    command.Parameters.AddWithValue("@r22", r22);
                    command.Parameters.AddWithValue("@r23", r23);
                    command.Parameters.AddWithValue("@r24", r24);
                    command.Parameters.AddWithValue("@r25", r25);
                    command.Parameters.AddWithValue("@r26", r26);
                    command.Parameters.AddWithValue("@r27", r27);
                    command.Parameters.AddWithValue("@r28", r28);
                    command.Parameters.AddWithValue("@r29", r29);
                    command.Parameters.AddWithValue("@r30", r30);
                    command.Parameters.AddWithValue("@r31", r31);
                    command.Parameters.AddWithValue("@r32", r32);
                    command.Parameters.AddWithValue("@r33", r33);
                    command.Parameters.AddWithValue("@r34", r34);
                    command.Parameters.AddWithValue("@r35", r35);
                    command.Parameters.AddWithValue("@r36", r36);
                    command.Parameters.AddWithValue("@r37", r37);
                    command.Parameters.AddWithValue("@r38", r38);
                    command.Parameters.AddWithValue("@r39", r39);
                    command.Parameters.AddWithValue("@r40", r40);
                    command.Parameters.AddWithValue("@r41", r41);
                    command.Parameters.AddWithValue("@r42", r42);
                    command.Parameters.AddWithValue("@r43", r43);
                    command.Parameters.AddWithValue("@r44", r44);
                    command.Parameters.AddWithValue("@r45", r45);
                    command.Parameters.AddWithValue("@r46", r46);
                    command.Parameters.AddWithValue("@r47", r47);
                    command.Parameters.AddWithValue("@r48", r48);
                    command.Parameters.AddWithValue("@r49", r49);
                    command.Parameters.AddWithValue("@r50", r50);
                    command.Parameters.AddWithValue("@r51", r51);
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    Console.WriteLine("Rows affected: " + rowsAffected);
                    System.Diagnostics.Debug.WriteLine(category+ r1+r2+"dbl ok for add cat");
                }
            }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.StackTrace + "dll exception for add category");

            }
        }

        // update selected category
        public static List<string> PassUpdateToUI(string categoryName)
        {
          
           
            List<string> columnsWithOneValue = new List<string>();

            System.Diagnostics.Debug.Write("category is "+categoryName);
            string query = "SELECT * FROM CATEGORY WHERE category_name = @CategoryName";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CategoryName", categoryName);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        // Assuming the query returns only one row for the given category_name
                        if (reader.Read())
                        {
                            // Loop through column names in the result set
                            for (int i = 1; i <= 52; i++) // Assuming 52 columns R1 to R42
                            {
                                string columnName = "R" + i;
                                if (Convert.ToInt32(reader[columnName]) == 1)
                                {
                                   
                                    columnsWithOneValue.Add(columnName);
                                }
                            }
                        }

                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        // Handle exceptions as needed
                        Console.WriteLine("Error: " + ex.Message);
                        System.Diagnostics.Debug.WriteLine(ex.StackTrace);  
                    }
                }
            }
            System.Diagnostics.Debug.WriteLine("this is list:"+ columnsWithOneValue+ columnsWithOneValue.Count);
            return columnsWithOneValue;
        }


        //  insert defects data in to tbl
      public static void insertDefects(string partno, int R1, int R2, int R3, int R4, int R5, int R6, int R7, int R8, int R9, int R10,
                          int R11, int R12, int R13, int R14, int R15, int R16, int R17, int R18, int R19, int R20,
                          int R21, int R22, int R23, int R24, int R25, int R26, int R27, int R28, int R29, int R30,
                          int R31, int R32, int R33, int R34, int R35, int R36, int R37, int R38, int R39, int R40,
                          int R41, int R42, int R43, int R44, int R45, int R46, int R47, int R48, int R49, int R50,
                          int R51,int ok,int rej,int Total)
{


            try
            {
                string query = "INSERT INTO Inspection_Data (Partno, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20,R21, R22, R23, R24, R25, R26, R27, R28, R29, R30,R31, R32, R33, R34, R35, R36, R37, R38, R39, R40,R41, R42, R43, R44, R45, R46, R47, R48, R49, R50, R51, date_time,ok,Totalrej,Received)VALUES (@partno, @R1, @R2, @R3, @R4, @R5, @R6, @R7, @R8, @R9, @R10,@R11, @R12, @R13, @R14, @R15, @R16, @R17, @R18, @R19, @R20,@R21, @R22, @R23, @R24, @R25, @R26, @R27, @R28, @R29, @R30,@R31, @R32, @R33, @R34, @R35, @R36, @R37, @R38, @R39, @R40,@R41, @R42, @R43, @R44, @R45, @R46, @R47, @R48, @R49, @R50, @R51, @date_time,@ok,@Totalrej,@Received)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Define the parameters and their values
                        command.Parameters.AddWithValue("@partno", partno);
                        command.Parameters.AddWithValue("@R1", R1);
                        command.Parameters.AddWithValue("@R2", R2);
                        command.Parameters.AddWithValue("@R3", R3);
                        command.Parameters.AddWithValue("@R4", R4);
                        command.Parameters.AddWithValue("@R5", R5);
                        command.Parameters.AddWithValue("@R6", R6);
                        command.Parameters.AddWithValue("@R7", R7);
                        command.Parameters.AddWithValue("@R8", R8);
                        command.Parameters.AddWithValue("@R9", R9);
                        command.Parameters.AddWithValue("@R10", R10);
                        command.Parameters.AddWithValue("@R11", R11);
                        command.Parameters.AddWithValue("@R12", R12);
                        command.Parameters.AddWithValue("@R13", R13);
                        command.Parameters.AddWithValue("@R14", R14);
                        command.Parameters.AddWithValue("@R15", R15);
                        command.Parameters.AddWithValue("@R16", R16);
                        command.Parameters.AddWithValue("@R17", R17);
                        command.Parameters.AddWithValue("@R18", R18);
                        command.Parameters.AddWithValue("@R19", R19);
                        command.Parameters.AddWithValue("@R20", R20);
                        command.Parameters.AddWithValue("@R21", R21);
                        command.Parameters.AddWithValue("@R22", R22);
                        command.Parameters.AddWithValue("@R23", R23);
                        command.Parameters.AddWithValue("@R24", R24);
                        command.Parameters.AddWithValue("@R25", R25);
                        command.Parameters.AddWithValue("@R26", R26);
                        command.Parameters.AddWithValue("@R27", R27);
                        command.Parameters.AddWithValue("@R28", R28);
                        command.Parameters.AddWithValue("@R29", R29);
                        command.Parameters.AddWithValue("@R30", R30);
                        command.Parameters.AddWithValue("@R31", R31);
                        command.Parameters.AddWithValue("@R32", R32);
                        command.Parameters.AddWithValue("@R33", R33);
                        command.Parameters.AddWithValue("@R34", R34);
                        command.Parameters.AddWithValue("@R35", R35);
                        command.Parameters.AddWithValue("@R36", R36);
                        command.Parameters.AddWithValue("@R37", R37);
                        command.Parameters.AddWithValue("@R38", R38);
                        command.Parameters.AddWithValue("@R39", R39);
                        command.Parameters.AddWithValue("@R40", R40);
                        command.Parameters.AddWithValue("@R41", R41);
                        command.Parameters.AddWithValue("@R42", R42);
                        command.Parameters.AddWithValue("@R43", R43);
                        command.Parameters.AddWithValue("@R44", R44);
                        command.Parameters.AddWithValue("@R45", R45);
                        command.Parameters.AddWithValue("@R46", R46);
                        command.Parameters.AddWithValue("@R47", R47);
                        command.Parameters.AddWithValue("@R48", R48);
                        command.Parameters.AddWithValue("@R49", R49);
                        command.Parameters.AddWithValue("@R50", R50);
                        command.Parameters.AddWithValue("@R51", R51);
                        command.Parameters.AddWithValue("@date_time", DateTime.Now);
                        command.Parameters.AddWithValue("@Totalrej", rej);
                        command.Parameters.AddWithValue("@Received", Total);
                        command.Parameters.AddWithValue("@ok", ok);

                        // Open the connection and execute the query
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

            }
            catch(Exception ex) { 
            
            System.Diagnostics.Debug.WriteLine (ex.StackTrace); 
            
            }
    
      }
//       

        public static void createFg(string category, string partno, string partdescription)
        {
           
            string query = "INSERT INTO createfg (category,partno,partdescription) VALUES (@category, @partno, @partdescription)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Define the parameters and their values
                    command.Parameters.AddWithValue("@category", category);
                    command.Parameters.AddWithValue("@partno", partno);
                    command.Parameters.AddWithValue("@partdescription", partdescription);
                    // Open the connection and execute the query
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

        }
        public static List<string> getCategory(string partno)
        {
            List<string> columnsWithOne = new List<string>();

            string query = "SELECT category FROM createfg WHERE partdescription = @partno";
            string query2 = "SELECT * FROM CATEGORY where category_name=@category";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // First query to get the category based on partno
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@partno", partno);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            string category = reader.GetString(0);
                           
                            reader.Close();

                            // Second query to get the columns with value 1 based on the category
                            using (SqlCommand command1 = new SqlCommand(query2, connection))
                            {
                                command1.Parameters.AddWithValue("@category", category);

                                SqlDataReader reader1 = command1.ExecuteReader();

                                if (reader1.Read())
                                {
                                    // Loop through the columns to find which ones have a value of 1
                                    for (int i = 0; i < reader1.FieldCount; i++)
                                    {
                                        if (!reader1.IsDBNull(i))
                                        {
                                            // Convert the value to int
                                            string value = Convert.ToString(reader1[i]);
                                            if (value=="1")
                                            {
                                                string columnName = reader1.GetName(i);
                                                columnsWithOne.Add(columnName);
                                                System.Diagnostics.Debug.WriteLine("Column with 1: " + columnName);
                                            }
                                        }
                                    }
                                }

                                reader1.Close();
                            }
                        }
                        else
                        {
                            reader.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Error from method: " + ex.StackTrace);
                        System.Diagnostics.Debug.WriteLine("Error from method: " + ex.StackTrace);
                    }
                    finally
                    {
                        connection.Close();
                    }
                }
            }

            return columnsWithOne;
        }



    }
}
