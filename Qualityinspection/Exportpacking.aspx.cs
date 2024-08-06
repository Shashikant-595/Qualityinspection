using Businesslogic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Qualityinspection
{

    public partial class Exportpacking : System.Web.UI.Page
    {
        private QRCodeProcessor qrCodeProcessor;

        private DataTable ScanDataTable
        {
            get

            {
                if (ViewState["ScanDataTable"] == null)
                {


                    DataTable dt = new DataTable();
                    dt.Columns.Add("SapCode");
                    dt.Columns.Add("Batch");
                    dt.Columns.Add("SKU");
                    dt.Columns.Add("Quantity");
                    // dt.Columns.Add("LotNumber");
                    ViewState["ScanDataTable"] = dt;
                }
                return (DataTable)ViewState["ScanDataTable"];
            }
            set
            {
                ViewState["ScanDataTable"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            qrCodeProcessor = new QRCodeProcessor();
            BindGridView(ScanDataTable);


        }

        private void BindGridView(DataTable dt)
        {
            gvScannedData.DataSource = dt;
            gvScannedData.DataBind();
        }

        private void SaveScanData()
        {
            DataTable dt = ScanDataTable;


            int quantity1 = int.Parse(txtTotalQuantity.Text);
            int rowCount = dt.Rows.Count;
            int currentIndex = 0;
            foreach (DataRow row in dt.Rows)
            {
                string boCode = row["SapCode"].ToString();
                string batchCode = row["Batch"].ToString();
                string sku = row["SKU"].ToString();
                int quantity = int.Parse(txtTotalQuantity.Text);


                qrCodeProcessor.SaveScanDataFromTextbox($"{boCode}/{batchCode}/{sku}/{quantity1}", quantity);



                currentIndex++;
                System.Diagnostics.Debug.WriteLine("toatal row count " + rowCount + "and current row is " + currentIndex);

                // generate final sticker 
                if (currentIndex == rowCount)
                {
                    int totalqty = int.Parse(txtTotalQuantity.Text);
                    string packer, inspector;
                    string secription = getdescriptionfromtbl(boCode);
                    string qrString = $"{boCode}/{batchCode}/{totalqty}";
                    packer = ddlinspector.SelectedValue;
                    inspector = ddlsupperwiser.SelectedValue;
                    System.Diagnostics.Debug.WriteLine("toatal row count " + rowCount + "/qrcode stringis=" + qrString + "description is=  " + inspector + packer);

                    string script = $"generateExportQRCode('{qrString}', '{inspector}', '{packer}','{boCode}','{secription}');";


                    ClientScript.RegisterStartupScript(this.GetType(), "generateExportQRCode" + sku, script, true);
                    System.Diagnostics.Debug.WriteLine("method is called successfully");
                }


                gvScannedData.DataSource = null;
                gvScannedData.DataBind();


            }



        }

        private string getdescriptionfromtbl(string sapcode)
        {
            string description = null;
            try
            {

                description = Domesticqrbll.getdescriptionfromtbl(sapcode);
            }
            catch (Exception ex)
            {

                System.Diagnostics.Debug.WriteLine("exception from sapcode getting " + ex.StackTrace);

            }
            return description;
        }



        protected void BtnPrint_Click1(object sender, EventArgs e)
        {


            System.Diagnostics.Debug.WriteLine("method  ");
            try
            {
                SaveScanData();
            }
            catch (Exception ex)
            {
                string msg = ex.StackTrace;

                System.Diagnostics.Debug.WriteLine("method called " + msg);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showpopup", msg, true);
            }
            Session["TotalQuantity"] = null;
            ScanDataTable.Clear();
            gvScannedData.DataSource = null;
            gvScannedData.DataBind();

            txtFixtureQuantity.Text = string.Empty;
            txtTotalQuantity.Text = string.Empty;

        }

        protected void txtScanData_TextChanged(object sender, EventArgs e)
        {

            int totalQuantity = 0;

            lbl_Alert.Visible = false;
            string scanData = txtScanData.Text.Trim();
            string[] parts = scanData.Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries);

            if (parts.Length >= 4)
            {

                string boCode = parts[0];
                // pass sapcode to get standered packing qty 
                QRCodeProcessor qRCodeProcessor1 = new QRCodeProcessor();
                string exportqty = qRCodeProcessor1.getboxstand_packing(boCode);
                txtFixtureQuantity.Text = exportqty;
                string batchCode = parts[1];
                string sku1 = parts[2];
                string sku2 = parts[3];
                string quantityStr = parts.Length > 4 ? parts[4] : ""; // Ensure we have at least 5 parts

                if (int.TryParse(quantityStr, out int quantity))
                {
                    DataTable dt = ScanDataTable;

                    // Check if the BoCode and BatchCode already exist (new batch check)
                    bool newBatched = dt.AsEnumerable().Any(row =>
                        row.Field<string>("SapCode") != boCode
                    // ||
                    //row.Field<string>("Batch") != batchCode
                    );

                    // Check if the data already exists (full match check)
                    bool exists = dt.AsEnumerable().Any(row =>
                        row.Field<string>("SapCode") == boCode &&
                        row.Field<string>("Batch") == batchCode &&
                        row.Field<string>("SKU") == (sku1 + "/" + sku2)
                    );

                    QRCodeProcessor qRCodeProcessor = new QRCodeProcessor();
                    bool exist2 = qRCodeProcessor.checkpreviousRecord(boCode, int.Parse(sku1), int.Parse(sku2), batchCode);




                    if (exists || exist2)
                    {
                        // Show a popup message if the data already exists
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('This data has already been scanned.');", true);
                    }
                    else if (newBatched)
                    {
                        // Show a popup message for new batch
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('You have scan new part . This is different from the currently scanned part.');", true);
                        //  txt_Lot.Text = businessLayer.GenerateLotNo();
                    }
                    else if (txtFixtureQuantity.Text == txtTotalQuantity.Text)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please print the export sticker. Your box is completely filled.');", true);
                    }
                    else
                    {

                        // Add new row if all checks are passed
                        DataRow row = dt.NewRow();
                        row["SapCode"] = boCode;
                        row["Batch"] = batchCode;
                        row["SKU"] = sku1 + "/" + sku2;
                        row["Quantity"] = quantityStr;
                        //totalquantity += int.Parse(quantityStr);
                        if (Session["TotalQuantity"] != null)
                        {
                            totalQuantity = (int)Session["TotalQuantity"];
                        }

                        // Add the current quantity to the total
                        totalQuantity += quantity;

                        // Store the updated total back to the session
                        Session["TotalQuantity"] = totalQuantity;

                        // Update the total quantity textbox
                        txtTotalQuantity.Text = totalQuantity.ToString();

                        BindGridView(dt);

                        dt.Rows.Add(row);


                        ScanDataTable = dt; // Update ViewState
                        BindGridView(dt);



                    }
                    txtScanData.Text = string.Empty;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Invalid Data');", true);
                }
            }

        }
        protected void btnrefrash_Click1(object sender, EventArgs e)
        {
            Session["TotalQuantity"] = null;
            ScanDataTable.Clear();
            gvScannedData.DataSource = null;
            gvScannedData.DataBind();

            txtFixtureQuantity.Text = string.Empty;
            txtTotalQuantity.Text = string.Empty;
        }
    }
}