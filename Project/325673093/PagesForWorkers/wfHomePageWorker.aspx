<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForWorkers/mpWorkers.master" AutoEventWireup="true" CodeFile="wfHomePageWorker.aspx.cs" Inherits="PagesForWorkers_wfHomePageWorker" %>

<%@ Register Src="~/UserControls/wucWorkerOrderListItem.ascx" TagPrefix="MyUserControls" TagName="wucWorkerOrderListItem" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center; margin:30px 0 20px">
                <div style="height:100%; width:-webkit-fill-available; display:flex; flex-direction:row; align-items:center; margin:0 70px">
                    <div style="width:100%; display:flex; flex-direction:column; align-items:center; background-color:#FFBB44; padding: 40px 80px">
                        <div style="width:100%; margin-bottom:60px; display:flex;flex-direction:column; align-items:center">
                             <asp:Label ID="lblWelcome" runat="server" Text="Welcome To Workers Network" style="height: 59px; width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="35pt"></asp:Label>
                             <asp:Label ID="lblWhatToDo" runat="server" Text="In this page, you will learn what you have accessablity to as a worker, and what are the uses of them.." style="width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
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
                                        <asp:Label ID="Label2" runat="server" Text="This button alows you to edit your profile. You can edit most things shown in your profile to the public." style="width: auto; " ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                    <li>
                                        <asp:Label ID="Label7" runat="server" Text="From there, you can also press the button that says &#8220;Account Settings&#8220;, and then change your account settings." style="width: auto; " ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
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
                                        <asp:Label ID="lblOrdersButton4" runat="server" Text="You are the one in control of the statuses. You can set the status to &#8220;Accepted&#8220;, by pressing &#8220;Accept&#8220; and so on." style="width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                    <li style="margin-bottom:5px">
                                        <asp:Label ID="lblOrdersButton5" runat="server" Text="You can not remove orders. You can only deny them. This is so the customer knows what happens with their order." style="width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                    <li style="margin-bottom:5px; ">
                                        <asp:Label ID="lblOrdersButton6" runat="server" Text="An example of an order with the &#8220;Pending&#8220; status as shown in the list:" style="width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                        
                                        <div style="background-color:#FF6600; border-color:#FF6600; border-style:outset; border-width:6px; width:450px; margin-top:5px">
                                            <div style="display:flex; flex-direction:column; align-items:start; padding:10px 10px 10px 10px; width:95%; height:95%; direction: ltr;">
                                                <div style="display:flex; flex-direction:row; align-items:center; width:100%">
                                                    <div style="display:flex; flex-direction:row; align-items:center; width:100%">
                                                        <asp:Label ID="lblTitle" runat="server" Text="Title" Font-Bold="True" Font-Size="40px"></asp:Label>
                                                        <asp:Label ID="lblStatus" runat="server" CssClass="Status" Text="Pending" style="align-self:end; padding:0 0 6px 10px"></asp:Label>
                                                    </div>
                                                    <asp:Button ID="btnDeny" runat="server" CssClass="AcceptDeny" Text="Deny" style="text-align:center; height:25px; width:90px" ForeColor="#880000" BackColor="#EE0000" BorderColor="#EE0000" BorderStyle="Outset" BorderWidth="4px" Enabled="false" />
                                                    <asp:Button ID="btnAccept" runat="server" CssClass="AcceptDeny" Text="Accept" style="text-align:center; height:25px; width:90px" ForeColor="#004400"  BackColor="#099000" BorderColor="#099000" BorderStyle="Outset" BorderWidth="4px" Enabled="false" />
           
                                                    <asp:Button ID="btnFinish" runat="server" CssClass="Finish" Text="Finish" style="display:none; text-align:center; height:25px; width:90px" ForeColor="#004400"  BackColor="#099000" BorderColor="#099000" BorderStyle="Outset" BorderWidth="4px" Enabled="false" />
                                                    <asp:ImageButton ID="btnCancel" runat="server" CssClass="ConfirmCancel" ImageUrl="~/Images/Icons/XCancel.png" style="display:none; height: 25px; width: 25px; margin-right:15px" BackColor="#DD0000" BorderColor="#DD0000" BorderStyle="Outset" BorderWidth="5px" Enabled="false" />
                                                    <asp:ImageButton ID="btnConfirm" runat="server" CssClass="ConfirmCancel" ImageUrl="~/Images/Icons/VConfirm.png" style="display:none; height: 25px; width: 25px;" BackColor="#099000" BorderColor="#099000" BorderStyle="Outset" BorderWidth="5px" Enabled="false"/>

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

                                    </li>
                                </ul>
                            </div>
                            <div style="width:100%; margin-bottom:20px; display:flex;flex-direction:row; align-items:center"> 
                                <ul style="list-style-position:inside; list-style-type:disc; margin:0; padding:0">
                                    <li style="margin-bottom:5px; ">
                                        <asp:Label ID="Label3" runat="server" Text="You can search for workers by entering the job name, or the thing that they can do (that they have listed), in the search bar." style="width: auto; " ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                    <li style="margin-bottom:5px; ">
                                        <asp:Label ID="Label4" runat="server" Text="After that, you can click on the worker, that you choose by examining the summary about the worker that is provided in the search page." style="width: auto; " ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                     <li style="margin-bottom:5px; ">
                                        <asp:Label ID="Label5" runat="server" Text="After that, you will be able to see all the important details about the worker in his profile." style="width: auto; " ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                                    </li>
                                     <li style="margin-bottom:5px; ">
                                        <asp:Label ID="Label6" runat="server" Text="As a worker, you can NOT make orders or rate workers. This feature is only available for customers." style="width: auto; " ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
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


