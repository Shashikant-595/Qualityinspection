using Businesslogic;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Qualityinspection
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public static string connectionString = dbconnection.db();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            // for small tile span avoid to pass the all part numbers 
            try
           { 
                List<string> Batches = getbatchesfrom_master();

                System.Diagnostics.Trace.WriteLine($" batchess are  ; " + Batches);
                foreach (string batch in Batches)
                {

                    ddlSapCode.Items.Add(new ListItem(batch));
                }

            }
            catch (Exception ex)
            {
                String msg = ex.Message;
                string mgs = ex.StackTrace;
                ClientScript.RegisterStartupScript(this.GetType(), "PopupMessage", msg, true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "showSweetAlert('Oops', 'Please check internet connection.', 'error');", true);

            }

        }
        private string getSapcodefromtbl(string matDesc)
        {
            string sapcode = null;
            try
            {

                sapcode = Domesticqrbll.getSapcodefromtbl(matDesc);
            }
            catch (Exception ex)
            {

                System.Diagnostics.Debug.WriteLine("exception from sapcode getting " + ex.StackTrace);

            }
            return sapcode;

        }
        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            string sapcode1 = ddlSapCode.SelectedValue;
            string sapcode = getSapcodefromtbl(sapcode1);
            string inspector = ddlinspector.SelectedValue;
            string supervisor = ddlsupperwiser.SelectedValue;
            int stickerQuantity = int.Parse(txtStickerQuantity.Text);
            string totalQuantity = (txtTotalQuantity.Text);
            string batch = Domesticqrbll.GenerateBatchCode(sapcode);
            for (int sku = 1; sku <= stickerQuantity; sku++)
            {
               
                System.Diagnostics.Debug.WriteLine("Generated batch: " + batch);

                string skuString = sku.ToString() + "/" + stickerQuantity.ToString();
                string stickerQuantityString = stickerQuantity.ToString();

                string qrString = $"{sapcode}/{batch}/{skuString}/{totalQuantity}";

                // need to save sticker data after the print 
                if (sku == stickerQuantity)
                {
                   
                    Domesticqrbll.SaveQRCodeData(sapcode, batch, skuString, totalQuantity);

                }

                string script = $"generateQRCode('{qrString}', '{inspector}', '{supervisor}','{sapcode}','{sapcode1}');";
                ClientScript.RegisterStartupScript(this.GetType(), "generateQRCode" + sku, script, true);
            }
        }
        private List<string> getbatchesfrom_master()
        {
            List<string> batches = new List<string>();
            string query = "SELECT partdescription FROM createfg";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {


                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        System.Diagnostics.Trace.WriteLine($"Connection opened successfully.");

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {

                                // Assuming batch_name is a string field in the database

                                string batchName = reader.GetString(0); // Assuming batch_name is the first column

                                batches.Add(batchName);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                System.Diagnostics.Trace.WriteLine($" exception is   ; " + ex.StackTrace);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "showSweetAlert('Oops', 'SQL exception is occured', ''Assets/thumb-down.png'');", true);

                // Handle exception here
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "showSweetAlert('Oops', 'check your internet connection.', ''Assets/thumb-down.png'');", true);

            }

            return batches;
        }

        protected void ddlSapCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            string partdescription= ddlSapCode.Text;
            string sapcode = getSapcodefromtbl(partdescription);
            System.Diagnostics.Debug.WriteLine("sapcode "+sapcode);

            string domastic_value = null;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT Domatic_Qty FROM createfg WHERE partno = @sapcode";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@sapcode", sapcode);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Retrieve the value as an int and convert it to a string
                        int qty = reader.GetInt32(0);
                        domastic_value = qty.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Database Exception: " + ex.Message);
                System.Diagnostics.Debug.WriteLine("Stack Trace: " + ex.StackTrace);
            }

            
            txtTotalQuantity.Text = domastic_value; 
            System.Diagnostics.Debug.WriteLine("sapcode "+sapcode);

        }
    }
}