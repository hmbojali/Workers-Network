<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucCustomer.ascx.cs" Inherits="UserControls_wucCustomer" %>
<%@ Register Src="~/UserControls/wucCustomerOrdersList.ascx" TagPrefix="MyUserControls" TagName="wucCustomerOrdersList" %>


<asp:Label ID="upper" runat="server" BackColor="#FF8800" style="position:absolute; left:0px; top:0; z-index:1" Width="100%" Height="100px" ></asp:Label>
<asp:Label ID="left" runat="server" BackColor="#FF8800" style="position:fixed; left:0;top:0; z-index:1" Width="50px" Height="100%" ></asp:Label>
<asp:Label ID="right" runat="server" BackColor="#FF8800" style="position:fixed; right:0; top:0; z-index:1" Width="50px" Height="100%" ></asp:Label>
<asp:Panel runat="server" ID="upperDiv" style="display:flex; flex-direction:column; align-items:center; height:stretch; align-self:center; margin:0px; padding:0px" DefaultButton="btnHomePage">
    <div style="display:flex; flex-direction:row; align-items:center; width:100%">
        <div style="width:39%; display:flex; flex-direction:row-reverse; align-items:center; align-self:center;">
            <div style="z-index:5; width:100%; margin-left:50px; display:flex; flex-direction:row; align-items:center; align-self:center;">
                <asp:ImageButton ID="btnSignout" runat="server" ImageUrl="~/Images/Icons/logout.png" style="z-index:3; height: 60px; width: 60px; margin-right :10px" BackColor="#FF5500" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="5px" OnClick="btnSignout_Click"/>
                <asp:ImageButton ID="btnProfileSettings" runat="server" ImageUrl="~/Images/PFPs/Profile-PNG-Clipart4.png" style="z-index:3; height: 60px; width: 60px; margin-right:10px" BackColor="#FF5500" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="5px" OnClick="btnProfileSettings_Click"/>
                <MyUserControls:wucCustomerOrdersList runat="server" id="wucCustomerOrdersList"/>
                <div style="width:100%; display:flex; flex-direction:column; align-items:center">
                    <asp:Button ID="btnGame" runat="server" Text="Have Fun!" Height="55px" Width="150px" ForeColor="#000044" Font-Bold="true" Font-Size="20px" BackColor="#0000AA" BorderColor="#000088" BorderStyle="Outset" BorderWidth="8px" OnClick="btnGame_Click"/>
                </div>

            </div>
        </div>
        <asp:ImageButton ID="btnHomePage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Icons/Logo1.png" style="z-index:2;height: 70px; width: 22%; align-self:center" BackColor="#FF5500" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="6px" Font-Bold="True" Font-Italic="True" Font-Names="Bauhaus 93" Font-Overline="False" Font-Size="20pt" Font-Underline="False" ForeColor="#333333" OnClick="btnHomePage_Click" />
        
        <asp:Panel runat="server" style="z-index:2; width:39%; height:70%; display:flex; flex-direction:row; align-items:center" DefaultButton="btnSearch">
            <asp:TextBox ID="txtbxSearchBar" runat="server" placeholder="Search Bar" style="padding:0px; z-index:2;height: 40px; width: 350px; margin-left:100px" BackColor="#FFAC51" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="3px" Font-Size="16pt" ToolTip="Enter the name of the profession that is needed to get your job done." ForeColor="Red" aria-autocomplete="list"></asp:TextBox>
            <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Images/Icons/Search-Icon.png" style="height: 40px; width: 40px; margin-left:4px" BackColor="#FF6600" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="3px" Font-Size="16pt" OnClick="SearchEvent"/>

        </asp:Panel>
    </div>
</asp:Panel>


