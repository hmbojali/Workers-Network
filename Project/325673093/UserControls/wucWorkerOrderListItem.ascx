<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucWorkerOrderListItem.ascx.cs" Inherits="wucWorkerOrderListItem" %>
<div style="background-color:#FF6600; border-color:#FF6600; border-style:outset; border-width:6px; width:450px; margin-top:5px">
    <div style="display:flex; flex-direction:column; align-items:start; padding:10px 10px 10px 10px; width:95%; height:95%; direction: ltr;">
        <div style="display:flex; flex-direction:row; align-items:center; width:100%">
            <div style="display:flex; flex-direction:row; align-items:center; width:100%">
                <asp:Label ID="lblTitle" runat="server" Text="Title" Font-Bold="True" Font-Size="40px"></asp:Label>
                <asp:Label ID="lblStatus" runat="server" CssClass="Status" Text="Pending" style="align-self:end; padding:0 0 6px 10px"></asp:Label>
            </div>
            <asp:Button ID="btnDeny" runat="server" CssClass="AcceptDeny" Text="Deny" style="text-align:center; height:25px; width:90px" ForeColor="#880000" BackColor="#EE0000" BorderColor="#EE0000" BorderStyle="Outset" BorderWidth="4px" OnClick="btnDeny_Click"/>
            <asp:Button ID="btnAccept" runat="server" CssClass="AcceptDeny" Text="Accept" style="text-align:center; height:25px; width:90px" ForeColor="#004400"  BackColor="#099000" BorderColor="#099000" BorderStyle="Outset" BorderWidth="4px" OnClick="btnAccept_Click"/>
           
            <asp:Button ID="btnFinish" runat="server" CssClass="Finish" Text="Finish" style="text-align:center; height:25px; width:90px" ForeColor="#004400"  BackColor="#099000" BorderColor="#099000" BorderStyle="Outset" BorderWidth="4px" OnClick="btnFinish_Click"/>
            <asp:ImageButton ID="btnCancel" runat="server" CssClass="ConfirmCancel" ImageUrl="~/Images/Icons/XCancel.png" style="display:none; height: 25px; width: 25px; margin-right:15px" BackColor="#DD0000" BorderColor="#DD0000" BorderStyle="Outset" BorderWidth="5px" OnClick="btnCancel_Click" />
            <asp:ImageButton ID="btnConfirm" runat="server" CssClass="ConfirmCancel" ImageUrl="~/Images/Icons/VConfirm.png" style="display:none; height: 25px; width: 25px;" BackColor="#099000" BorderColor="#099000" BorderStyle="Outset" BorderWidth="5px" OnClick="btnConfirm_Click"/>

        </div>
        <asp:Label ID="lblDescription" runat="server" Text="Description" Font-Size="18px"></asp:Label>
        <div style="display:flex; flex-direction:row; align-items:center; width:100%; margin:10px 0 0 0">
            <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name" style="padding:0 20px 0 0" Font-Bold="true" Font-Size="18px"></asp:Label>
            <asp:Label ID="lblCustomerPhoneNumber" runat="server" Text="Customer Phone-Number" Font-Bold="true" Font-Size="18px"></asp:Label>
        </div>
        <asp:Label ID="lblAddressDescription" runat="server" Text="Address Description" style=" margin:0 0 10px 0" Font-Bold="false" Font-Size="18px"></asp:Label>
        <asp:Label ID="lblOrderDate" runat="server" Text="Ordered on " style="" Font-Size="18px"></asp:Label>
    </div>
</div>
<script>
    function Accept() {
        document.getElementsByClassName("Status")[0].textContent = "Accepted";
        document.getElementsByClassName("AcceptDeny")[0].style.display = "none";
        document.getElementsByClassName("AcceptDeny")[1].style.display = "none";
        document.getElementsByClassName("ConfirmCancel")[0].style.display = "block";
        document.getElementsByClassName("ConfirmCancel")[1].style.display = "block";
    }
    function Deny() {
        document.getElementsByClassName("Status")[0].textContent = "Denied";
        document.getElementsByClassName("AcceptDeny")[0].style.display = "none";
        document.getElementsByClassName("AcceptDeny")[1].style.display = "none";
        document.getElementsByClassName("ConfirmCancel")[0].style.display = "block";
        document.getElementsByClassName("ConfirmCancel")[1].style.display = "block";
    }
    function Cancel() {
        if (document.getElementsByClassName("Status")[0].textContent == "Denied" || document.getElementsByClassName("Status")[0].textContent == "Accepted") {
            document.getElementsByClassName("AcceptDeny")[0].style.display = "block";
            document.getElementsByClassName("AcceptDeny")[1].style.display = "block";
            document.getElementsByClassName("ConfirmCancel")[0].style.display = "none";
            document.getElementsByClassName("ConfirmCancel")[1].style.display = "none";
            document.getElementsByClassName("Status")[0].textContent = "Pending";
        }
        else if (document.getElementsByClassName("Status")[0].textContent == "Finished") {
            document.getElementsByClassName("Finish")[0].style.display = "block";
            document.getElementsByClassName("ConfirmCancel")[0].style.display = "none";
            document.getElementsByClassName("ConfirmCancel")[1].style.display = "none";
            document.getElementsByClassName("Status")[0].textContent = "Accepted";
        }
    }


    function Confirmed() {
        document.getElementsByClassName("AcceptDeny")[0].style.display = "none";
        document.getElementsByClassName("AcceptDeny")[1].style.display = "none";
        document.getElementsByClassName("ConfirmCancel")[0].style.display = "none";
        document.getElementsByClassName("ConfirmCancel")[1].style.display = "none";
        document.getElementsByClassName("Finish")[0].style.display = "block";
        
    }
    function Finished() {
        document.getElementsByClassName("Status")[0].textContent = "Finished";
        document.getElementsByClassName("Finish")[0].style.display = "none";
    }
</script>