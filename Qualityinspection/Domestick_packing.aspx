<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Domestick_packing.aspx.cs" Inherits="Qualityinspection.WebForm1" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%-- <link rel="stylesheet" href= "https://cdn.jsdelivr.net/npm/bulma@1.0.1/css/bulma.min.css">--%>
    <link href="Content/css/select2.min.css" rel="stylesheet" />
    <title>Domastic print</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.qrcode/1.0/jquery.qrcode.min.js"></script>
    <link rel="icon" href="https://foreselastomech.com/wp-content/uploads/2019/03/FORES-Logo.png">
    <script type="text/javascript">


       

        function generateQRCode(text, inspector, supervisor, sapCode, sapcode1) {

            var qrParts = text.split('/');
            var batch = qrParts[1];
            var Quantity = qrParts[4];
            var qrDiv = document.createElement('div');
            qrDiv.className = 'sticker';

            var header = document.createElement('div');
            header.innerText = "FORES ELASTOMECH INDIA PVT LTD";
            header.style.fontWeight = 'bold';
            header.style.whiteSpace = 'nowrap';
            qrDiv.appendChild(header);


            var revNoDate = document.createElement('div');
            revNoDate.innerText = "Rev No/Date:0101.04.07";
            qrDiv.appendChild(revNoDate);


            var matDesc = document.createElement('div');
            matDesc.innerText = "Mat.Desc: " + sapcode1;

            qrDiv.appendChild(matDesc);

            var partNo = document.createElement('div');
            partNo.innerText = "Batch No: " + batch;
            qrDiv.appendChild(partNo);

            var date = document.createElement('div');
            date.innerText = "Batch Date:" + new Date().toLocaleDateString();
            qrDiv.appendChild(date);

            var qty = document.createElement('div');
            qty.innerText = "Packed Qty:" + Quantity;
            qrDiv.appendChild(qty);

            var inspectedBy = document.createElement('div');
            inspectedBy.innerText = "Inspected By:" + inspector;
            qrDiv.appendChild(inspectedBy);

            var qtyVerifiedBy = document.createElement('div');
            qtyVerifiedBy.innerText = "Varified by " + supervisor;
            qrDiv.appendChild(qtyVerifiedBy);



            var qrCodeContainer = document.createElement('div');
            qrCodeContainer.className = 'qrcode';
            qrCodeContainer.setAttribute('data-text', text);
            qrCodeContainer.style.float = 'right';
            qrCodeContainer.style.marginLeft = '0px';
            qrCodeContainer.style.marginTop = '-90px';
            $(qrCodeContainer).qrcode({
                text: text,
                width: 80,
                height: 80
            });
            qrDiv.appendChild(qrCodeContainer);


            document.getElementById('qrcodes').appendChild(qrDiv);

        }

        function printStickers1() {
            var qrcodesContainer = document.getElementById("qrcodes");
            var stickersData = [];

            var stickers = qrcodesContainer.getElementsByClassName('sticker');
            for (var i = 0; i < stickers.length; i++) {
                var sticker = stickers[i];
                var qrData = sticker.getElementsByClassName('qrcode')[0].getAttribute('data-text');
                var textData = sticker.cloneNode(true);
                textData.removeChild(textData.getElementsByClassName('qrcode')[0]);
                stickersData.push({ qrData: qrData, textData: textData.innerHTML });
            }

            var printWindow = window.open('', '', 'height=600,width=800');

            printWindow.document.write('<html><head><title>Print QR Codes</title>');
            printWindow.document.write('<style>');
            printWindow.document.write('.sticker { margin-left: 40px; width: 99mm; height: 50mm; font-family: Arial , sans-serif; display: flex; justify-content: space-between; align-items: center; padding: 6px; box-sizing: border-box; }');
            printWindow.document.write('.text-container { display: flex; flex-direction: column; }');
            printWindow.document.write('.qrcode {maring-left:30px;margin-right: 30px; margin-top: 45px; width: 80px; height: 80px; }');
            printWindow.document.write('body { margin: 0; }');
            printWindow.document.write('</style>');
            printWindow.document.write('</head><body>');

            for (var i = 0; i < stickersData.length; i++) {
                var stickerData = stickersData[i];
                printWindow.document.write('<div class="sticker"><div class="text-container">' + stickerData.textData + '</div><div class="qrcode" data-text="' + stickerData.qrData + '"></div></div>');
            }

            printWindow.document.write('<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"><\/script>');
            printWindow.document.write('<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.qrcode/1.0/jquery.qrcode.min.js"><\/script>');
            printWindow.document.write('<script>');
            printWindow.document.write('$(document).ready(function() {');
            printWindow.document.write('$(".qrcode").each(function() {');
            printWindow.document.write('var text = $(this).attr("data-text");');
            printWindow.document.write('$(this).empty().qrcode({ text: text, width: 80, height: 80 });');
            printWindow.document.write('});');
            printWindow.document.write('setTimeout(function() { window.print(); window.close(); }, 500);');
            printWindow.document.write('});');
            printWindow.document.write('<\/script>');

            printWindow.document.write('</body></html>');

            printWindow.document.close();
        }

    </script>
    <style>
        body {
            /*font-family: 'Poppins', sans-serif;*/
            /*   margin: 0;
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
            padding: 10px;
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



        /* @keyframes blink {
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
                width: 200px;
                flex-shrink: 0;
            }

            .form-group .form-control {
                flex-grow: 1;
                width: 150px;
                margin-left: 10px;
            }

        .d-flex {
            display: flex;
            align-items: center;
        }

        .toggle-sidebar {
            margin-left: 80px;
        }
        /* Add this CSS to your stylesheet */
        .checkbox-large {
            transform: scale(2); /* Adjust the scale as needed */
            margin-right: 30px; /* Adjust the margin as needed */
        }

        .label {
            font-size: 12px; /* Adjust the font size as needed */
            color: #333; /* Text color */
            padding-left: 0px; /* Space between checkbox and label */
            vertical-align: middle; /* Align label with checkbox */
            cursor: pointer; /* Change cursor on hover */
        }

        /*.drop {
     width: 14%;*/ /* Full width of the parent container */
        /*height: 30px;*/ /* Adjust the height as needed */
        /*font-size: 18px;*/ /* Adjust the font size as needed */
        /*padding: 2px;*/ /* Padding inside the dropdown for better appearance */
        /*border-radius: 4px;*/ /* Rounded corners */
        /*border: 2px solid #ccc;*/ /* Border color */
        /*background-color: #fff;*/ /* Background color */
        /*box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);*/ /* Subtle shadow for depth */
        /*transition: all 0.3s ease;*/ /* Smooth transition for effects */
        /*}*/

        .logo-with-shadow {
            filter: drop-shadow(5px 5px 10px black);
        }

        .logo-with-shadow1 {
            filter: drop-shadow(0px 0px 10px #0a0000);
        }

        .logout-btn {
            margin-top: 900px;
            background-color: red;
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

        .qrcode {
            width: 80px;
            height: 80px;
            margin: 10px;
            float: right;
        }
        /*.sticker {
    border: 1px solid black;
    padding: 5px;*/
        /* width: 300px;
    height: auto; */
        /*width: 944px;
    height: 590px;
    margin: 10px;
    font-family: Arial, sans-serif;
}*/

        .sticker div {
            margin-bottom: 5px;
            margin-left: 30px;
        }

        .sticker .qrcode {
            /*  float: right;*/
            margin-left: 10px;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <header class="d-flex justify-content-between align-items-center logo-with-shadow">
            <img src="https://foreselastomech.com/wp-content/uploads/2019/03/FORES-Logo.png" alt="Logo" class="logo-with-shadow" />
            <div class="header-name">Domestic packing</div>
            <div class="d-flex align-items-center">
                <div class="toggle-sidebar" onclick="toggleSidebar()">
                    <i class="fas fa-bars"></i>
                    <!-- Icon for toggle button -->
                </div>
                <asp:HiddenField ID="hdnSaveResponse" runat="server" />
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
        <div class=" container col-md-3">
            <label for="sapCode" cssclass="label small-label ">Part NO:</label>
            <asp:DropDownList ID="ddlSapCode" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSapCode_SelectedIndexChanged">
                <asp:ListItem>TRIPOT_38017485</asp:ListItem>
                <asp:ListItem>TRIPOT_38234730</asp:ListItem>
                <asp:ListItem>TRIPOT_26138127</asp:ListItem>

            </asp:DropDownList>
            <br />
            <label for="sapCode" cssclass="label small-label ">Inspector:</label>
            <asp:DropDownList ID="ddlinspector" CssClass="form-control" runat="server">
                <asp:ListItem>Priyanka </asp:ListItem>
                <asp:ListItem>Julekha</asp:ListItem>
                <asp:ListItem>Nanda </asp:ListItem>
                <asp:ListItem>Tara </asp:ListItem>

            </asp:DropDownList>
            <br />
            <label for="sapCode" cssclass="label small-label ">Suppervisor:</label>
            <asp:DropDownList ID="ddlsupperwiser" CssClass="form-control" runat="server">
                <asp:ListItem>Ramesh </asp:ListItem>
                <asp:ListItem>Suresh</asp:ListItem>


            </asp:DropDownList>
            <br />

            <label for="totalQuantity" cssclass="label small-label">Domatic Quantity:</label>
            <asp:TextBox ID="txtTotalQuantity" CssClass="form-control" onkeypress="return disableEnterKey(event)" runat="server"></asp:TextBox>
            <br />

            <label for="stickerQuantity" cssclass="label small-label ">Label Quantity:</label>
            <asp:TextBox ID="txtStickerQuantity" CssClass="form-control" onkeypress="return disableEnterKey(event)" runat="server"></asp:TextBox>
            <br />
            <asp:Button class="button is-primary is-outlined" ID="btnGenerate" runat="server" Text="Generate QR Codes" OnClick="btnGenerate_Click" />
            <asp:Button class="button is-primary is-outlined" ID="printStickers" runat="server" Text="Print Stickers" OnClientClick="printStickers1()" />
        </div>

        <div class="container">

            <div id="qrcodes"></div>

        </div>

    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="Scripts/jquery-1.7.min.js"></script>
    <script src="Scripts/select2.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script>
        function toggleSidebar() {
            var sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('open');
        }
        $(document).ready(function () {
            $('#<%= ddlSapCode.ClientID %>').select2({
                placeholder: 'partno...',

            });
        });

        function disableEnterKey(e) {
            var key;
            if (window.event) {
                key = window.event.keyCode; // IE
            } else {
                key = e.which; // Firefox
            }
            return (key != 13);
        }

    </script>
</body>
</html>
