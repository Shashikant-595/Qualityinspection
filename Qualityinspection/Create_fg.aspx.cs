using Businesslogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Qualityinspection
{
    public partial class Create_fg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtsapcode_TextChanged(object sender, EventArgs e)
        {
            string sapcode = txtsapcode.Text;
            string pattern = @"^S\d{9}$"; // Define your pattern
            Regex regex = new Regex(pattern);

            // Remove unwanted characters
            sapcode = Regex.Replace(sapcode, @"[^S\d]", ""); // Remove anything that is not 'S' or a digit

            // Check if the sanitized input matches the pattern
            if (regex.IsMatch(sapcode))
            {
                txtsapcode.Text = sapcode; // Update the TextBox with sanitized input
                lblValidationMessage.Text = "Valid";
                lblValidationMessage.CssClass = "text-success";
            }
            else
            {
                lblValidationMessage.Text = " Entered code is invalid could you please check it once ";
                lblValidationMessage.CssClass = "text-danger";
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {

            string category = DropDownList1.SelectedItem.ToString();
            string sapcode = txtsapcode.Text;
            string dsc = txtdesc.Text;

            if (!string.IsNullOrEmpty(sapcode) && !string.IsNullOrEmpty(dsc))
            {
                try
                {
                    saveUpdatedb.createFg(category, sapcode, dsc);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert", "showSweetAlert('Confirmation', 'Finished good added successfully', 'success');", true);
                    txtsapcode.Text = "";
                    txtdesc.Text = "";


                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert", $"showSweetAlert('Oops', 'An error occurred: {ex.Message}', 'error');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert", "showSweetAlert('Oops', 'Provide valid sapcode and description.', 'error');", true);
            }


            // Register the client-side script to display an alert




        }
    }
}