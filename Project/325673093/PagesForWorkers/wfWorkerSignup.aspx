<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wfWorkerSignup.aspx.cs" Inherits="PagesForWorkers_wfWorkerSignup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="height:99%">
<head runat="server">
    <title></title>
</head>
<body style="height:100%; background-color:#FFDD77">
    <form id="formWorker" runat="server" style="height:100%">
        <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center;">
            <div style="width:60%; height:100%; display:flex; flex-direction:row; align-items:center;">
                <div style="width:100%; height:stretch; display:flex; flex-direction:column; align-items:center; background-color:#FFBB44; padding: 80px 0 80px 0;">
                   <div style="display:flex; flex-direction:column; align-items:center">
                        <ul style="width:fit-content; height:stretch; display:flex; flex-direction:column; align-items:center; list-style-type:none; padding:0; background-color:#FFBB44;"  >
                          <li style="margin-bottom:10px; display:flex;flex-direction:column; align-items:center">
                             <asp:Label ID="lblWelcom" runat="server" Text="Welcome To Workers Network" style="height: 59px; width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="35pt"></asp:Label>
                             <asp:Label ID="lblWhatToDo" runat="server" Text="Please enter the following to sign up" style="height: 25px; width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                             <asp:LinkButton ID="lnkToLogin" runat="server" style="margin-bottom:30px" OnClick="lnkToLogin_Click">Have An Account?</asp:LinkButton>
                          </li>
                           <li style="display:flex; flex-direction:column; align-items:center; background-color:#FFAA33; padding:30px">
                               <div style="display:flex; flex-direction:row; align-items:center; margin-bottom:20px">
                                   <asp:Label ID="lblEmail" runat="server" Text="Email" style="height: 30px; margin-right:15px" ForeColor="#FF2200" Font-Bold="true" Font-Size="30px"></asp:Label>
                                   <asp:TextBox ID="inputEmail" runat="server" style="height: 30px; width:250px" BackColor="#FF9922" ForeColor="Red" Font-Size="20px" BorderColor="#FF7700" BorderStyle="Outset" Visible="True"></asp:TextBox>

                                   <asp:Label ID="lblWorkerID" runat="server" Text="ID Number"  style="height: 30px; margin-right:15px" ForeColor="#FF2200" Font-Bold="true" Font-Size="30px" Visible="False"></asp:Label>
                                   <asp:TextBox ID="inputWokerID" runat="server" placeholder="..." style="height: 30px; width:120px; margin-right:40px" ForeColor="Red" Font-Size="20px" BackColor="#FF9922" BorderColor="#FF7700" BorderStyle="Outset" Visible="False"></asp:TextBox>
                               
                                   <asp:Label ID="lblDateOfBirth" runat="server" Text="Birth Date"  style="height: 30px; margin-right:15px" ForeColor="#FF2200" Font-Bold="true" Font-Size="30px" Visible="False"></asp:Label>
                                   <asp:TextBox ID="inputDateOfBirth" runat="server" placeholder="dd/mm/yyyy" style="height: 30px; width:110px" ForeColor="Red" Font-Size="20px" BackColor="#FF9922" BorderColor="#FF7700" BorderStyle="Outset" Visible="False"></asp:TextBox>
                             
                                   <asp:Label ID="lblUserName" runat="server" Text="UserName" style="height: 30px; margin-right:15px" ForeColor="#FF2200" Font-Bold="true" Font-Size="30px" Visible="False"></asp:Label>
                                   <asp:TextBox ID="inputUserName" runat="server" style="height: 30px; width:100px; margin-right:40px" ForeColor="Red" Font-Size="20px" BackColor="#FF9922" BorderColor="#FF7700" BorderStyle="Outset" Visible="False"></asp:TextBox>
                                   <asp:Label ID="lblPhoneNumber" runat="server" Text="PhoneNumber"  style="height: 30px; margin-right:15px" ForeColor="#FF2200" Font-Bold="true" Font-Size="30px" Visible="False"></asp:Label>
                                   <asp:TextBox ID="inputPhoneNumber" runat="server" style="height: 30px; width:120px" ForeColor="Red" Font-Size="20px" BackColor="#FF9922" BorderColor="#FF7700" BorderStyle="Outset" Visible="False"></asp:TextBox>
                               </div>
                               <div style="display:flex; flex-direction:row; align-items:center">
                                   <asp:Label ID="lblPassword" runat="server" Text="Password" style="height: 30px; margin-right:15px"  ForeColor="#FF2200" Font-Bold="true" Font-Size="30px"></asp:Label>
                                   <asp:TextBox ID="inputPassword" runat="server" style="height: 30px; width:200px; margin-right:15px" ForeColor="Red" Font-Size="20px" TextMode="Password" BackColor="#FF9922" BorderColor="#FF7700" BorderStyle="Outset" Visible="true"></asp:TextBox>
                                   <asp:TextBox ID="inputPasswordAgain" runat="server" style="height: 30px; width:200px" ForeColor="Red" Font-Size="20px" TextMode="Password" BackColor="#FF9922" BorderColor="#FF7700" BorderStyle="Outset" Visible="true"></asp:TextBox>
                                   
                                   <asp:Label ID="lblName" runat="server" Text="Name"  style="height: 30px; margin-right:15px" ForeColor="#FF2200" Font-Bold="true" Font-Size="30px" Visible="False"></asp:Label>
                                   <asp:TextBox ID="inputFirstName" runat="server" placeholder="First name" style="height: 30px; width:200px; margin-right:10px" ForeColor="Red" Font-Size="20px" BackColor="#FF9922" BorderColor="#FF7700" BorderStyle="Outset" Visible="False"></asp:TextBox>
                                   <asp:TextBox ID="inputLastName" runat="server" placeholder="Last name" style="height: 30px; width:200px" ForeColor="Red" Font-Size="20px" BackColor="#FF9922" BorderColor="#FF7700" BorderStyle="Outset" Visible="False"></asp:TextBox>

                                   <asp:Label ID="lblProfession" runat="server" Text="Profession"  style="height: 30px; margin-right:15px" ForeColor="#FF2200" Font-Bold="true" Font-Size="30px" Visible="False"></asp:Label>
                                   <asp:TextBox ID="inputProfession" runat="server" style="height: 30px; width:150px; margin-right:40px" ForeColor="Red" Font-Size="20px" BackColor="#FF9922" BorderColor="#FF7700" BorderStyle="Outset" Visible="False"></asp:TextBox>
                               </div>
                           </li>
                       </ul>
                        <div style="width:100%; display:flex;flex-direction:row-reverse;align-items:end center; padding:0 0 0 0px">
                         <asp:Button ID="btnSumbit" runat="server" Text="Next" ForeColor="#BB0000" Font-Size="18px" BackColor="#FF5500" BorderColor="#FF3300" BorderStyle="Outset" BorderWidth="4px" Width="120px" Height="40px" OnClick="btnSumbit_Click"/>
                             <div style="display:flex; flex-direction:row; align-items:center; margin-right:15px">
                                <asp:RegularExpressionValidator ID="ValidatorEmail" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" ControlToValidate="inputEmail" ErrorMessage="Wrong Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Visible="true"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="ValidatorID" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" ControlToValidate="inputWokerID" ErrorMessage="Wrong ID Format" ValidationExpression="\d{9}" Visible="false"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="ValidatorPhoneNumber" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" ControlToValidate="inputPhoneNumber" ErrorMessage="Wrong Phone Number Format" ValidationExpression="0\d{1,2}-?\d{7}" Visible="false"></asp:RegularExpressionValidator>

                                <asp:Label ID="lblErrorMessage" runat="server"  style="border-left:solid; border-color:red; padding-left:2px" Font-Size="21px" Font-Bold="True" ForeColor="Red" Visible="false">Error</asp:Label>
                             </div>
                        </div>
                   </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
