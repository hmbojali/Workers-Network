<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForAdmin/mpAdmins.master" AutoEventWireup="true" CodeFile="wfUpdDelCustomer.aspx.cs" Inherits="PagesForAdmin_wfUpdDelCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center; margin-top:100px">
                <div style="height:100%; display:flex; flex-direction:row; align-items:center;">
                    <div style="width:100%; height:stretch; display:flex; flex-direction:column; align-items:center; background-color:#FFBB44; padding: 80px 80px;">
                       <div style="display:flex; flex-direction:column; align-items:center" class="GridViewStyle">
                            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" EnableModelValidation="True" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="customerID">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="customerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="customerID" >
                                </asp:BoundField>
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="firstName" HeaderText="FirstName" SortExpression="firstName" >
                                </asp:BoundField>
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="lastName" HeaderText="LastName" SortExpression="lastName" >
                                </asp:BoundField>
                                <asp:TemplateField  HeaderText="BirthDate(US)" SortExpression="dateOfBirth">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate" operator="DataTypeCheck">
                                            <asp:TextBox ID="txtbxDateOfBirth" runat="server" CssClass="TextBoxStyle" Text='<%# Bind("dateOfBirth","{0:d}") %>'></asp:TextBox>
                                            <asp:CompareValidator ID="ValidatorDateOfBirth" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" Font-Size="16px" Font-Bold="True" ForeColor="Red" ControlToValidate="txtbxDateOfBirth" ErrorMessage="Wrong Date Format" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator> 
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateOfBirth" runat="server" Text='<%# Bind("dateOfBirth","{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PhoneNumber" SortExpression="phoneNumber">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                            <asp:TextBox ID="txtbxPhoneNumber" runat="server" CssClass="TextBoxStyle" Text='<%# Bind("phoneNumber") %>'></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="ValidatorPhoneNumber" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" Font-Size="16px" Font-Bold="True" ForeColor="Red" ControlToValidate="txtbxPhoneNumber" ErrorMessage="Wrong Phone Number Format" ValidationExpression="0\d{1,2}-?\d{7}" Visible="true"></asp:RegularExpressionValidator>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" SortExpression="email">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                            <asp:TextBox ID="txtbxEmail" runat="server" CssClass="TextBoxStyle" Text='<%# Bind("email") %>'></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="ValidatorEmail" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" Font-Size="16px" Font-Bold="True" ForeColor="Red" ControlToValidate="txtbxEmail" ErrorMessage="Wrong Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Visible="true"></asp:RegularExpressionValidator>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="userName" HeaderText="Username" SortExpression="userName" >
                                </asp:BoundField>
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="password" HeaderText="Password" SortExpression="password" >
                                </asp:BoundField>
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="addressDescription" HeaderText="AddressDescription" SortExpression="addressDescription" >
                                </asp:BoundField>
                            </Columns>
                                <HeaderStyle ForeColor="#DD0000" Font-Bold="true" Font-Size="20px" />
                                <RowStyle Font-Size="16px" ForeColor="Red" HorizontalAlign="Center"/>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" DeleteCommand="DELETE FROM [tblCustomers] WHERE [customerID] = ?" InsertCommand="INSERT INTO [tblCustomers] ([customerID], [firstName], [lastName], [dateOfBirth], [phoneNumber], [email], [userName], [password], [addressDescription]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [tblCustomers]" UpdateCommand="UPDATE [tblCustomers] SET [firstName] = ?, [lastName] = ?, [dateOfBirth] = ?, [phoneNumber] = ?, [email] = ?, [userName] = ?, [password] = ?, [addressDescription] = ? WHERE [customerID] = ?">
                            <DeleteParameters>
                                <asp:Parameter Name="customerID" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="customerID" Type="String" />
                                <asp:Parameter Name="firstName" Type="String" />
                                <asp:Parameter Name="lastName" Type="String" />
                                <asp:Parameter Name="dateOfBirth" Type="DateTime" />
                                <asp:Parameter Name="phoneNumber" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter Name="userName" Type="String" />
                                <asp:Parameter Name="password" Type="String" />
                                <asp:Parameter Name="addressDescription" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="firstName" Type="String" />
                                <asp:Parameter Name="lastName" Type="String" />
                                <asp:Parameter Name="dateOfBirth" Type="DateTime" />
                                <asp:Parameter Name="phoneNumber" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter Name="userName" Type="String" />
                                <asp:Parameter Name="password" Type="String" />
                                <asp:Parameter Name="addressDescription" Type="String" />
                                <asp:Parameter Name="customerID" Type="String" />
                            </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
        </div>
    <style>
        .GridViewStyle{
            max-width:90%;
            display:flex;
            flex-direction:row;
            align-items:start;
        }
        .BoundFieldStyle{
            width:80%;
            background-color:#FF9922;
            color:red;
            font-size:16px;
            border-color:#FF7700;
            border-style:outset
        }
        .TextBoxStyle{
            width:80%;
            background-color:#FF9922;
            color:red;
            font-size:16px;
            border-color:#FF7700;
            border-style:outset
        }
        .EditItemTemplate{
            display:flex;
            flex-direction:row;
            align-items:center;
        }

    </style>
</asp:Content>

