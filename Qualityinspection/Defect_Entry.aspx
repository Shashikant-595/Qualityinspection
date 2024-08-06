<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Defect_Entry.aspx.cs" Inherits="Qualityinspection.newentryscreen1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="Content/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>INSPECTION DEFECTS ENTRY</title>
    <link rel="icon" href="https://foreselastomech.com/wp-content/uploads/2019/03/FORES-Logo.png">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
           <script type="text/javascript">
               function showSweetAlert(title, text, ioc) {
                   Swal.fire({
                       title: title,
                       text: text,
                       icon: ioc,
                       width: 500,
                       height: 10,
                       showConfirmButton: false,
                       timer: 3000

                   });
               }
</script>

    <style>
        body {
            /*font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;*/
            overflow: hidden;
        }

        header {
            background-color: darkgray;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative; /* Added for positioning the toggle button */
        }

            header img {
                height: 50px;
                margin-left: 5px;
            }

        .header-name {
            text-align: center;
            flex-grow: 1;
            font-size: 24px;
            font-weight: bold;
        }

        /*.toggle-sidebar {
            position: absolute;
            top: 50%;
            left: 20px;
            transform: translateY(-50%);
            cursor: pointer;
            z-index: 1001;  Ensure the toggle button is above other content 
        }*/


        .icon-sidebar {
            background-color: darkgray;
            width: 36px;
            position: fixed;
            height: 100%;
            transition: width 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

            .icon-sidebar a {
                color: black;
                padding: 10px 0;
                text-align: center;
                width: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
                text-decoration: none;
            }

                .icon-sidebar a i {
                    display: block; /* Initially display only icons */
                    font-size: 20px;
                }

                .icon-sidebar a span {
                    display: none;
                    opacity: 0;
                    transition: opacity 0.3s; /* Use opacity for smooth transition */
                    /* Initially set opacity to 0 */
                }

            .icon-sidebar:hover a i {
                display: inline; /* Hide icons when hovering over the sidebar */
            }

            .icon-sidebar:hover a span {
                display: inline; /* Display span text when hovering over the sidebar */
                opacity: 1; /* Set opacity to 1 to reveal the text */
            }

            .icon-sidebar:hover {
                width: 100px;
            }

        .content {
            margin-left: 60px;
            padding: 16px;
            transition: margin-left 0.3s;
        }

        span:hover {
            animation: blink 1s infinite;
            color: #0066ff;
            text-decoration: none;
        }



        @media (max-width: 768px) {
            .icon-sidebar {
                width: 100%; /* Ensure sidebar occupies full width on smaller screens */
                height: auto;
                position: sticky;
                display: none; /* Hide initially on smaller screens */
            }

            /* .toggle-sidebar {
                display: block;
                Show the toggle button on smaller screens
            }*/
        }

        .center-button:hover {
            background-color: #e5e5e5;
        }


        .form-container {
            max-height: 450px; /* Set a specific height */
            max-width: 100%;
            overflow-x: auto;
            overflow-y: auto;
            padding: 10px;
           
        }

        .form-group {
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }

            .form-group .label {
                width: 150px;
                flex-shrink: 0;
            }
            .firstrow{
                width:50px;
            }
            .form-group .form-control {
                flex-grow: 1;
                width: 90px;
                margin-left: 5px;
            }

        .d-flex {
            display: flex;
            align-items: center;
        }

        .toggle-sidebar {
            margin-left: 80px;
        }

        .logo-with-shadow {
            filter: drop-shadow(5px 5px 10px black);
        }

        .logo-with-shadow1 {
            filter: drop-shadow(0px 0px 10px #0a0000);
        }

        .label {
            font-size: 12px;
            font-weight: bold;
        }

        .btn-scale {
            transition: transform 2s ease-out;
        }

            .btn-scale:hover {
                transform: scale(0.95);
            }

        @media (max-width: 600px) {
            .container {
                padding: 5px;
            }

            .header, .content, .footer {
                padding: 10px;
            }
        }

        /* Tablet styles */
        @media (min-width: 601px) and (max-width: 768px) {
            .container {
                padding: 10px;
            }

            .header, .content, .footer {
                padding: 15px;
            }
        }

        /* Desktop styles */
        @media (min-width: 769px) {
            .container {
                padding: 15px;
            }

            .header, .content, .footer {
                padding: 20px;
            }
        }
        .panels{
            display: inline-block;

        }
        
    </style>

</head>

<body>
    <form id="form1" runat="server">
        <header class="d-flex justify-content-between align-items-center logo-with-shadow">
            <img src="https://foreselastomech.com/wp-content/uploads/2019/03/FORES-Logo.png" alt="Logo" class="logo-with-shadow" />


            <div class="header-name">QUALITY INSPECTION DEFECTS ENTRY</div>
            <div class="d-flex align-items-center">
                <div class="toggle-sidebar" onclick="toggleSidebar()">
                    <%--  <i class="fas fa-bars"></i>--%>
                    <!-- Icon for toggle button -->
                </div>

            </div>
        </header>
          <div class="icon-sidebar label  " id="sidebar">
    <a href="Home.aspx" id="registrationLink" runat="server">
        <i class="fa-solid fa-house btn-scale logo-with-shadow1" style="color: black;"></i>
        <span>Home</span>
    </a>
    <a href="Create_Category.aspx" id="A1" runat="server">
        <i class="fa-solid fa-folder-plus btn-scale logo-with-shadow1" style="color: black;"></i>
        <span>Create Category</span>
    </a>
    <a href="create_fg.aspx" id="newVisitorLink" runat="server">
        <i class="fa-solid fa-folder-plus btn-scale logo-with-shadow1" style="color: black;"></i>
        <span>Create Fg</span>
    </a>
    <a href="Defect_Entry.aspx" id="employeeli" runat="server">
        <i class="fa-solid fa-file-lines fa-flip-horizontal logo-with-shadow1 " style="color: black;"></i>
        <span>Entry Screen</span>
    </a>
    <a href="Domestick_packing.aspx" id="A3" runat="server">
        <i class="fa-solid fa-boxes-packing fa-flip-horizontal logo-with-shadow1 " style="color: black;"></i>
        
        <span>Domestic Label</span>
    </a>
    <a href="Exportpacking.aspx" id="A4" runat="server">
        <i class="fa-solid fa-boxes-packing fa-flip-horizontal logo-with-shadow1 " style="color: black;"></i>
        <span>Export Lable</span>
    </a>
    <a href="Reports.aspx" id="employeelink" runat="server">
        <i class="fa-solid fa-book logo-with-shadow1" style="color: black;"></i>
        <span>Reports</span>
    </a>
    <a href="Reports.aspx" id="A2" runat="server">
        <i class="fa-solid fa-right-from-bracket logo-with-shadow1" style="color: #ea3e3e;"></i>
        <span>Logout</span>
    </a>
</div>
     <div style="margin-left: 100px; font-size: 20px; border-radius: 20px;" class="form-control">
    <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-12">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control">
                <asp:ListItem>Select partno</asp:ListItem>
              
            </asp:DropDownList>
        </div>
        <div class="col-lg-1 col-md-1 col-sm-12">
            <asp:Label ID="Label53" runat="server" Text='Accepted' CssClass="label"></asp:Label>
        </div>
        <div class="col-lg-2 col-md-2 col-sm-12 ml-2">
            <asp:TextBox ID="acptqty" runat="server" CssClass="form-control" placeholder="Quantity" type="text" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
        </div>
        <div class="col-lg-1 col-md-1 col-sm-12">
            <asp:Label ID="lblrej" runat="server" Text='Rejected' CssClass="label"></asp:Label>
        </div>
        <div class="col-lg-2 col-md-2 col-sm-12 ml-2">
            <asp:TextBox ID="rejqt" runat="server" CssClass="form-control" placeholder="Quantity" type="text" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
        </div>
        <div class="col-lg-1 col-md-1 col-sm-12">
            <asp:Label ID="Label52" runat="server" Text='Received' CssClass="label"></asp:Label>
        </div>
        <div class="col-lg-2 col-md-2 col-sm-12 ml-2">
            <asp:TextBox ID="resqty" runat="server" CssClass="form-control" placeholder="Quantity" type="text" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
        </div>
    </div>
</div>

<div class="form-container jumbotron label" style="margin-left: 120px;">
    <%--1111111--%>
  
        <asp:Panel ID="panel1" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label" runat="server" Text="AIRTRAP" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R1" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
        <asp:Panel ID="panel2" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="CRACK" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R2" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
        <asp:Panel ID="panel3" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Bonding" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R3" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
        <asp:Panel ID="panel4" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="Undercure" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R4" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
   
    <%--222222222--%>
    
        <asp:Panel ID="panel5" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="DIRT" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R5" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
        <asp:Panel ID="panel6" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="Excess Deflashing" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R6" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
        <asp:Panel ID="panel7" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label6" runat="server" Text="Flow" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R7" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
        <asp:Panel ID="panel8" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label7" runat="server" Text="Setting" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R8" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
   <%--333333 ---%>

            <asp:Panel ID="panel9" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label8" runat="server" Text="Short Moulding" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R9" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
        <asp:Panel ID="panel10" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label9" runat="server" Text="Contamination" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R10" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
        <asp:Panel ID="panel11" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label10" runat="server" Text="Shifting" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R11" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
        <asp:Panel ID="panel12" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label11" runat="server" Text="Damage  Mark" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R12" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
   
    <%--444444444--%>
    
        <asp:Panel ID="panel13" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label12" runat="server" Text="Edge Open" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R13" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
        <asp:Panel ID="panel14" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label13" runat="server" Text="Runner Cut" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R14" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
        <asp:Panel ID="panel15" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label14" runat="server" Text="joint open" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R15" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>
        <asp:Panel ID="panel16" runat="server" CssClass=" panels ">
            <div class="form-group">
                <asp:Label ID="Label15" runat="server" Text="Scorch" CssClass="label small-label"></asp:Label>
                <asp:TextBox ID="R16" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
            </div>
        </asp:Panel>

     <%--55555555--%>
       <asp:Panel ID="panel17" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label16" runat="server" Text="Layer Sepration" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R17" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel18" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label17" runat="server" Text="Leg cut" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R18" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel19" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label18" runat="server" Text="Cutmark" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R19" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel20" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label19" runat="server" Text="Deshape" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R20" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>

     <%--66666666666--%>

       <asp:Panel ID="panel21" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label20" runat="server" Text="Id ( Go Not Pass )" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R21" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel22" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label21" runat="server" Text="Id ( Nogo  Pass )" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R22" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel23" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label22" runat="server" Text="Height Oversize" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R23" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel24" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label23" runat="server" Text="Height /Undersize" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R24" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>


     <%--77777777--%>



       <asp:Panel ID="panel25" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label24" runat="server" Text="Chamfer" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R25" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel26" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label25" runat="server" Text="Cutmark" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R26" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel27" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label26" runat="server" Text="Lip Crack" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R27" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel28" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label27" runat="server" Text="Lip Flow" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R28" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>

     <%--8888888888--%>



       <asp:Panel ID="panel29" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label28" runat="server" Text="Lip Undercure" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R29" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel30" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label29" runat="server" Text="Plating" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R30" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel31" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label30" runat="server" Text="White Blooomin" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R31" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel32" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label31" runat="server" Text="Hole Block" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R32" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>


     <%--9999999--%>



       <asp:Panel ID="panel33" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label32" runat="server" Text="Bend" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R33" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel34" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label33" runat="server" Text="Lugcut" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R34" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel35" runat="server" CssClass=" panels">
       <div class="form-group">
           <asp:Label ID="Label34" runat="server" Text="Insert Open" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R35" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel36" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label35" runat="server" Text="Other/Cd Rej" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R36" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>


     <%--1000000000--%>



       <asp:Panel ID="panel37" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label36" runat="server" Text="I D Damege" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R37" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel38" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label37" runat="server" Text="Step Line" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R38" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel39" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label38" runat="server" Text="Wrong Inner Use/Outer" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R39" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel40" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label39" runat="server" Text="Rusty" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R40" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>



     <%--1100000000--%>


       <asp:Panel ID="panel41" runat="server" CssClass=" panels">
       <div class="form-group">
           <asp:Label ID="Label40" runat="server" Text="Chemlock" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R41" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel42" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label41" runat="server" Text="Without Insert" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R42" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel43" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label42" runat="server" Text="Without Number" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R43" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel44" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label43" runat="server" Text="Outer/Insert Crack" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R44" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>



     <%--120000000--%>


       <asp:Panel ID="panel45" runat="server" CssClass=" panels">
       <div class="form-group">
           <asp:Label ID="Label44" runat="server" Text="Double No." CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R45" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel46" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label45" runat="server" Text="Electrical Conductivity" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R46" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel47" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label46" runat="server" Text="Dust" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R47" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel48" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label47" runat="server" Text="Without Calender Mark" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R48" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>


     <%--130000000000--%>


       <asp:Panel ID="panel49" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label48" runat="server" Text="Thrading" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R49" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel50" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label49" runat="server" Text="Runner Cut" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R50" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
   <asp:Panel ID="panel51" runat="server" CssClass=" panels ">
       <div class="form-group">
           <asp:Label ID="Label50" runat="server" Text="Rework Not Good" CssClass="label small-label"></asp:Label>
           <asp:TextBox ID="R51" runat="server" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
       </div>
   </asp:Panel>
    <asp:Panel ID ="btnsave" runat="server">
           <div class="d-flex justify-content-end" style="margin-bottom: 50px;">
       <asp:Button ID="SubmitButton" runat="server" Text="SAVE" CssClass="btn btn-success btn-scale" Style="width: 150px;" AutoPostBack="true" OnClick="SubmitButton_Click" />
   </div>

    </asp:Panel>

    </div>
        </form>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="Scripts/jquery-1.7.min.js"></script>
  <script src="Scripts/select2.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>

  <script type="text/javascript">
      $(document).ready(function () {
          $('#<%= DropDownList1.ClientID %>').select2({
              placeholder: 'partno...',

          });
      });

      function toggleSidebar() {
          var sidebar = document.getElementById('sidebar');
          sidebar.classList.toggle('open');
      }

      function allowOnlyNumbers(event) {
          var charCode = event.which ? event.which : event.keyCode;
          var input = event.target;
          var currentValue = input.value;

          // Allow only number keys and prevent input if length is 5
          if ((charCode >= 48 && charCode <= 57) && currentValue.length < 6) {
              return true;
          } else {
              event.preventDefault();
              return false;
          }
      }
      $(document).ready(function () {
          $('#btnsave').click(function () {
              $(this).addClass('btn-scale');
              setTimeout(function () {
                  $('#btnsave').removeClass('btn-scale');
              }, 200); // Adjust the duration to match your CSS transition duration
          });
      });

  </script>
</body>
</html>
