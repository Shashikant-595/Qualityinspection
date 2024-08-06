using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Databaselayer;
namespace Businesslogic
{
    public class saveUpdatedb
    {

        public static void updateCategory(string category, bool R1, bool R2, bool R3, bool R4, bool R5, bool R6, bool R7, bool R8, bool R9, bool R10, bool R11, bool R12, bool R13, bool R14, bool R15, bool R16, bool R17, bool R18, bool R19, bool R20, bool R21, bool R22, bool R23, bool R24, bool R25, bool R26, bool R27, bool R28, bool R29, bool R30, bool R31, bool R32, bool R33, bool R34, bool R35, bool R36, bool R37, bool R38, bool R39, bool R40, bool R41, bool R42, bool R43, bool R44, bool R45, bool R46, bool R47, bool R48, bool R49, bool R50, bool R51)
        {
            SaveandUpdatedate.UpdateCategory(category, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31, R32, R33, R34, R35, R36, R37, R38, R39, R40, R41, R42,R43,R44,R45,R46,R47,R48,R49,R50,R51);

            System.Diagnostics.Debug.WriteLine(category + R1 + R2 + "method updated success full");
        }

        public static List<string> PassUpdateToUI(string categoryName)
        {
            List<string> checkedNames = SaveandUpdatedate.PassUpdateToUI(categoryName);
            return checkedNames;
        }
        public static void insertDefects(string partno, int R1, int R2, int R3, int R4, int R5, int R6, int R7, int R8, int R9, int R10,
                          int R11, int R12, int R13, int R14, int R15, int R16, int R17, int R18, int R19, int R20,
                          int R21, int R22, int R23, int R24, int R25, int R26, int R27, int R28, int R29, int R30,
                          int R31, int R32, int R33, int R34, int R35, int R36, int R37, int R38, int R39, int R40,
                          int R41, int R42, int R43, int R44, int R45, int R46, int R47, int R48, int R49, int R50,
                          int R51,int ok,int rej,int total)
        {

            SaveandUpdatedate.insertDefects(partno, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10,
                                        R11, R12, R13, R14, R15, R16, R17, R18, R19, R20,
                                        R21, R22, R23, R24, R25, R26, R27, R28, R29, R30,
                                        R31, R32, R33, R34, R35, R36, R37, R38, R39, R40,
                                        R41, R42, R43, R44, R45, R46, R47, R48, R49, R50,
                                        R51,ok,rej,total);
        } 
       
        public static void createFg(string category, string sapcode, string desc)
        {
            SaveandUpdatedate.createFg(category, sapcode, desc);    
        }

        public static List<string> getCategory(string partno)
        {
            List<string>codes = SaveandUpdatedate.getCategory(partno);

            return codes;
        }

    }
}
