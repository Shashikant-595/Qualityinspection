using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Databaselayer;

namespace Businesslogic
{
    public class Domesticqrbll
    {
        public static string GenerateBatchCode(string sapCode)
        {
            string currentDate = DateTime.Now.ToString("yyMMdd");
            int batchNumber = 1;
            string batch;

            // Use a unique identifier per call to ensure unique batch numbers
            do
            {
                batch = $"{currentDate}{batchNumber:D3}";
                batchNumber++;
            } while (Domesticqrdll.BatchExists(sapCode, batch));

            System.Diagnostics.Debug.WriteLine("this is batch generated "+batch);
            return batch;
        }



        public static bool BatchExists(string sapCode, string batch)
        {

            bool count = Domesticqrdll.BatchExists(sapCode, batch);

            return count;
        }
        public static void SaveQRCodeData(string sapCode, string batch, string sku, string stickerQuantity)
        {
            try
            {
                Domesticqrdll.SaveQRCodeData(sapCode, batch, sku, stickerQuantity); // Call the data access method
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Exception while saving data: " + ex.StackTrace);
            }
        }

        public static string getSapcodefromtbl(string matDesc)
        {
            string sapcode = Domesticqrdll.getSapcodefromtbl(matDesc);

            System.Diagnostics.Debug.WriteLine("sapcode form method/n"+sapcode);
            return sapcode;
        }
        public static string getdescriptionfromtbl(string sapcode)
        {
            string description = Domesticqrdll.getdescriptionfromtbl(sapcode);

            System.Diagnostics.Debug.WriteLine("sapcode form method/n" + description);
            return description;
        }

        public static string getDomestic_qty(string sapcode)
        {
            throw new NotImplementedException();
        }
    }



}