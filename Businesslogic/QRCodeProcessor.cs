using Databaselayer;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Reflection.Emit;

namespace Businesslogic
{
    public class QRCodeProcessor
    {
        private List<Exportpacking> scannedDataList = new List<Exportpacking>();
        private const int BoxCapacity = 1000;
        private readonly MyDbContext dbContext;


        public QRCodeProcessor()
        {
            dbContext = new MyDbContext();  
        }
        public void ProcessQRCode(string qrCode)
        {
            //// Parse the QR code
            //var parts = qrCode.Split('/');
            //if (parts.Length != 5)
            //{
            //    throw new ArgumentException("Invalid QR code format");
            //}

            //var sapCode = parts[0];
            //var batch = parts[1];
            //var sku = int.Parse(parts[2]);
            //var totalSku = int.Parse(parts[3]);
            //var quantity = int.Parse(parts[4]);

            //// Check for duplicate SKU
            //if (scannedDataList.Any(d => d.SapCode == sapCode && d.Batch == batch && d.SKU == sku))
            //{
            //    System.Diagnostics.Debug.WriteLine("Duplicate SKU found");
            //}
            //else
            //{

            //    // Add the scanned data to the list
            //    scannedDataList.Add(new Exportpacking
            //    {
            //        SapCode = sapCode,
            //        Batch = batch,
            //        SKU = sku,
            //        TotalSKU = totalSku,
            //        Quantity = quantity
            //    });

            //    // Calculate the total quantity
            //    var totalQuantity = scannedDataList.Sum(d => d.Quantity);
            //    if (totalQuantity != BoxCapacity)
            //    {
            //        // Insert into database
            //        try
            //        {
            //            InsertIntoDatabase(scannedDataList);

            //        }
            //        catch (Exception xe) {
            //            System.Diagnostics.Debug.WriteLine("exception is "+ xe.StackTrace);

            //        }




            //        // Print final sticker
            //        PrintFinalSticker(scannedDataList);

            //        // Reset the list for the next box
            //        scannedDataList.Clear();
            //        System.Diagnostics.Debug.WriteLine("Box is complete. Final sticker printed and data inserted into database.");
            //    }
            //    else if (totalQuantity > BoxCapacity)
            //    {
            //        // Remove the last scanned data as it exceeds the box capacity
            //        scannedDataList.RemoveAt(scannedDataList.Count - 1);
            //        System.Diagnostics.Debug.WriteLine("Total quantity exceeds the box capacity");
            //    }
            //    System.Diagnostics.Debug.WriteLine("QR code processed successfully");
            //}

        }

        //public void InsertIntoDatabase(List<Exportpacking> dataList)
        //{
        //    //try
        //    //{
        //        // Implement your database insertion logic here
        //        // Example using Entity Framework
        //        using (var context = new MyDbContext())
        //        {
        //            context.Exportpacking.AddRange(dataList);
        //            context.SaveChanges();
        //        }
        //    //    System.Diagnostics.Debug.WriteLine("Data successfully inserted into the database.");
        //    //}
        //    //catch (Exception ex)
        //    //{
        //    //    System.Diagnostics.Debug.WriteLine($"Error inserting data into the database: {ex.StackTrace}");
        //    //}
        //}
        private void PrintFinalSticker(List<Exportpacking> data)
        {
            // Implement final sticker printing logic here
            // For example: Print to a printer, generate a PDF, etc.
        }

        public bool CheckForDuplicate(string boCode, string batchCode, string sku)
        {
            throw new NotImplementedException();
        }

        public void addNewBoCode(string boCode, string stdPacking, string standardFixtureQty, string materialDescription, string boPartFinishingWeight, string boPartTotalSurfaceArea)
        {
            throw new NotImplementedException();
        }

        public void UpdateFixtureQuantity(string boCode1, int fixtureQuantity, string stdPacking)
        {
            throw new NotImplementedException();
        }

        public string  getboxstand_packing(string sapcode)
        {
            string value = null;

            Domesticqrdll call= new Domesticqrdll();
            value= call.getboxstand_packing(sapcode);

            return value;
        }
        public  bool checkpreviousRecord(string boCode,int bagNumber,int totalBags,string batchNo)
        {

            bool entryExists = dbContext.Exportpacking.Any(x => x.SapCode == boCode && x.SKU == bagNumber + "/" + totalBags && x.Batch == batchNo);
            System.Diagnostics.Debug.WriteLine("entry is not found" + entryExists);
            return entryExists;
        }

        public void SaveScanDataFromTextbox(string input, int LotNo)
        {
            string[] lines = input.Split(new[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);
            System.Diagnostics.Debug.WriteLine("save method called from bll lines are " + lines);
            foreach (string line in lines)
            {
                string[] components = line.Split('/');

                string boCode = components[0];
                string batchNo = components[1];
                int bagNumber = int.Parse(components[2]);
                int totalBags = int.Parse(components[3]);
                int quantity = int.Parse(components[4]);

                bool entryExists = dbContext.Exportpacking.Any(x => x.SapCode == boCode && x.SKU == bagNumber + "/" + totalBags && x.Batch == batchNo);
                System.Diagnostics.Debug.WriteLine("entry is not found" + entryExists);
                if (!entryExists)
                {
                    try
                    {
                        Exportpacking newScan = new Exportpacking
                        {
                            SapCode = boCode,
                            Batch = batchNo,
                            SKU = $"{bagNumber}/{totalBags}",
                            Quantity = quantity,
                        };

                        dbContext.Exportpacking.Add(newScan);
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine("Error adding new scan: " + ex.Message);
                    }
                }
                
            }
            dbContext.SaveChanges();
        }
    }
}
