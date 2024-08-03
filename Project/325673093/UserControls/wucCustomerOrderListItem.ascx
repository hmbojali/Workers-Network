<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucCustomerOrderListItem.ascx.cs" Inherits="wucCustomerOrderListItem" %>
<div style="background-color:#FF6600; border-color:#FF6600; border-style:outset; border-width:6px; width:450px; margin-top:5px">
    <div style="display:flex; flex-direction:column; align-items:start; padding:10px 10px 10px 10px; width:95%; height:95%">
        <div style="display:flex; flex-direction:row; align-items:center; width:100%">
            <div style="display:flex; flex-direction:row; align-items:center; width:100%">
                <asp:Label ID="lblTitle" runat="server" Text="Title" Font-Bold="True" Font-Size="40px"></asp:Label>
                <asp:Label ID="lblStatus" runat="server" Text="Status" style="align-self:end; padding:0 0 6px 10px"></asp:Label>
            </div>
            <asp:Button ID="btnRemoveOrder" runat="server" Text="Remove" style="text-align:center; height:25px; width:90px" ForeColor="#880000" BackColor="#EE0000" BorderColor="#EE0000" BorderStyle="Outset" BorderWidth="4px" OnClick="btnRemoveOrder_Click"/>
            <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/Images/Icons/XCancel.png" style="height: 25px; width: 25px; margin-right:15px" BackColor="#DD0000" BorderColor="#DD0000" BorderStyle="Outset" BorderWidth="5px" Visible="false" OnClick="btnCancel_Click"/>
            <asp:ImageButton ID="btnConfirm" runat="server" ImageUrl="~/Images/Icons/VConfirm.png" style="height: 25px; width: 25px;" BackColor="#099000" BorderColor="#099000" BorderStyle="Outset" BorderWidth="5px" Visible="false" OnClick="btnConfirm_Click"/>

        </div>
        <asp:Label ID="lblDescription" runat="server" Text="Description" Font-Size="18px"></asp:Label>
        <div style="display:flex; flex-direction:row; align-items:center; width:100%; padding:10px 0 10px 0">
            <asp:Label ID="lblWorkerName" runat="server" Text="Worker Name" style="padding:0 20px 0 0" Font-Bold="true" Font-Size="18px"></asp:Label>
            <asp:Label ID="lblWorkerProfession" runat="server" Text="Worker Profession" Font-Bold="true" Font-Size="18px"></asp:Label>
        </div>
        <asp:Label ID="lblOrderDate" runat="server" Text="Ordered on " style="" Font-Size="18px"></asp:Label>

    </div>
</div>

