<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wfStartingPage.aspx.cs" Inherits="PagesForVisitors_wfStartingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="height:99%">
<head runat="server">
    <title></title>
</head>
<body style="height:100%; background-color:#FFDD77">
    <form id="form1" runat="server" style="height:100%">
        <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center;">
            <div style="width:70%; height:100%; display:flex; flex-direction:row; align-items:center;">
               <ul style="width:100%; display:flex; flex-direction:column; align-items:center; list-style-type:none; padding: 80px 0 80px 0; background-color:#FFBB44; border-block-end-color:#FF9922;"  >
                  <li style="margin-bottom:20px; display:flex; flex-direction:column; align-items:center">
                      <asp:Label ID="lblWelcome" runat="server" Text="Welcome To Workers Network" style="height: 59px; width: auto; margin-bottom:10px" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="45pt"></asp:Label>
                     <asp:Label ID="lblChoice" runat="server" Text="You want to use this website as a..." style="height: 59px; width: auto;" ForeColor="#FF2200" Font-Bold="True" Font-Italic="False" Font-Size="20pt"></asp:Label>
                  </li>
                  <li style="width:80%">
                      <ul style="padding:0px; list-style-type:none; display:flex; flex-direction:row; width:100%">
                          <li style="width:50%; display:flex; flex-direction:column; align-items:center">
                             <asp:Button ID="btnWorker" runat="server" Text="Worker" style=" height: 153px; width: 320px;" BackColor="#FF5500" ForeColor="#DD0000" BorderColor="#FF3300" BorderStyle="Outset" BorderWidth="4px" Font-Size="35pt" OnClick="btnWorker_Click"/>
                          </li>
                          <li style="width:50%; display:flex; flex-direction:column; align-items:center">
                             <asp:Button ID="btnCustomer" runat="server" Text="Customer" style="height: 153px; width: 320px;" ForeColor="#DD0000" BackColor="#FF5500" BorderColor="#FF3300" BorderStyle="Outset" BorderWidth="4px" Font-Bold="False" Font-Size="35pt" OnClick="btnCustomer_Click"/>
                          </li>
                      </ul>
                  </li>
               </ul>
            </div>
        </div>
         


    </form>
</body>
</html>
