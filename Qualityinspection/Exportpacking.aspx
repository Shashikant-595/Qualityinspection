<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exportpacking.aspx.cs" Inherits="Qualityinspection.Exportpacking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <%-- <link rel="stylesheet" href= "https://cdn.jsdelivr.net/npm/bulma@1.0.1/css/bulma.min.css">--%>
    <link href="Content/css/select2.min.css" rel="stylesheet" />
    <title>Export packing</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.qrcode/1.0/jquery.qrcode.min.js"></script>
    <link rel="icon" href="https://foreselastomech.com/wp-content/uploads/2019/03/FORES-Logo.png" />
    <script type="text/javascript">
        function generateExportQRCode(text, inspector, supervisor, sapCode, sapcode1) {
            console.log("generateExportQRCode called with: ", text, inspector, supervisor, sapCode, sapcode1);
            var qrParts = text.split('/');
            var batch = qrParts[1];
            var Quantity = qrParts[2];
            var qrDiv = document.createElement('div');
            qrDiv.className = 'sticker';

            var header = document.createElement('div');
            header.innerText = "FORES ELASTOMECH INDIA PVT LTD";
            header.style.fontWeight = 'bold';
            header.style.whiteSpace = 'nowrap';  // Ensures the text stays on a single line
            qrDiv.appendChild(header);

            var revNoDate = document.createElement('div');
            revNoDate.innerText = "Rev no/Date:0101.04.07";
            qrDiv.appendChild(revNoDate);

            var matDesc = document.createElement('div');
            //  matDesc.innerText = "Mat.Desc :"+ sapcode1;
            matDesc.innerText = "Mat.Desc: " + sapcode1;

            qrDiv.appendChild(matDesc);

            var partNo = document.createElement('div');
            partNo.innerText = "Batch No: " + batch;
            qrDiv.appendChild(partNo);

            var date = document.createElement('div');
            date.innerText = "Date:" + new Date().toLocaleDateString();
            qrDiv.appendChild(date);

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

            var qty = document.createElement('div');
            qty.innerText = "Packed Qty:" + Quantity;
            qrDiv.appendChild(qty);

            var inspectedBy = document.createElement('div');
            inspectedBy.innerText = "Packed By:" + inspector;
            qrDiv.appendChild(inspectedBy);

            var qtyVerifiedBy = document.createElement('div');
            qtyVerifiedBy.innerText = "Supervisor:";
            qrDiv.appendChild(qtyVerifiedBy);

            var signatureBox = document.createElement('input');
            signatureBox.type = 'text';
            signatureBox.style.border = '1px solid black';
            signatureBox.style.width = '150px';
            signatureBox.style.height = '40px';  // Set the desired height
            signatureBox.style.marginLeft = '5px';
            qtyVerifiedBy.appendChild(signatureBox);

            // Clear existing stickers
            var qrcodesContainer = document.getElementById('qrcodes');
            qrcodesContainer.innerHTML = '';

            // Append the new sticker
            qrcodesContainer.appendChild(qrDiv);

            // Print the sticker
            printStickers1();
        }
        function printStickers1() {
            var qrcodesContainer = document.getElementById("qrcodes");
            var stickersData = [];

            var stickers = qrcodesContainer.getElementsByClassName('sticker');
            // Only process the first sticker
            if (stickers.length > 0) {
                var sticker = stickers[0];
                var qrData = sticker.getElementsByClassName('qrcode')[0].getAttribute('data-text');
                var textData = sticker.cloneNode(true);
                textData.removeChild(textData.getElementsByClassName('qrcode')[0]);
                stickersData.push({ qrData: qrData, textData: textData.innerHTML });
            }

            var printWindow = window.open('', '', 'height=600,width=800');
            printWindow.document.write('<html><head><title>Print QR Code</title>');
            printWindow.document.write('<style>');
            printWindow.document.write('.sticker { width: 100mm; height: 50mm; font-family: Arial, sans-serif; display: flex; justify-content: space-between; align-items: center; padding:5px; box-sizing: border-box; page-break-after: never; }');
            printWindow.document.write('.text-container { display: flex; flex-direction: column; margin-left: 40px; margin-top: -5px; }');
            printWindow.document.write('.qrcode { margin-top: 45px; width: 80px; height: 80px; }');
            printWindow.document.write('body { margin: 0; }');
            printWindow.document.write('</style>');
            printWindow.document.write('</head><body>');

            // Ensure only one sticker is added
            if (stickersData.length > 0) {
                var stickerData = stickersData[0];
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
        /* Your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        header {
            background-color: darkgray;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 70px;
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

        .user-id-text {
            font-size: 26px;
        }



        .logout-btn {
            margin-top: 200px;
            background-color: red;
        }


        #scanner {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .label-text {
            font-size: 20px;
            margin-right: 10px;
        }

        .qr-input {
            font-size: 20px;
            width: 50%;
        }

        .btn {
            position: absolute;
            bottom: 2%; /* Adjusted bottom value */
            left: 40%;
            transform: translateX(-50%);
            background-color: green;
            width: 110px;
            height: 40px;
            color: white;
        }

        .btn1 {
            position: absolute;
            bottom: 2%; /* Adjusted bottom value */
            left: 60%;
            transform: translateX(-50%);
            background-color:orange;
            width: 110px;
            height: 40px;
            color: white;
        }

        .quantity-section {
            display: flex;
            left: 9%;
            margin-top: 10px;
            position: absolute;
            bottom: 2%;
            margin-left: 30px;
        }

        .label {
            font-size: 12px;
            font-weight: bold;
        }

        .quantity-section1 {
            display: flex;
            position: absolute;
            bottom: 2%;
            left: 75%;
        }

        .quantity-section2 {
            display: flex;
            position: absolute;
            bottom: 2%;
            left: 35%;
        }

        .quantity-section3 {
            display: flex;
            position: absolute;
            bottom: 2%;
            left: 49%;
        }


        .quantity-label-textbox:first-child {
            margin-left: 0;
        }

        .fixed-height-gridview {
            height: calc(100vh - 200px); /* Adjust the height based on available space */
            overflow-y: auto; /* Add vertical scroll if content exceeds the height */
        }

        .grid-view-wrapper {
            overflow: hidden; /* Ensure that the container does not interfere with scrolling */
        }
    </style>
    <script type="text/javascript">
        function setFocus() {
            document.getElementById('<%= txtScanData.ClientID %>').focus();
        }

        function handleEnterKey(event) {
            if (event.keyCode === 13) { // Enter key
                __doPostBack('<%= txtScanData.UniqueID %>', '');
                return false;
            }
            return true;
        }
        window.onload = setFocus;
    </script>
</head>
<body>
    <header>
        <a>
            <img src="https://foreselastomech.com/wp-content/uploads/2019/03/FORES-Logo.png" alt="Logo" />
        </a>
        <%-- <div class="header-name">Export packing</div>

        <input type="hidden" id="userId" value="<%= Session["UserId"] %>" />
        <div class="user-id-text text-black font-weight-bold fs-5">
            User ID:
        <asp:Label ID="lbl_displayUserId" runat="server" Text='<%# Session["UserId"] %>'></asp:Label>--%>
        </div>--%>
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
    <div class="content">
        <asp:Panel ID="panel_master" runat="server" Visible="false">
        </asp:Panel>
    </div>
    <div class="container xyz">

        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <div class="container " style="margin-left: 80px;">
                <div class="row ">
                    <div class="col-md-3">
                        <label for="sapCode" cssclass="label small-label ">Packed by</label>
                        <asp:DropDownList ID="ddlinspector" CssClass="form-control" runat="server">
                            <asp:ListItem>Priyanka </asp:ListItem>
                            <asp:ListItem>Julekha</asp:ListItem>
                            <asp:ListItem>Nanda </asp:ListItem>
                            <asp:ListItem>Tara </asp:ListItem>

                        </asp:DropDownList>
                        <br />

                    </div>
                    <div class="col-md-3" style="margin-left: 450px;">

                        <label for="sapCode" cssclass="label small-label ">Qty Verified by</label>
                        <asp:DropDownList ID="ddlsupperwiser" CssClass="form-control" runat="server">
                            <asp:ListItem>Ramesh </asp:ListItem>
                            <asp:ListItem>Suresh</asp:ListItem>

                        </asp:DropDownList>
                    </div>

                </div>

            </div>
            <div class="row">

                <div class="col-md-12" style="margin-left: 90px;">
                    <div class="form-row align-content-center">
                        <div class="col-md-1">
                            <asp:Label ID="lblScanData" runat="server" AssociatedControlID="txtScanData" CssClass="form-label" Style="font-family: Arial; font-size: large; text-align: right">Scan here</asp:Label>
                            <asp:HiddenField ID="txt_Bocode" runat="server" Value="InitialValue" />
                        </div>
                        <div class="col-md-9">
                            <asp:TextBox ID="txtScanData" runat="server" CssClass="form-control" Style="font-family: Arial; font-size: large;" placeholder="" AutoPostBack="True" AutoCompleteType="Disabled" OnTextChanged="txtScanData_TextChanged"></asp:TextBox>
                        </div>

                        <div class="col-md-3">
                            <asp:Label ID="lbl_Alert" runat="server" AssociatedControlID="txtScanData" CssClass="form-label" Visible="false" Style="font-family: Arial; font-size: x-large; text-align: right" ForeColor="Red"></asp:Label>

                        </div>

                    </div>
                </div>
            </div>
            <div class="container mt-3">
                <div class="row">
                    <div class="col-md-8 mx-auto" style="height: 450px;">
                        <!-- Adjust the height as needed -->
                        <div class="overflow-auto h-50">
                            <asp:GridView ID="gvScannedData" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" >
                                <Columns>
                                    <asp:BoundField DataField="SapCode" HeaderText="BoCode" />
                                    <asp:BoundField DataField="Batch" HeaderText="Batch Code" />
                                    <asp:BoundField DataField="SKU" HeaderText="SKU" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                    <%--<asp:BoundField DataField="LotNumber" HeaderText="Lot No" />--%>
                                </Columns>
                            </asp:GridView>
                            <%-- <asp:GridView ID="GridViewDuplicateRecords" runat="server" AutoGenerateColumns="true" CssClass="table table-bordered table-striped" ForeColor="Red"></asp:GridView>--%>
                        </div>
                    </div>
                </div>
            </div>

            <asp:TextBox ID="flag" runat="server" Visible="False"></asp:TextBox>

            <asp:Button ID="BtnPrint" runat="server" Text="Print" CssClass="btn" OnClick="BtnPrint_Click1" />
            <asp:Button ID="btnrefrash" runat="server" Text="Cancel" CssClass="btn1" OnClick="btnrefrash_Click1"  />




            <div class="quantity-section">
                <div class="quantity-label-textbox">
                    <asp:Label ID="lblFixtureQuantity" runat="server" AssociatedControlID="txtFixtureQuantity" class="quantity-label" Font-Size="Large">STD Qty</asp:Label>

                    <asp:TextBox ID="txtFixtureQuantity" runat="server" class="quantity-input" Width="100" Height="25" AutoPostBack="true"></asp:TextBox>
                </div>
            </div>

            <div class="quantity-section1">
                <div class="quantity-label-textbox1">
                    <asp:Label ID="lblTotalQuantity" runat="server" AssociatedControlID="txtTotalQuantity" Font-Size="Large">Total Qty</asp:Label>
                    <asp:TextBox ID="txtTotalQuantity" runat="server" CssClass="form-control1" Width="100" Height="25" ReadOnly="True"></asp:TextBox>
                </div>
            </div>


            <div class="container">

                <div id="qrcodes"></div>

            </div>

        </form>
    </div>
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

    </script>
</body>
</html>
