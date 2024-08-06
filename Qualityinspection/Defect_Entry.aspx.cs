using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Businesslogic;
namespace Qualityinspection
{
    public partial class newentryscreen1 : System.Web.UI.Page
    {
        public static string connectionString = dbconnection.db();
        protected void Page_Load(object sender, EventArgs e)
        {
            rejqt.Enabled = false;
            resqty.Enabled = false;

            //if (!IsPostBack)
            //{
            // Hide all panels initially
                for (int i = 1; i <= 52; i++)
                {
                    string controlID = "panel" + i;
                    Panel panel = FindControlRecursive(Page, controlID) as Panel;
                    System.Diagnostics.Trace.WriteLine($"Checking panel: {controlID}");
                    if (panel != null)
                    {
                        panel.Visible = false;
                        System.Diagnostics.Trace.WriteLine($"Panel {controlID} found and set to invisible.");
                    }
                    else
                    {
                        System.Diagnostics.Trace.WriteLine($"Panel {controlID} not found.");
                    }
                }


          //  }
            try
            { // on page loade pass the list of sapcodes to the dropdown 
                List<string> Batches = getbatchesfrom_master();

                System.Diagnostics.Trace.WriteLine($" batchess are  ; " + Batches);
                foreach (string batch in Batches)
                {

                    DropDownList1.Items.Add(new ListItem(batch));
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string partno = DropDownList1.SelectedItem.ToString().Trim();
                List<string> codes = saveUpdatedb.getCategory(partno);

                foreach (string code in codes)
                {
                    // Extract the numeric part from the code, assuming the first character is 'R'
                    string number = code.Substring(1);
                    string panelId = "panel" + number;

                    System.Diagnostics.Trace.WriteLine("Enabling " + panelId);
                    Panel panel = FindControlRecursive(Page, panelId) as Panel;
                    if (panel != null)
                    {
                        panel.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("Exception from the db error: " + ex.StackTrace);
            }

        }

        private Control FindControlRecursive(Control root, string id)
        {
            // Check if the root control matches the ID
            if (root.ID == id)
            {
                return root;
            }

            // Recursively check child controls
            foreach (Control control in root.Controls)
            {
                Control foundControl = FindControlRecursive(control, id);
                if (foundControl != null)
                {
                    return foundControl;
                }
            }

            // If not found, return null
            return null;
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
             string partno = DropDownList1.SelectedItem.ToString();
            // gate all text box values and insert it in to the defect tbl
            // Initialize the parameters
            int r1, r2, r3, r4, r5, r6, r7, r8, r9, r10,
                r11, r12, r13, r14, r15, r16, r17, r18, r19, r20,
                r21, r22, r23, r24, r25, r26, r27, r28, r29, r30,
                r31, r32, r33, r34, r35, r36, r37, r38, r39, r40,
                r41, r42, r43, r44, r45, r46, r47, r48, r49, r50, r51;

            // Parse each value and handle empty input by treating it as 0
            int.TryParse(R1.Text, out r1);
            int.TryParse(R2.Text, out r2);
            int.TryParse(R3.Text, out r3);
            int.TryParse(R4.Text, out r4);
            int.TryParse(R5.Text, out r5);
            int.TryParse(R6.Text, out r6);
            int.TryParse(R7.Text, out r7);
            int.TryParse(R8.Text, out r8);
            int.TryParse(R9.Text, out r9);
            int.TryParse(R10.Text, out r10);
            int.TryParse(R11.Text, out r11);
            int.TryParse(R12.Text, out r12);
            int.TryParse(R13.Text, out r13);
            int.TryParse(R14.Text, out r14);
            int.TryParse(R15.Text, out r15);
            int.TryParse(R16.Text, out r16);
            int.TryParse(R17.Text, out r17);
            int.TryParse(R18.Text, out r18);
            int.TryParse(R19.Text, out r19);
            int.TryParse(R20.Text, out r20);
            int.TryParse(R21.Text, out r21);
            int.TryParse(R22.Text, out r22);
            int.TryParse(R23.Text, out r23);
            int.TryParse(R24.Text, out r24);
            int.TryParse(R25.Text, out r25);
            int.TryParse(R26.Text, out r26);
            int.TryParse(R27.Text, out r27);
            int.TryParse(R28.Text, out r28);
            int.TryParse(R29.Text, out r29);
            int.TryParse(R30.Text, out r30);
            int.TryParse(R31.Text, out r31);
            int.TryParse(R32.Text, out r32);
            int.TryParse(R33.Text, out r33);
            int.TryParse(R34.Text, out r34);
            int.TryParse(R35.Text, out r35);
            int.TryParse(R36.Text, out r36);
            int.TryParse(R37.Text, out r37);
            int.TryParse(R38.Text, out r38);
            int.TryParse(R39.Text, out r39);
            int.TryParse(R40.Text, out r40);
            int.TryParse(R41.Text, out r41);
            int.TryParse(R42.Text, out r42);
            int.TryParse(R43.Text, out r43);
            int.TryParse(R44.Text, out r44);
            int.TryParse(R45.Text, out r45);
            int.TryParse(R46.Text, out r46);
            int.TryParse(R47.Text, out r47);
            int.TryParse(R48.Text, out r48);
            int.TryParse(R49.Text, out r49);
            int.TryParse(R50.Text, out r50);
            int.TryParse(R51.Text, out r51);
            try
            {
                if (r1 == 0 && r2 == 0 && r3 == 0 && r4 == 0 && r5 == 0 && r6 == 0 && r7 == 0 &&
    r8 == 0 && r9 == 0 && r10 == 0 && r11 == 0 && r12 == 0 && r13 == 0 &&
    r14 == 0 && r15 == 0 && r16 == 0 && r17 == 0 && r18 == 0 && r19 == 0 &&
    r20 == 0 && r21 == 0 && r22 == 0 && r23 == 0 && r24 == 0 && r25 == 0 &&
    r26 == 0 && r27 == 0 && r28 == 0 && r29 == 0 && r30 == 0 && r31 == 0 &&
    r32 == 0 && r33 == 0 && r34 == 0 && r35 == 0 && r36 == 0 && r37 == 0 &&
    r38 == 0 && r39 == 0 && r40 == 0 && r41 == 0 && r42 == 0 && r43 == 0 &&
    r44 == 0 && r45 == 0 && r46 == 0 && r47 == 0 && r48 == 0 && r49 == 0 &&
    r50 == 0 && r51 == 0)
                {
                    ScriptManager.RegisterStartupScript(this,this.GetType(),"SweetAlert", "showSweetAlert('Epty Entry', 'Empty entries are prohibited.', 'error');", true);

                }

                else
                {
                   

                    int rejectedqty=r1+r2+r3+r4+r5+r6+r7+r8+r9+r10+r11+r12+r13+r14+r15+r16+r17+r18+r19+r20+r21+r22+r23+r24+r25+r26+r27+r28+r29+r30+r33+r34+r35+r36+r37+r38+r39+r40+r41+r42+r43+r44+r45+r46+r47+r48+r49+r50+r51;
                    int Acceptedqty;
                    int.TryParse(acptqty.Text, out Acceptedqty);
                    if (Acceptedqty!=0)
                    {
                        int receivedqty = Acceptedqty + rejectedqty;
                        resqty.Text = receivedqty.ToString();
                        rejqt.Text = rejectedqty.ToString();


                        // if received material quantity is grater than accepted and rejected then and then only we save data 
                        if (receivedqty > Acceptedqty && receivedqty > rejectedqty )
                        {
                            saveUpdatedb.insertDefects(partno, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10,
                                    r11, r12, r13, r14, r15, r16, r17, r18, r19, r20,
                                    r21, r22, r23, r24, r25, r26, r27, r28, r29, r30,
                                    r31, r32, r33, r34, r35, r36, r37, r38, r39, r40,
                                    r41, r42, r43, r44, r45, r46, r47, r48, r49, r50, r51, Acceptedqty, rejectedqty, receivedqty);
                           // ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "showSweetAlert('Success', 'The record has been saved successfully.', 'Assets/like.gif');", true);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert", "showSweetAlert('Confirmation', 'The record has been saved successfully', 'success');", true);

                        }
                    }
                    else
                    {
                        string imagePath = ResolveUrl("~/Assets/thumb-down.png");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", $"showSweetAlert('Oops', 'Entry without Accepted quantity', 'error');", true);

                    }


                }
 
               
            }
            
            catch (SqlException ex)
            {
                System.Diagnostics.Debug.WriteLine("exception formui"+ex.StackTrace);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert", $"showSweetAlert('Oops', 'An error occurred: {ex.Message}', 'error');", true);
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert", $"showSweetAlert('Oops', 'An error occurred: {ex.Message}', 'error');", true);
            }

            // Clear all TextBox values
            acptqty.Text = "";
            R1.Text = "";
            R2.Text = "";
            R3.Text = "";
            R4.Text = "";
            R5.Text = "";
            R6.Text = "";
            R7.Text = "";
            R8.Text = "";
            R9.Text = "";
            R10.Text = "";
            R11.Text = "";
            R12.Text = "";
            R13.Text = "";
            R14.Text = "";
            R15.Text = "";
            R16.Text = "";
            R17.Text = "";
            R18.Text = "";
            R19.Text = "";
            R20.Text = "";
            R21.Text = "";
            R22.Text = "";
            R23.Text = "";
            R24.Text = "";
            R25.Text = "";
            R26.Text = "";
            R27.Text = "";
            R28.Text = "";
            R29.Text = "";
            R30.Text = "";
            R31.Text = "";
            R32.Text = "";
            R33.Text = "";
            R34.Text = "";
            R35.Text = "";
            R36.Text = "";
            R37.Text = "";
            R38.Text = "";
            R39.Text = "";
            R40.Text = "";
            R41.Text = "";
            R42.Text = "";
            R43.Text = "";
            R44.Text = "";
            R45.Text = "";
            R46.Text = "";
            R47.Text = "";
            R48.Text = "";
            R49.Text = "";
            R50.Text = "";
            R51.Text = "";
        }
    }
}