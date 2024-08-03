<%@ Page Title="" Language="C#"  MasterPageFile="~/PagesForWorkers/mpWorkers.master" AutoEventWireup="true" CodeFile="wfWorkerAccountSettings.aspx.cs" Inherits="PagesForWorkers_wfWorkerAccountSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
          <div style="display:flex; flex-direction:column; align-items:center; margin:50px auto; width:60%; background-color:#FFCC66" >
             <asp:Panel runat="server" style="display:flex; flex-direction:column; align-items:center; padding:35px" DefaultButton="btnSumbit">
                 <asp:Label ID="lblTitle" runat="server" Text="Account Settings" style="height: 59px; width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="40pt"></asp:Label>
                 <ul style="flex-direction:row; display:flex; align-items:center; list-style-type:none; padding-left:0px; margin:30px 0 20px 0">
                     <li style="display:flex; flex-direction:row; align-items:center;">
                         <asp:TextBox ID="txtbxEmail" runat="server" placeholder="Email" Text="" style=" padding:0px; width: auto; height: 30px; margin-right:20px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="X-Large" ForeColor="Red"></asp:TextBox>
                     </li>
                     <li style="display:flex; flex-direction:column; align-items:center;">
                         <asp:TextBox ID="txtbxPassword" CssClass="password" runat="server" placeholder="New Password" Text="" style=" padding:0px; max-width:192px; width:auto; height: 20px; margin-bottom:6px; margin-right:5px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="20px" ToolTip="You can change your Password here." TextMode="Password" ForeColor="Red"></asp:TextBox>
                         <asp:TextBox ID="txtbxPasswordAgain" CssClass="password" runat="server" placeholder="New Password Again" Text="" style=" padding:0px; max-width:192px; width:auto; height: 20px; margin-right:5px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="20px" ToolTip="You can verify your Password here." TextMode="Password" ForeColor="Red"></asp:TextBox>
                     </li>
                     <asp:ImageButton ID="btnShowPassword" CssClass="btnShowPassword" runat="server" style=" width:30px; height:30px" BackColor="#FF9944" BorderColor="#FF9922" BorderStyle="Outset" BorderWidth="3px" OnClientClick="ShowPassword(); return false;" ImageUrl="~/Images/Icons/ShowPassword.png" />
                 </ul>
                 <div style="margin-bottom:15px">
                     <asp:TextBox ID="txtbxVerification" runat="server" CssClass="password" placeholder="Verification Password" Text="" style=" padding:0px; width: auto; height: 30px; margin-right:20px" BackColor="#FFBB44" BorderColor="#FF9922" BorderStyle="Outset" Font-Size="X-Large" TextMode="Password" ForeColor="Red"></asp:TextBox>
                 </div>
                 <div style="display:flex; flex-direction:row; width:100%">
                     <div style="display:flex; flex-direction:row-reverse; width:-webkit-fill-available">
                         <asp:Button ID="btnSumbit" runat="server" Text="Submit" BackColor="#FF5500" BorderColor="#FF3300" BorderStyle="Outset" BorderWidth="4px" Width="120px" Height="40px" OnClick="btnSumbit_Click"/>
                         <div style="display:flex; align-items:center">
                             <asp:RegularExpressionValidator ID="ValidatorEmail" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" ControlToValidate="txtbxEmail" ErrorMessage="Wrong Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                             <asp:Label ID="lblErrorMessage" runat="server" Text="" style="margin-right:20px; font-size:large; font-weight:700;" ForeColor="Red" Visible="true"></asp:Label>
                         </div>
                     </div>
                 </div>
             </asp:Panel>
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

