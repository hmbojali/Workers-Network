<%@ Page Title="" Language="C#" MasterPageFile="~/PagesForAdmin/mpAdmins.master" AutoEventWireup="true" CodeFile="wfUpdDelAdmin.aspx.cs" Inherits="PagesForAdmin_wfUpdDelAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center; margin-top:100px">
                <div style="height:100%; display:flex; flex-direction:row; align-items:center;">
                    <div style="width:100%; display:flex; flex-direction:column; align-items:center; background-color:#FFBB44; padding: 80px 80px;">
                       <div style="display:flex; flex-direction:column; align-items:center" class="GridViewStyle">
                            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" EnableModelValidation="True" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="adminID">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField ControlStyle-CssClass="BoundFieldStyle" DataField="adminID" HeaderText="adminID" ReadOnly="True" SortExpression="adminID" InsertVisible="False" >
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="firstName" SortExpression="firstName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBoxStyle" Text='<%# Bind("firstName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("firstName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="lastName" SortExpression="lastName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBoxStyle" Text='<%# Bind("lastName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("lastName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="email" SortExpression="email">
                                    <EditItemTemplate>
                                        <div class="EditItemTemplate">
                                            <asp:TextBox ID="txtbxEmail" runat="server" CssClass="TextBoxStyle" Text='<%# Bind("email") %>'></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="ValidatorEmail" runat="server" style="margin-right:5px; border-left:solid; border-color:red; padding-left:2px" Font-Size="16px" Font-Bold="True" ForeColor="Red" ControlToValidate="txtbxEmail" ErrorMessage="Wrong Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Visible="true"></asp:RegularExpressionValidator>
                                        </div>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="userName" SortExpression="userName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="TextBoxStyle" Text='<%# Bind("userName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("userName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="password" SortExpression="password">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="TextBoxStyle" Text='<%# Bind("password") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                                <HeaderStyle ForeColor="#DD0000" Font-Bold="true" Font-Size="20px" />
                                <RowStyle Font-Size="16px" ForeColor="Red" HorizontalAlign="Center"/>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" DeleteCommand="DELETE FROM [tblAdmins] WHERE [adminID] = ?" InsertCommand="INSERT INTO [tblAdmins] ([adminID], [firstName], [lastName], [email], [userName], [password]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [tblAdmins]" UpdateCommand="UPDATE [tblAdmins] SET [firstName] = ?, [lastName] = ?, [email] = ?, [userName] = ?, [password] = ? WHERE [adminID] = ?">
                            <DeleteParameters>
                                <asp:Parameter Name="adminID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="adminID" Type="Int32" />
                                <asp:Parameter Name="firstName" Type="String" />
                                <asp:Parameter Name="lastName" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter Name="userName" Type="String" />
                                <asp:Parameter Name="password" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="firstName" Type="String" />
                                <asp:Parameter Name="lastName" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter Name="userName" Type="String" />
                                <asp:Parameter Name="password" Type="String" />
                                <asp:Parameter Name="adminID" Type="Int32" />
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

