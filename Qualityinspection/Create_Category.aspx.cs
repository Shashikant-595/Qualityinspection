using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Businesslogic;

namespace Qualityinspection
{
    public partial class Create_Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnsave.Visible = false;
            SubmitButton.Visible = true;

            
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string category = DropDownList1.SelectedItem.ToString();
            bool r1 = R1.Checked;
            bool r2 = R2.Checked;
            bool r3 = R3.Checked;
            bool r4 = R4.Checked;
            bool r5 = R5.Checked;
            bool r6 = R6.Checked;
            bool r7 = R7.Checked;
            bool r8 = R8.Checked;
            bool r9 = R9.Checked;
            bool r10 = R10.Checked;
            bool r11 = R11.Checked;
            bool r12 = R12.Checked;
            bool r13 = R13.Checked;
            bool r14 = R14.Checked;
            bool r15 = R15.Checked;
            bool r16 = R16.Checked;
            bool r17 = R17.Checked;
            bool r18 = R18.Checked;
            bool r19 = R19.Checked;
            bool r20 = R20.Checked;
            bool r21 = R21.Checked;
            bool r22 = R22.Checked;
            bool r23 = R23.Checked;
            bool r24 = R24.Checked;
            bool r25 = R25.Checked;
            bool r26 = R26.Checked;
            bool r27 = R27.Checked;
            bool r28 = R28.Checked;
            bool r29 = R29.Checked;
            bool r30 = R30.Checked;
            bool r31 = R31.Checked;
            bool r32 = R32.Checked;
            bool r33 = R33.Checked;
            bool r34 = R34.Checked;
            bool r35 = R35.Checked;
            bool r36 = R36.Checked;
            bool r37 = R37.Checked;
            bool r38 = R38.Checked;
            bool r39 = R39.Checked;
            bool r40 = R40.Checked;
            bool r41 = R41.Checked;
            bool r42 = R42.Checked;
            bool r43 = R43.Checked;
            bool r44 = R44.Checked;
            bool r45 = R45.Checked;
            bool r46 = R46.Checked;
            bool r47 = R47.Checked;
            bool r48 = R48.Checked;
            bool r49 = R49.Checked;
            bool r50 = R50.Checked;
            bool r51 = R51.Checked;

            try
            {
                updateCategory(category, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28, r29, r30, r31, r32, r33, r34, r35, r36, r37, r38, r39, r40, r41, r42, r43, r44, r45, r46, r47, r48, r49, r50, r51);
              //  ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "showSweetAlert('Success', 'Category updated ', 'success')", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "showSweetAlert('Good','Category updated sucessfully','success')", true);
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert","showSweetAlert('Oops','i got an error','Error')", true);
            }
           
        }

        public static void updateCategory(string category, bool R1, bool R2, bool R3, bool R4, bool R5, bool R6, bool R7, bool R8, bool R9, bool R10, bool R11, bool R12, bool R13, bool R14, bool R15, bool R16, bool R17, bool R18, bool R19, bool R20, bool R21, bool R22, bool R23, bool R24, bool R25, bool R26, bool R27, bool R28, bool R29, bool R30, bool R31, bool R32, bool R33, bool R34, bool R35, bool R36, bool R37, bool R38, bool R39, bool R40, bool R41, bool R42,bool R43,bool R44,bool R45,bool R46,bool R47,bool R48,bool R49,bool R50,bool R51)
        {
            saveUpdatedb.updateCategory(category, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31, R32, R33, R34, R35, R36, R37, R38, R39, R40, R41, R42, R43, R44, R45, R46, R47, R48, R49, R50, R51);

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnsave.Visible = false;
            SubmitButton.Visible = true;
            string category = DropDownList1.SelectedItem.ToString().Trim();

            List<string> checkedNames = saveUpdatedb.PassUpdateToUI(category);
            System.Diagnostics.Debug.WriteLine("id no is =" + category);
            System.Diagnostics.Debug.WriteLine("id no is =" + checkedNames.Count);
            // Assuming checkbox IDs follow the pattern R1, R2, R3, ..., R42
            for (int i = 1; i <= 52; i++)
            {
                string checkboxId = "R" + i;
                CheckBox checkbox = FindControl(checkboxId) as CheckBox;

                if (checkbox != null)
                {
                    // Check if the checkbox's ID is in the list of checked names
                    if (checkedNames.Contains(checkbox.ID))
                    {
                        System.Diagnostics.Debug.WriteLine("id is" + checkbox);
                        checkbox.Checked = true;
                    }
                    else
                    {
                        checkbox.Checked = false;
                    }
                }
            }

        }
       
    }
}