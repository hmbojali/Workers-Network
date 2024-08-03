<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucWorkerOrderList.ascx.cs" Inherits="UserControls_wucWorkerOrderList" %>
<%@ Register Src="~/UserControls/wucWorkerOrderListItem.ascx" TagPrefix="MyUserControls" TagName="wucWorkerOrderListItem" %>

<div style="display:flex; flex-direction:column; align-items:start; z-index:3;">
    <MyUserControls:wucWorkerOrderListItem runat="server" ID="temp" Visible="false"/>
    <asp:ImageButton ID="btnDropOrderList" runat="server" ImageUrl="~/Images/Icons/OrdersIcon.png" ImageAlign="Middle" style="align-self:end; height:60px; width:60px"  BackColor="#FF5500" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="5px" OnClientClick="ShowList(); return false;"/>
    <div style="display:flex; flex-direction:column; align-items:start">
        <div id="List" runat="server" class="List" style="display:none; flex-direction:column; align-items:center; background-color:#CC1100; width:470px; border-block-color:black; border-style:solid; border-width:1px; position:absolute;">

        </div>
    </div>
</div>
<script>
    document.onload =
        function () {
            ShowList();
            ShowList();
        }
    var Shown = false;
    function ShowList() {
        if (Shown) {
            document.getElementsByClassName("List")[0].style.display = "none";
        }
        else {
            document.getElementsByClassName("List")[0].style.display = "flex";
        }
        Shown = !Shown;

    }
</script>