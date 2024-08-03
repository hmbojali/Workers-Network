<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForAdmin/mpAdmins.master" AutoEventWireup="true" CodeFile="wfHomePageAdmin.aspx.cs" Inherits="PagesForAdmin_wfHomePageAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center; margin:30px 0 20px">
                <div style="height:100%; width:-webkit-fill-available; display:flex; flex-direction:row; align-items:center; margin:0 70px">
                    <div style="width:100%; display:flex; flex-direction:column; align-items:center; background-color:#FFBB44; padding: 40px 80px">
                        <div style="width:100%; margin-bottom:60px; display:flex;flex-direction:column; align-items:center">
                             <asp:Label ID="lblWelcome" runat="server" Text="Welcome To Workers Network" style="height: 59px; width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="35pt"></asp:Label>
                             <asp:Label ID="lblWhatToDo" runat="server" Text="In this page, you will learn what you have accessablity to as an admin, and what are the uses of them.." style="height: 25px; width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                        </div>
                        <div style="width:100%; margin-bottom:10px; display:flex;flex-direction:column; align-items:start">
                            <div style="width:100%; margin-bottom:20px; display:flex;flex-direction:row; align-items:center"> 
                                <asp:Image ID="imgSignout" runat="server" ImageUrl="~/Images/Icons/logout.png" style="z-index:3; height: 60px; width: 60px; margin-right :10px" BackColor="#FF5500" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="5px"/>
                                <ul style="list-style-position:inside; list-style-type:disc; margin:0; padding:0">
                                    <li>
                                        <asp:Label ID="lblSignout" runat="server" Text="This button alows you to sign-out as we can see." style="width: auto; " ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                </ul>
                            </div>
                            <div style="width:100%; margin-bottom:20px; display:flex;flex-direction:row; align-items:start"> 
                                <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" StaticSubMenuIndent="" style="margin-right:10px">
                                    <Items>
                                        <asp:MenuItem ImageUrl="~/Images/Icons/AddDel.png" Selectable="False">
                                            <asp:MenuItem Text="Admins" Value="Admins" Selectable="False">
                                                <asp:MenuItem Text="Add" Value="Add" Enabled="False"></asp:MenuItem>
                                                <asp:MenuItem Text="Update/Remove" Value="Update/Remove" Enabled="False"></asp:MenuItem>
                                            </asp:MenuItem>
                                            <asp:MenuItem Text="Workers" Value="Workers" Selectable="False">
                                                <asp:MenuItem Text="Add" Value="Add" Enabled="False"></asp:MenuItem>
                                                <asp:MenuItem Text="Update/Remove" Value="Update/Remove" Enabled="False"></asp:MenuItem>
                                            </asp:MenuItem>
                                            <asp:MenuItem Text="Customers" Value="Customers" Selectable="False">
                                                <asp:MenuItem Text="Update/Remove" Value="Update/Remove" Enabled="False"></asp:MenuItem>
                                            </asp:MenuItem>
                                        </asp:MenuItem>
                                    </Items>
                                    <StaticMenuItemStyle CssClass="MenuImageStyle" Width="50px" BackColor="#FF5500" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="5px"/>
                                    <DynamicMenuItemStyle BackColor="#EE5500" BorderColor="#FF6600" BorderStyle="Solid" BorderWidth="1px"/>
                                </asp:Menu>
                                <ul style="width:fit-content; display:flex;flex-direction:column; align-items:start;list-style-position:inside; list-style-type:disc; margin:0; padding:0">
                                    <li style="margin-bottom:5px">
                                        <asp:Label ID="lblMenu" runat="server" Text="This is a Menu, it alows you to choose kind of user you want to Update/Remove. it also alows you to add users other than customers." style="width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                    <li style="margin-bottom:5px">
                                        <asp:Label ID="lblMenuUpdDel" runat="server" Text="After you click &#8220;Update/Remove&#8220; you will be faced with a grid-view of the entire table of data of the type of user you chose... You can just examine the data, or you can edit or delete it as you wish." style="width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                    <li style="margin-bottom:5px">
                                        <asp:Label ID="lblMenuAdd" runat="server" Text="After you click &#8220;Add&#8220; you will be faced with text-boxes that require you to enter valid data of the type of user you chose." style="width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                </ul>

                            </div>
                            <ul style="width:100%; margin-bottom:10px; display:flex;flex-direction:row; align-items:start; list-style-position:inside; list-style-type:disc; margin:0; padding:0"> 
                                <li>
                                    <asp:Label ID="Label1" runat="server" Text="And Finally, the big button on the top that has the websites logo, will redirect you to the home-page as expected." style="height: 25px; width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                </li>
                            </ul>




                        </div>
                    </div>
                </div>
         </div>
</asp:Content>

