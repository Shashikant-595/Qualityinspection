<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create_fg.aspx.cs" Inherits="Qualityinspection.Create_fg" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>CREATE FINISH GOOD</title>
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
            z-index: 1001;*/ /* Ensure the toggle button is above other content */
        /*}*/

        .icon-sidebar {
            background-color: darkgray;
            width: 28px;
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




            .toggle-sidebar {
                display: block; /* Show the toggle button on smaller screens */
            }
        }

        .center-button:hover {
            background-color: #e5e5e5;
        }

        /*@keyframes blink {
            0% {
                opacity: 1;
            }

            50% {
                opacity: 0;
            }

            100% {
                opacity: 1;
            }
        }*/

        .form-container {
            height: 550px; /* Set a specific height */
            max-width: 100%;
            overflow-x: auto;
            overflow-y: auto;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }

            .form-group .label {
                width: 200px;
                flex-shrink: 0;
            }

            .form-group .form-control {
                flex-grow: 1;
                width: 150px;
                margin-left: 10px;
            }

        .custom-width {
            width: 190px;
        }

        .d-flex {
            display: flex;
            align-items: center;
        }

        .toggle-sidebar {
            margin-left: 80px;
        }

        .drop {
            width: 100%; /* Full width of the parent container */
            height: 40px; /* Adjust the height as needed */
            font-size: 14px; /* Adjust the font size as needed */
            padding: 10px; /* Padding inside the dropdown for better appearance */
            border-radius: 4px; /* Rounded corners */
            border: 1px solid #ccc; /* Border color */
            background-color: #fff; /* Background color */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
            transition: all 0.3s ease; /* Smooth transition for effects */
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
            transition: transform 0.5s ease-out;
        }

            .btn-scale:hover {
                transform: scale(1.1);
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
    </style>
</head>

<body>
    <form id="form1" runat="server">

   
        <header class="d-flex justify-content-between align-items-center logo-with-shadow ">
            <img src="https://foreselastomech.com/wp-content/uploads/2019/03/FORES-Logo.png" alt="Logo" class="logo-with-shadow" />

            <div class="header-name  ">CREATE FINISH GOOD</div>
            <div class="d-flex align-items-center">
                <div class="toggle-sidebar" onclick="toggleSidebar()">
                    <i class="fas fa-bars"></i>
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
        <div class="container d-flex justify-content-center label" style="margin-top: 100px;">
            <div class="col-lg-8">
                <div class="row align-items-center mb-3">
                    <div class="col-sm-4 col-md-4 col-lg-4 Label">
                        <asp:Label ID="Label1" runat="server" Text="Material Sapcode"></asp:Label>
                    </div>
                    <div class="col-sm-8 col-md-8 col-lg-8">
                        <asp:TextBox ID="txtsapcode" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtsapcode_TextChanged"></asp:TextBox>
                        <asp:Label ID="lblValidationMessage" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
                <div class="row align-items-center mb-3">
                    <div class="col-sm-4 col-md-4 col-lg-4">
                        <asp:Label ID="Label2" runat="server" Text="Material Description"></asp:Label>
                    </div>
                    <div class="col-sm-8 col-md-8 col-lg-8">
                        <asp:TextBox ID="txtdesc" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row align-items-center mb-3">
                    <div class="col-sm-4 col-md-4 col-lg-4">
                        <asp:Label ID="Label3" runat="server" Text="Select Category"></asp:Label>
                    </div>
                    <div class="col-sm-8 col-md-8 col-lg-8">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control drop">
                            <asp:ListItem Text="Metal" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bare Rubber" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

            </div>
        </div>
       
                <div class="container  row align-items-center  "  margin-top: 0px;">
                    <div class="col-sm-12 d-flex justify-content-end">
                        <asp:Button ID="btnsave" runat="server" Text="SAVE" CssClass="btn btn-success col-md-3  btn-scale" AutoPostBack="true" OnClick="btnsave_Click" />
                    </div>
                </div>
          

    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function toggleSidebar() {
            var sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('open');
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
