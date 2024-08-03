<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <style>
        .MenuImageStyle {} /*Style code for each menu item goes here. */
.MenuImageStyle img 
{
  width: 50px;
  height: 50px;
}
    </style>
    <form id="form1" runat="server">
        <span id="array_disp"></span>
        <br />

        <asp:Button ID="btnCS" style="display:none" runat="server" Text="Submit" OnClick="btnCS_Click" />
        <asp:Label ID="lbl" runat="server" Text=""></asp:Label>

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClientClick="UpdateArray()" />
        <input type="text" id="array_store" name="ArrayStore" value='<%=this.ArrayStore %>' />
    </form>

</body>
</html>
