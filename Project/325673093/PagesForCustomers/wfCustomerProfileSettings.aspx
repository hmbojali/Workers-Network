<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForCustomers/mpCustomers.master" AutoEventWireup="true" CodeFile="wfCustomerProfileSettings.aspx.cs" Inherits="PagesForCustomers_wfCustomerProfileSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <div style="margin:50px auto; width:fit-content; height:stretch; background-color:#FFCC66; padding:0 60px 10px" >
             <div style=" margin:40px">
                 <asp:Panel runat="server" style="flex-direction:column; display:flex; align-items:center; list-style-type:none; padding-left:0px" DefaultButton="btnSumbit">
                     <asp:Label ID="lblTitle" runat="server" Text="Account Settings" style="height: 59px; width: auto; margin-top:40px" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="40pt"></asp:Label>
                     <div style="height:auto; max-width:700px; width: contain auto;">
                         <div style="max-width:700px; width: contain auto;display: flex; flex-direction:row; align-items:center; margin-top:20px; margin-bottom:10px">
                             <asp:TextBox ID="txtbxUsername" runat="server" placeholder="Username" Text="" style=" padding:0px; max-width:192px; width:auto; height: 46px;  margin-right:50px;" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Bold="True" Font-Size="30px" ForeColor="Red" ToolTip="You can change your Username here."></asp:TextBox>
                             <asp:TextBox ID="txtbxVerification" runat="server" CssClass="password" placeholder="Verification Password" Text="" style=" padding:0px; width: auto; height: 30px; margin-right:20px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="X-Large" TextMode="Password" ForeColor="Red"></asp:TextBox>
                         </div>
                         <div style="max-width:700px; width: contain auto;display: flex; flex-direction:row; align-items:center; margin-bottom:23px">
                             <asp:TextBox ID="txtbxEmail" runat="server" placeholder="Email" Text="" style=" padding:0px; width: auto; height: 30px; margin-right:30px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="X-Large" ForeColor="Red"></asp:TextBox>
                             <div  style="max-width:200px; margin-right:5px"">
                                 <asp:TextBox ID="txtbxPassword" CssClass="password" runat="server" placeholder="New Password" Text="" style=" padding:0px; max-width:192px; width:auto; height: 20px; margin-bottom:6px; margin-right:5px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="20px" ToolTip="You can change your Password here." TextMode="Password" ForeColor="Red"></asp:TextBox>
                                 <asp:TextBox ID="txtbxPasswordAgain" CssClass="password" runat="server" placeholder="New Password Again" Text="" style=" padding:0px; max-width:192px; width:auto; height: 20px; margin-right:5px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="20px" ToolTip="You can verify your Password here." TextMode="Password" ForeColor="Red"></asp:TextBox>
                             </div>
                             <asp:ImageButton ID="btnShowPassword" CssClass="btnShowPassword" runat="server" style=" width:30px; height:30px" BackColor="#FF9944" BorderColor="#FF9922" BorderStyle="Outset" BorderWidth="3px" OnClientClick="ShowPassword(); return false;" ImageUrl="~/Images/Icons/ShowPassword.png" />

                         </div>
                         <div style="max-width:700px; width: contain auto; display: block;  margin-bottom:17px">
                             <asp:TextBox ID="txtbxName" runat="server" placeholder="Firstname LastName" Text="" style=" padding:0px; width: auto; height: 20px; margin-right:10px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="Large" ForeColor="Red"></asp:TextBox>
                             <asp:Label ID="lblBirthDate" runat="server" Text="Birth date" style=" width: 207px; height: 50px" Font-Size="Large" ForeColor="Red" Font-Bold="True"></asp:Label>
                             <asp:TextBox ID="txtbxBirthDate" runat="server" placeholder="dd/mm/yyyy" style=" padding:0px; width:85px; height:20px; margin-right:20px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="Medium" ForeColor="Red"></asp:TextBox>
                             <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number: " style="width: 207px; height: 50px;" Font-Size="Large" ForeColor="Red" Font-Bold="True"></asp:Label>
                             <asp:TextBox ID="txtbxPhoneNumber" runat="server" style=" padding:0px; width:90px; height:20px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="Medium" ForeColor="Red"></asp:TextBox>
                         </div>
                         <div style="max-width:700px; width: contain auto; display: block;  margin-bottom:15px">
                             <asp:Label ID="lblAddressDescription" runat="server" Text="Address description:" style="width: 207px; height: 50px" Font-Size="Large" ForeColor="Red" Font-Bold="True"></asp:Label>
                             <asp:TextBox ID="txtbxAddressDescription" runat="server" style=" padding:0px; width:250px; height:20px; margin-right:20px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="Medium" ForeColor="Red"></asp:TextBox>
                         </div>
                         <div style="display:flex; flex-direction:row-reverse; width:-webkit-fill-available">
                             <asp:Button ID="btnSumbit" runat="server" Text="Submit" BackColor="#FF5500" BorderColor="#FF3300" BorderStyle="Outset" BorderWidth="4px" Width="120px" Height="40px" OnClick="btnSumbit_Click"/>
                             <div style="display:flex; align-items:center">
                                <asp:RegularExpressionValidator ID="ValidatorEmail" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" ControlToValidate="txtbxEmail" ErrorMessage="Wrong Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="ValidatorPhoneNumber" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" ControlToValidate="txtbxPhoneNumber" ErrorMessage="Wrong Phone Number Format" ValidationExpression="0\d{1,2}-?\d{7}"></asp:RegularExpressionValidator>

                                <asp:Label ID="lblErrorMessage" runat="server"  style="border-left:solid; border-color:red; padding-left:2px" Font-Size="21px" Font-Bold="True" ForeColor="Red" Visible="false">Error</asp:Label>
                             </div>
                         </div>
                     </div>
                 </asp:Panel>     
             </div>
            </div>
                    <script>
                        var Shown = false;
                        function ShowPassword() {
                            Shown = !Shown;
                            if (Shown) {
                                document.getElementsByClassName("password")[0].type = "SingleLine";
                                document.getElementsByClassName("password")[1].type = "SingleLine";
                                document.getElementsByClassName("password")[2].type = "SingleLine";
                                document.getElementsByClassName("btnShowPassword")[0].src = "../Images/Icons/HidePassword.png";
                            }
                            else {
                                document.getElementsByClassName("password")[0].type = "Password";
                                document.getElementsByClassName("password")[1].type = "Password";
                                document.getElementsByClassName("password")[2].type = "Password";
                                var btn = document.getElementsByClassName("btnShowPassword")[0].src = "../Images/Icons/ShowPassword.png";
                            }
                            return false;
                        }
                    </script>

</asp:Content>

