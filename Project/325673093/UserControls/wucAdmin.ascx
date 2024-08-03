<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucAdmin.ascx.cs" Inherits="UserControls_wucAdmin" %>
 <style>
        .MenuImageStyle {} /*Style code for each menu item goes here. */
.MenuImageStyle img
{
  width: 50px;
  height: 50px;
}
    </style>
<asp:Label ID="upper" runat="server" BackColor="#FF8800" style="position:absolute; left:0px; top:0; z-index:1" Width="100%" Height="100px" ></asp:Label>
<asp:Label ID="left" runat="server" BackColor="#FF8800" style="position:fixed; left:0;top:0; z-index:1" Width="50px" Height="100%" ></asp:Label>
<asp:Label ID="right" runat="server" BackColor="#FF8800" style="position:fixed; right:0; top:0; z-index:1" Width="50px" Height="100%" ></asp:Label>
<asp:Panel runat="server" ID="upperDiv" style="display:flex; flex-direction:column; align-items:center; height:stretch; align-self:center; margin:0px; padding:0px" DefaultButton="btnHomePage">
    <div style="display:flex; flex-direction:row; align-items:center; width:100%">
        <div style="width:39%; display:flex; flex-direction:row-reverse; align-items:center; align-self:center;">
            <div style="z-index:5; width:100%; margin-left:50px; display:flex; flex-direction:row; align-items:center; align-self:center;">
                <asp:ImageButton ID="btnSignout" runat="server" ImageUrl="~/Images/Icons/logout.png" style="z-index:3; height: 60px; width: 60px; margin-right :10px" BackColor="#FF5500" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="5px" OnClick="btnSignout_Click"/>
                <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" StaticSubMenuIndent="" style="margin-left: 5px">
                <Items>
                    <asp:MenuItem ImageUrl="~/Images/Icons/AddDel.png">
                        <asp:MenuItem Text="Admins" Value="Admins">
                            <asp:MenuItem Text="Add" Value="Add" NavigateUrl="~/PagesForAdmin/wfAddAdmin.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Update/Remove" Value="Update/Remove" NavigateUrl="~/PagesForAdmin/wfUpdDelAdmin.aspx"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="Workers" Value="Workers">
                            <asp:MenuItem Text="Add" Value="Add" NavigateUrl="~/PagesForAdmin/wfAddWorker.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Update/Remove" Value="Update/Remove" NavigateUrl="~/PagesForAdmin/wfUpdDelWorker.aspx"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="Customers" Value="Customers">
                            <asp:MenuItem Text="Update/Remove" Value="Update/Remove" NavigateUrl="~/PagesForAdmin/wfUpdDelCustomer.aspx"></asp:MenuItem>
                        </asp:MenuItem>
                    </asp:MenuItem>
                </Items>
                <StaticMenuItemStyle CssClass="MenuImageStyle" Width="50px" BackColor="#FF5500" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="5px"/>
                <DynamicMenuItemStyle BackColor="#EE5500" BorderColor="#FF6600" BorderStyle="Solid" BorderWidth="1px"/>
            </asp:Menu>
            </div>
        </div>
        <asp:ImageButton ID="btnHomePage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Icons/Logo1.png" style="z-index:2;height: 70px; width: 22%; align-self:center" BackColor="#FF5500" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="6px" Font-Bold="True" Font-Italic="True" Font-Names="Bauhaus 93" Font-Overline="False" Font-Size="20pt" Font-Underline="False" ForeColor="#333333" OnClick="btnHomePage_Click" />
        
        <div style="z-index:2; width:39%; height:70%; display:flex; flex-direction:row; align-items:center">
        </div>
    </div>
</asp:Panel>


