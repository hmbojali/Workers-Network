<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForWorkers/mpWorkers.master" AutoEventWireup="true" CodeFile="wfOrders.aspx.cs" Inherits="PagesForWorkers_wfOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="orderID" DataSourceID="SqlDataSource1" style="margin:10px 0 0 50px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="20px" Font-Strikeout="False" Font-Underline="False" />
        <ItemStyle BackColor="#FFBB44" BorderColor="#DDAA22" BorderStyle="Outset" BorderWidth="5px" />
        <ItemTemplate>
            Order ID:
            <asp:Label ID="orderIDLabel" runat="server" Text='<%# Eval("orderID") %>' />
            <br />
            Customer ID:
            <asp:Label ID="customerIDLabel" runat="server" Text='<%# Eval("customerID") %>' />
            <br />
            workerID:
            <asp:Label ID="workerIDLabel" runat="server" Text='<%# Eval("workerID") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            description:
            <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
            <br />
            orderDate:
            <asp:Label ID="orderDateLabel" runat="server" Text='<%# Eval("orderDate") %>' />
            <br />
            status:
            <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" DeleteCommand="DELETE FROM [tblOrders] WHERE [orderID] = ?" InsertCommand="INSERT INTO [tblOrders] ([orderID], [customerID], [workerID], [title], [description], [orderDate], [status]) VALUES (?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [tblOrders] WHERE ([workerID] = ?)" UpdateCommand="UPDATE [tblOrders] SET [customerID] = ?, [workerID] = ?, [title] = ?, [description] = ?, [orderDate] = ?, [status] = ? WHERE [orderID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="orderID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="orderID" Type="Int32" />
            <asp:Parameter Name="customerID" Type="String" />
            <asp:Parameter Name="workerID" Type="String" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="orderDate" Type="DateTime" />
            <asp:Parameter Name="status" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="56" Name="workerID" SessionField="ID" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="customerID" Type="String" />
            <asp:Parameter Name="workerID" Type="String" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="orderDate" Type="DateTime" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="orderID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

