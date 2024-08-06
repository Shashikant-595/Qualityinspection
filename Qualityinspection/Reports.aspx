<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Qualityinspection.Reports" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>ENTRY SCREEN</title>
    <link rel="icon" href="https://foreselastomech.com/wp-content/uploads/2019/03/FORES-Logo.png">
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





            /* .toggle-sidebar {
                display: block;
                Show the toggle button on smaller screens
            }*/
        }

        .center-button:hover {
            background-color: #e5e5e5;
        }





        .form-container {
            height: 500px; /* Set a specific height */
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

            .form-group .form-control {
                flex-grow: 1;
                width: 100px;
                margin-left: 10px;
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
                transform: scale(0.9);
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
        <header class="d-flex justify-content-between align-items-center logo-with-shadow">
            <img src="https://foreselastomech.com/wp-content/uploads/2019/03/FORES-Logo.png" alt="Logo" class=" " />

            <div class="header-name">REPORTS</div>
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
        <div>
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

    </script>
</body>
</html>
