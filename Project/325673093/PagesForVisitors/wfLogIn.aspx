<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wfLogIn.aspx.cs" Inherits="WebForms_wfLogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="height:99%">
<head runat="server">
    <title></title>
</head>
<body style="height:100%; background-color:#FFDD77">
    <form id="form1" runat="server" style="height:100%">
        <var id="IsCustomer" runat="server" visible="false"></var>
        <var id="ID" runat="server" visible="false"></var>
        <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center;">
            <div style="width:60%; height:100%; display:flex; flex-direction:row; align-items:center;">
                <div style="width:100%; height:stretch; display:flex; flex-direction:column; align-items:center; background-color:#FFBB44; padding: 80px 0 80px 0;">
                   <div style="display:flex; flex-direction:column">
                        <ul style="width:fit-content; height:stretch; display:flex; flex-direction:column; align-items:center; list-style-type:none; padding:0; background-color:#FFBB44;"  >
                          <li style="margin-bottom:10px; display:flex;flex-direction:column; align-items:center">
                             <asp:Label ID="lblWelcome" runat="server" Text="Welcome To Workers Network" style="height: 59px; width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="35pt"></asp:Label>
                             <asp:Label ID="lblWhatToDo" runat="server" Text="Please enter the following to log in" style="height: 59px; width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="15pt"></asp:Label>
                          </li>
                           <li style="display:flex; flex-direction:column; align-items:center; background-color:#FFAA33; padding:30px">
                               
                               <asp:Login ID="Login" runat="server" Font-Bold="True" ForeColor="#FF2200" TitleText="" UserNameLabelText="Email:" UserNameRequiredErrorMessage="Email is required." OnAuthenticate="Login_Authenticate">
                                   <CheckBoxStyle Height="40px" HorizontalAlign="Left" VerticalAlign="Bottom" />
                                   <LabelStyle Font-Size="30px" HorizontalAlign="Center" />
                                   <LoginButtonStyle BackColor="#FF5500" BorderColor="#FF3300" BorderStyle="Outset" BorderWidth="4px" Font-Size="18px" ForeColor="#BB0000" Height="40px" Width="100px" />
                                   <TextBoxStyle BackColor="#FF9922" BorderColor="#FF7700" BorderStyle="Outset" Font-Size="20px" />
                                   <ValidatorTextStyle Font-Size="15px" />
                               </asp:Login>
                               
                           </li>
                       </ul>
                       <div style="display:flex; align-items:center">
                                <asp:Label ID="lblErrorMessage" runat="server" style="margin-right:15px" Font-Size="23px" Font-Bold="True" ForeColor="Red" Visible="false">Error</asp:Label>
                             </div>
                   </div>
                </div>
            </div> 

        </div> 
    </form>
</body>
</html>

