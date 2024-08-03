<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForCustomers/mpCustomers.master" AutoEventWireup="true" CodeFile="wfHomePageCustomer.aspx.cs" Inherits="PagesForCustomers_wfHomePageCustomer" %>

<%@ Register Src="~/UserControls/wucCustomerOrderListItem.ascx" TagPrefix="MyUserControls" TagName="wucCustomerOrderListItem" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center; margin:30px 0 20px">
                <div style="height:100%; width:-webkit-fill-available; display:flex; flex-direction:row; align-items:center; margin:0 70px">
                    <div style="width:100%; display:flex; flex-direction:column; align-items:center; background-color:#FFBB44; padding: 40px 80px">
                        <div style="width:100%; margin-bottom:60px; display:flex;flex-direction:column; align-items:center">
                             <asp:Label ID="lblWelcome" runat="server" Text="Welcome To Workers Network" style="height: 59px; width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="35pt"></asp:Label>
                             <asp:Label ID="lblWhatToDo" runat="server" Text="In this page, you will learn what you have accessablity to as a customer, and what are the uses of them.." style="width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
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
                            <div style="width:100%; margin-bottom:20px; display:flex;flex-direction:row; align-items:center"> 
                                <asp:Image ID="imgProfileSettings" runat="server" ImageUrl="~/Images/PFPs/Profile-PNG-Clipart4.png" style="z-index:3; height: 60px; width: 60px; margin-right:10px" BackColor="#FF5500" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="5px" OnClick="btnProfileSettings_Click"/>
                                <ul style="list-style-position:inside; list-style-type:disc; margin:0; padding:0">
                                    <li>
                                        <asp:Label ID="Label2" runat="server" Text="This button alows you to edit your profile. You can edit most things. You have to enter your password as a verification to access your data." style="width: auto; " ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                </ul>
                            </div>
                            <div style="width:100%; margin-bottom:20px; display:flex;flex-direction:row; align-items:start"> 
                                <asp:Image ID="imgOrdersButton" runat="server" ImageUrl="~/Images/Icons/OrdersIcon.png" ImageAlign="Middle" style="height:60px; width:60px; margin-right:10px"  BackColor="#FF5500" BorderColor="#FF6600" BorderStyle="Outset" BorderWidth="5px" OnClientClick="ShowList(); return false;"/>
                                <ul style="width:fit-content; display:flex;flex-direction:column; align-items:start;list-style-position:inside; list-style-type:disc; margin:0; padding:0">
                                    <li style="margin-bottom:5px">
                                        <asp:Label ID="lblOrdersButton1" runat="server" Text="This button is a Drop-Down-List for your orders. The list drops down when you press it, and you can retract the list back by pressing it again..." style="width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                    <li style="margin-bottom:5px">
                                        <asp:Label ID="lblOrdersButton2" runat="server" Text="You are also able to see all the details about your order: title, description, worker name, status..." style="width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                    <li style="margin-bottom:5px">
                                        <asp:Label ID="lblOrdersButton3" runat="server" Text="As stated before, you can see the status of your order. There are 4 statuses; &#8220;Pending&#8220;, &#8220;Denied&#8220;, &#8220;Accepted&#8220; and &#8220;Finished&#8220;." style="width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                    <li style="margin-bottom:5px">
                                        <asp:Label ID="lblOrdersButton4" runat="server" Text="You can remove most orders if you decide to. This can be done by pressing the &#8220;Remove&#8220; button on your order. Only orders with the status &#8220;Accepted&#8220; are NOT removable." style="width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                    <li style="margin-bottom:5px; ">
                                        <asp:Label ID="lblOrdersButton5" runat="server" Text="An example of an order as shown in the list:" style="width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                        <MyUserControls:wucCustomerOrderListItem runat="server" ID="wucCustomerOrderListItem" Enabled="false" />
                                    </li>
                                </ul>
                            </div>
                            <div style="width:100%; margin-bottom:20px; display:flex;flex-direction:row; align-items:center"> 
                                <ul style="list-style-position:inside; list-style-type:disc; margin:0; padding:0">
                                    <li style="margin-bottom:5px; ">
                                        <asp:Label ID="Label3" runat="server" Text="You are able to search for the job, or the thing that you want to be done for you, by entering it in the search bar up there. It is PREFERED to use one word only for your search." style="width: auto; " ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                    <li style="margin-bottom:5px; ">
                                        <asp:Label ID="Label4" runat="server" Text="After that, you can click on the worker, that you choose by examining the summary about the worker that is provided in the search page." style="width: auto; " ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                     <li style="margin-bottom:5px; ">
                                        <asp:Label ID="Label5" runat="server" Text="After that, you will be able to see all the important details about the worker in his profile." style="width: auto; " ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                     <li style="margin-bottom:5px; ">
                                        <asp:Label ID="Label6" runat="server" Text="From there, you can make your order. Or you can also rate the worker." style="width: auto; " ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
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

